<template>
  <div>
    <div class="mb-8 flex justify-start max-w-3xl">
      <h1 class="mb-8 font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('docs')">docs</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        {{ form.docs_name }}
      </h1>
      <img v-if="doc.coverImg" class="block w-8 h-8 rounded-full ml-4" :src="doc.coverImg" />
    </div>
    <trashed-message v-if="doc.deleted_at" class="mb-6" @restore="restore">
      This docs has been deleted.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden max-w-3xl">
      <form @submit.prevent="update">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.docs_name" :error="form.errors.docs_name" class="pr-6 pb-8 w-full lg:w-1/2" label="Name" />
          <file-input v-model="form.coverImg" :error="form.errors.coverImg" class="pr-6 pb-8 w-full lg:w-1/2" type="file" accept="image/*" label="Cover" />
          <file-input v-model="form.pdf" :error="form.errors.pdf" class="pr-6 pb-8 w-full lg:w-1/2" type="file" accept=".pdf" label="Files" />
        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex items-center">
          <button v-if="!doc.deleted_at" class="text-red-600 hover:underline" tabindex="-1" type="button" @click="destroy">Delete docs</button>
          <loading-button :loading="form.processing" class="btn-indigo ml-auto" type="submit">Update docs</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Icon from '@/Shared/Icon'
import Layout from '@/Shared/Layout'
import TextInput from '@/Shared/TextInput'
import FileInput from '@/Shared/FileInput'
import SelectInput from '@/Shared/SelectInput'
import LoadingButton from '@/Shared/LoadingButton'
import TrashedMessage from '@/Shared/TrashedMessage'

export default {
  metaInfo() {
    return { title: this.form.docs_name }
  },
  components: {
    Icon,
    FileInput,
    LoadingButton,
    SelectInput,
    TextInput,
    TrashedMessage,
  },
  layout: Layout,
  props: {
    doc: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method:'put',
        docs_name: this.doc.docs_name,
        coverImg : null,
        pdf: null
      }),
    }
  },
  methods: {
    update() {
      this.form.post(this.route('docs.update', this.doc.id), {
        onSuccess: () => this.form.reset('coverImg', 'pdf'),
      })
    },
    destroy() {
      if (confirm('Are you sure you want to delete this docs?')) {
        this.$inertia.delete(this.route('docs.destroy', this.doc.id))
      }
    },
    restore() {
      if (confirm('Are you sure you want to restore this docs?')) {
        this.$inertia.put(this.route('docs.restore', this.doc.id))
      }
    },
  },
}
</script>
