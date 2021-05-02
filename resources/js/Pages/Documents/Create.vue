<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">
      <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('docs')">Documents</inertia-link>
      <span class="text-indigo-400 font-medium">/</span> Create
    </h1>
    <div class="bg-white rounded-md shadow overflow-hidden max-w-3xl">
      <form @submit.prevent="store">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.docs_name" :error="form.errors.docs_name" class="pr-6 pb-8 w-full" label="Name" />
          <text-input v-model="form.author" :error="form.errors.author" class="pr-6 pb-8 w-full" label="Author" />
          <text-input v-model="form.NIM" :error="form.errors.NIM" class="pr-6 pb-8 w-full" label="Stambuk" />
          <num-input v-model="form.year" :error="form.errors.year" class="pr-6 pb-8 w-full" label="Year" />
          <text-input v-model="form.department" :error="form.errors.department" class="pr-6 pb-8 w-full" label="Department" />
          <file-input v-model="form.pdf" :error="form.errors.pdf" class="pr-6 pb-8 w-full" type="file" accept=".pdf" label="Files" />
        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex justify-end items-center">
          <loading-button :loading="form.processing" class="btn-indigo" type="submit">Create Documents</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import TextInput from '@/Shared/TextInput'
import FileInput from '@/Shared/FileInput'
import NumInput from '@/Shared/NumInput'
import SelectInput from '@/Shared/SelectInput'
import LoadingButton from '@/Shared/LoadingButton'

export default {
  metaInfo: { title: 'Create Documents' },
  components: {
    LoadingButton,
    FileInput,
    SelectInput,
    TextInput,
    NumInput,
  },
  layout: Layout,
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        docs_name: null,
        author:null,
        NIM:null,
        year:null,
        department:null,
        pdf:null,
      }),
    }
  },
  methods: {
    store() {
      this.form.post(this.route('docs.store'))
    },
  },
}
</script>
