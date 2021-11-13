<template>
  <div>
    <div class="mb-8 flex justify-start max-w-3xl">
      <h1 class="mb-8 font-bold text-2xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('docs')">{{ form.docs_name }}</inertia-link>
      </h1>
      <img v-if="doc.coverImg" class="block w-8 h-8 rounded-full ml-4" :src="doc.coverImg" />
    </div>
    <trashed-message v-if="doc.deleted_at" class="mb-6" @restore="restore">
      Data telah dihapus.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-hidden max-w-3xl">
      <form @submit.prevent="update">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <textarea-input v-if="$page.props.auth.user.owner == 1" v-model="form.docs_name" :error="form.errors.docs_name" class="pr-6 pb-8 w-full" label="Judul Buku" type="text" />
          <text-input v-if="$page.props.auth.user.owner == 1" v-model="form.author" :error="form.errors.author" class="pr-6 pb-8 w-full" label="Pengarang" />
          <text-input v-if="$page.props.auth.user.owner == 1" v-model="form.publisher" :error="form.errors.publisher" class="pr-6 pb-8 w-full" label="Penerbit" />
          <text-input v-if="$page.props.auth.user.owner == 1" v-model="form.book_code" :error="form.errors.book_code" class="pr-6 pb-8 w-full" label="Kode Buku" />
          <select-input v-if="$page.props.auth.user.owner == 1" v-model="form.types_id" :error="form.errors.types_id" class="pr-6 pb-8 w-full lg:w-1/2" label="Jenis Buku">
            <option :value="form.types_id" />
            <option v-for="type in types" :key="type.id" :value="type.id">{{ type.name }}</option>
          </select-input>
          <text-input v-if="$page.props.auth.user.owner == 1" v-model="form.NIM" :error="form.errors.NIM" class="pr-6 pb-8 w-full" label="Stambuk" />
          <num-input v-if="$page.props.auth.user.owner == 1" v-model="form.year" :error="form.errors.year" class="pr-6 pb-8 w-full" label="Tahun" />
          <num-input v-if="$page.props.auth.user.owner == 1" v-model="form.year" autocomplete="off" :error="form.errors.year" class="pr-6 pb-8 w-full" label="Tahun" />
          <select-input v-if="$page.props.auth.user.owner == 1" v-model="form.status" :error="form.errors.status" class="hidden pr-6 pb-8 w-full" label="Status Buku">
            <option :value="true">Tersedia</option>
            <option :value="false">Tidak Tersedia</option>
          </select-input>
          <text-input v-if="$page.props.auth.user.owner == 1" v-model="form.department" :error="form.errors.department" class="pr-6 pb-8 w-full" label="Department" />
          <file-input v-if="$page.props.auth.user.owner == 1" v-model="form.pdf" :error="form.errors.pdf" class="pr-6 pb-8 w-full" type="file" accept=".pdf" label="PDF Files" />
          <div v-if="$page.props.auth.user.owner == 0">
            <span class="pr-6 pb-8 w-full" label="Judul Buku"> {{ form.docs_name }} </span>
            <span class="pr-6 pb-8 w-full" label="Pengarang"> {{ form.author }} </span>
            <span v-if="doc.publisher" class="pr-6 pb-8 w-full" label="Penerbit"> {{ form.publisher }} </span>
            <span class="pr-6 pb-8 w-full" label="Kode Buku"> {{ form.book_code }} </span>
            <!-- <span v-for="type in types" :key="type.id" :value="type.id" class="pr-6 pb-8 w-full" label="Jenis Buku"> {{ type.name }} </span> -->
            <span v-if="doc.NIM" class="pr-6 pb-8 w-full" label="Stambuk"> {{ form.NIM }} </span>
            <span class="pr-6 pb-8 w-full" label="Tahun"> {{ form.year }} </span>
            <span class="pr-6 pb-8 w-full" label="Stok Buku"> {{ form.stok_buku }} </span>
            <span v-if="doc.status == 1" class="pr-6 pb-8 w-full text-green" label="Status"> Tersedia </span>
            <span v-if="doc.status == 0" class="pr-6 pb-8 w-full text-red" label="Status"> Tidak Tersedia </span>
            <span v-if="doc.department" class="pr-6 pb-8 w-full" label="Department"> {{ form.department }} </span>
          </div>
        </div>
        <div class="px-8 py-4 bg-gray-50 border-t border-gray-100 flex items-center">
          <button v-if="!doc.deleted_at && $page.props.auth.user.owner == 1" class="text-red-600 hover:underline" tabindex="-1" type="button" @click="destroy">Hapus Buku</button>
          <loading-button v-if="$page.props.auth.user.owner == 1" :loading="form.processing" class="btn-indigo ml-auto" type="submit">Ubah Buku</loading-button>
        </div>
      </form>
      <div v-if="doc.pdf" class="align-middle px-8 py-8 relative md:static items-center">
        <button class="items-center flex align-middle text-white-200 btn-indigo" tabindex="-1" @click="submit(doc.id,doc.docs_name)">Baca</button>
      </div>
    </div>
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import TextInput from '@/Shared/TextInput'
import SelectInput from '@/Shared/SelectInput'
import TextareaInput from '@/Shared/TextareaInput'
import NumInput from '@/Shared/NumInput'
import FileInput from '@/Shared/FileInput'
import LoadingButton from '@/Shared/LoadingButton'
import TrashedMessage from '@/Shared/TrashedMessage'

export default {
  metaInfo() {
    return { title: this.form.docs_name }
  },
  components: {
    FileInput,
    SelectInput,
    LoadingButton,
    TextInput,
    TextareaInput,
    NumInput,
    TrashedMessage,
  },
  layout: Layout,
  props: {
    doc: Object,
    types: Array,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method:'put',
        docs_name: this.doc.docs_name,
        book_code: this.doc.book_code,
        types_id: this.doc.types_id,
        author:this.doc.author,
        publisher:this.doc.publisher,
        NIM:this.doc.NIM,
        year:this.doc.year,
        stok_buku:this.doc.stok_buku,
        status: this.doc.status,
        department:this.doc.department,
        pdf: null,
      }),
      records:{
        docs_id: null,
        users_id: null,
        user_name: null,
        department: null,
        doc_name: null,
      },
    }
  },
  created(){
    console.log(this.$page.props.auth.user)
  },
  methods: {
    update() {
      this.form.post(this.route('docs.update', this.doc.id), {
        onSuccess: () => this.form.reset('pdf'),
      })
    },
    destroy() {
      if (confirm('Apakah anda ingin menghapus dokumen ini?')) {
        this.$inertia.delete(this.route('docs.destroy', this.doc.id))
      }
    },
    restore() {
      if (confirm('Apakah anda ingin mengembalikan dokumen ini?')) {
        this.$inertia.put(this.route('docs.restore', this.doc.id))
      }
    },
    submit(id,doc_name){
      this.records.users_id = this.$page.props.auth.user.id
      this.records.user_name = (this.$page.props.auth.user.first_name + ' ' + this.$page.props.auth.user.last_name)
      this.records.doc_name = doc_name
      this.records.docs_id = id
      this.records.department = this.$page.props.auth.user.department
      this.$inertia.post(this.route('reports.store',this.records))
    },
  },
}
</script>
