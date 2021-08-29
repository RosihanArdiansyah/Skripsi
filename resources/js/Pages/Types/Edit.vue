<template>
  <div>
    <div class="mb-8 flex justify-start max-w-3xl">
      <h1 class="font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('types')">types</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        {{ form.name }}
      </h1>
      <img v-if="type.photo" class="block w-8 h-8 rounded-full ml-4" :src="type.photo" />
    </div>
    <trashed-message v-if="type.deleted_at" class="mb-6" @restore="restore">
      type ini telah dihapus.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden max-w-3xl">
      <form @submit.prevent="update">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.name" :error="form.errors.name" class="pr-6 pb-8 w-full" label="name" />
        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex items-center">
          <button v-if="!type.deleted_at" class="text-red-600 hover:underline" tabindex="-1" type="button" @click="destroy">Hapus type</button>
          <loading-button :loading="form.processing" class="btn-indigo ml-auto" type="submit">Ubah type</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import TextInput from '@/Shared/TextInput'
import LoadingButton from '@/Shared/LoadingButton'
import TrashedMessage from '@/Shared/TrashedMessage'

export default {
  metaInfo() {
    return {
      title: `${this.form.name}`,
    }
  },
  components: {
    LoadingButton,
    TextInput,
    TrashedMessage, 
  },
  layout: Layout,
  props: {
    type: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        name: this.type.name,
      }),
    }
  },
  methods: {
    update() {
      this.form.post(this.route('types.update', this.type.id))
    },
    destroy() {
      if (confirm('Apakah anda ingin menghapus type ini?')) {
        this.$inertia.delete(this.route('types.destroy', this.type.id))
      }
    },
    restore() {
      if (confirm('Apakah anda ingin mengembalikan type ini?')) {
        this.$inertia.put(this.route('types.restore', this.type.id))
      }
    },
  },
}
</script>
