<template>
  <div>
    <div class="mb-8 flex justify-start max-w-3xl">
      <h1 class="font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('users')">Users</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        {{ form.first_name }} {{ form.last_name }}
      </h1>
      <img v-if="user.photo" class="block w-8 h-8 rounded-full ml-4" :src="user.photo" />
    </div>
    <trashed-message v-if="user.deleted_at" class="mb-6" @restore="restore">
      User ini telah dihapus.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden max-w-3xl">
      <form @submit.prevent="update">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.first_name" :error="form.errors.first_name" class="pr-6 pb-8 w-full" label="First name" />
          <text-input v-model="form.last_name" :error="form.errors.last_name" class="pr-6 pb-8 w-full" label="Last name" />
          <text-input v-model="form.email" :error="form.errors.email" class="pr-6 pb-8 w-full" label="Email" />
          <text-input v-model="form.password" :error="form.errors.password" class="pr-6 pb-8 w-full" type="password" autocomplete="new-password" label="Password" />
          <select-input v-model="form.owner" :error="form.errors.owner" class="pr-6 pb-8 w-full" label="Owner">
            <option :value="true">Yes</option>
            <option :value="false">No</option>
          </select-input>
          <file-input v-model="form.photo" :error="form.errors.photo" class="pr-6 pb-8 w-full" type="file" accept="image/*" label="Photo" />
        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex items-center">
          <button v-if="!user.deleted_at" class="text-red-600 hover:underline" tabindex="-1" type="button" @click="destroy">Hapus User</button>
          <loading-button :loading="form.processing" class="btn-indigo ml-auto" type="submit">Ubah User</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import TextInput from '@/Shared/TextInput'
import FileInput from '@/Shared/FileInput'
import SelectInput from '@/Shared/SelectInput'
import LoadingButton from '@/Shared/LoadingButton'
import TrashedMessage from '@/Shared/TrashedMessage'

export default {
  metaInfo() {
    return {
      title: `${this.form.first_name} ${this.form.last_name}`,
    }
  },
  components: {
    FileInput,
    LoadingButton,
    SelectInput,
    TextInput,
    TrashedMessage, 
  },
  layout: Layout,
  props: {
    user: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        first_name: this.user.first_name,
        last_name: this.user.last_name,
        email: this.user.email,
        NIM: this.user.NIM,
        department: this.user.department,
        password: null,
        owner: this.user.owner,
        photo: null,
      }),
    }
  },
  created(){
    console.log(this.form)
  },
  methods: {
    update() {
      this.form.post(this.route('users.update', this.user.id), {
        onSuccess: () => this.form.reset('password', 'photo'),
      })
    },
    destroy() {
      if (confirm('Apakah anda ingin menghapus user ini?')) {
        this.$inertia.delete(this.route('users.destroy', this.user.id))
      }
    },
    restore() {
      if (confirm('Apakah anda ingin mengembalikan user ini?')) {
        this.$inertia.put(this.route('users.restore', this.user.id))
      }
    },
  },
}
</script>
