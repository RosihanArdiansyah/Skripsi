<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">
      <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('docs')">Documents</inertia-link>
      <span class="text-indigo-400 font-medium">/</span> Create
    </h1>
    <div class="bg-white rounded-md shadow overflow-hidden max-w-3xl">
      <form @submit.prevent="store">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <textarea-input v-model="form.docs_name" autocomplete="off" :error="form.errors.docs_name" class="pr-6 pb-8 w-full" label="Judul Buku" type="text" />
          <text-input v-model="form.author" autocomplete="off" :error="form.errors.author" class="pr-6 pb-8 w-full" label="Pengarang" />
          <text-input v-model="form.publisher" autocomplete="off" :error="form.errors.publisher" class="pr-6 pb-8 w-full" label="Penerbit" />
          <text-input v-model="form.book_code" autocomplete="off" :error="form.errors.book_code" class="pr-6 pb-8 w-full" label="Kode Buku" />
          <select-input v-model="form.types_id" :error="form.errors.types_id" class="pr-6 pb-8 w-full lg:w-1/2" label="Jenis Buku">
            <option :value="null" />
            <option v-for="type in types" :key="type.id" :value="type.id">{{ type.name }}</option>
          </select-input>
          <text-input v-model="form.NIM" autocomplete="off" :error="form.errors.NIM" class="pr-6 pb-8 w-full" label="Stambuk" />
          <num-input v-model="form.year" autocomplete="off" :error="form.errors.year" class="pr-6 pb-8 w-full" label="Tahun" />
          <select-input v-model="form.status" :error="form.errors.status" class="pr-6 pb-8 w-full" label="Status Buku">
            <option :value="true">Tersedia</option>
            <option :value="false">Tidak Tersedia</option>
          </select-input>
          <num-input v-model="form.stok_buku" autocomplete="off" :error="form.errors.stok_buku" class="pr-6 pb-8 w-full" label="Stok Buku" />
          <text-input v-model="form.department" autocomplete="off" :error="form.errors.department" class="pr-6 pb-8 w-full" label="Departemen" />
          <file-input v-model="form.pdf" :error="form.errors.pdf" class="pr-6 pb-8 w-full" type="file" accept=".pdf" label="File PDF" />
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
import SelectInput from '@/Shared/SelectInput'
import TextareaInput from '@/Shared/TextareaInput'
import FileInput from '@/Shared/FileInput'
import NumInput from '@/Shared/NumInput'
import LoadingButton from '@/Shared/LoadingButton'

export default {
  metaInfo: { title: 'Create Documents' },
  components: {
    LoadingButton,
    SelectInput,
    FileInput,
    TextInput,
    TextareaInput,
    NumInput,
  },
  layout: Layout,
  props: {
    types: Array,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        docs_name: null,
        types_id: null,
        book_code:null,
        author:null,
        publisher:null,
        NIM:null,
        year:null,
        status:true,
        stok_buku:null,
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
