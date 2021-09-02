<template>
  <div>
    <div class="mb-8 flex justify-start max-w-3xl">
      <h1 class="font-bold text-3xl">
        <inertia-link class="text-indigo-400 hover:text-indigo-600" :href="route('reports')">reports</inertia-link>
        <span class="text-indigo-400 font-medium">/</span>
        {{ form.user_name }}
      </h1>
    </div>
    <trashed-message v-if="report.deleted_at" class="mb-6" @restore="restore">
      report ini telah dihapus.
    </trashed-message>
    <div class="bg-white rounded-md shadow overflow-x max-w-3xl">
      <form>
        <!-- <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.user_name" :error="form.errors.user_name" class="pr-6 pb-8 w-full" label="Nama" />
        </div>
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.department" :error="form.errors.department" class="pr-6 pb-8 w-full" label="Departemen" />
        </div>
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.doc_name" :error="form.errors.doc_name" class="pr-6 pb-8 w-full" label="Judul buku" />
        </div>
        
          
          <loading-button :loading="form.processing" class="btn-indigo ml-auto" report="submit">Ubah report</loading-button> -->
        <span class="p-8 -mr-6 -mb-8 flex flex-wrap" label="Judul Buku"> {{ form.doc_name }} </span>
        <span class="p-8 -mr-6 -mb-8 flex flex-wrap" label="Nama"> {{ form.user_name }} </span>
        <span class="p-8 -mr-6 -mb-8 flex flex-wrap" label="Department"> {{ form.department }} </span>
        <span class="p-8 -mr-6 -mb-8 flex flex-wrap" label="Waktu Akses"> {{ form.created_at }} </span>
        <div class="px-8 py-4 mt-8 bg-gray-50 border-t flex items-center">
          <button v-if="!report.deleted_at" class="text-red-600 hover:underline" tabindex="-1" report="button" @click="destroy">Hapus report</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
// import TextInput from '@/Shared/TextInput'
// import LoadingButton from '@/Shared/LoadingButton'
import TrashedMessage from '@/Shared/TrashedMessage'

export default {
  metaInfo() {
    return {
      title: `${this.form.user_name}`,
    }
  },
  components: {
    // LoadingButton,
    // TextInput,
    TrashedMessage, 
  },
  layout: Layout,
  props: {
    report: Object,
  },
  remember: 'form',
  data() {
    return {
      form: this.$inertia.form({
        _method: 'put',
        user_name: this.report.user_name,
        doc_name: this.report.doc_name,
        department: this.report.department,
        created_at: this.report.created_at,
      }),
    }
  },
  methods: {
    // update() {
    //   this.form.post(this.route('reports.update', this.report.id))
    // },
    destroy() {
      if (confirm('Apakah anda ingin menghapus report ini?')) {
        this.$inertia.delete(this.route('reports.destroy', this.report.id))
      }
    },
    restore() {
      if (confirm('Apakah anda ingin mengembalikan report ini?')) {
        this.$inertia.put(this.route('reports.restore', this.report.id))
      }
    },
  },
}
</script>
