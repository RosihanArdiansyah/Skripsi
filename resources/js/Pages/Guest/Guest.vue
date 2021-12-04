<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Daftar Buku</h1>
    <div class="mb-6 flex justify-between items-center">
      <search-filter v-model="form.search" class="w-full max-w-md mr-4" @reset="reset">
        <label class="block text-gray-700">Jenis Buku:</label>
        <select v-model="form.trashed" class="hidden mt-1 w-full form-select">
          <option :value="null" />
          <option value="with">With Trashed</option>
          <option value="only">Only Trashed</option>
        </select>
        <select v-model="form.types" class="mt-1 w-full form-select">
          <option :value="null" />
          <option v-for="type in types" :key="type.id" :value="type.id">{{ type.name }}</option>
        </select>
      </search-filter>
    </div>
    <div class="bg-white rounded-md shadow overflow-x">
      <table class="w-full table-fixed break-all md:break-words">
        <tr class="text-left font-bold">
          <th class="w-1/2 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Judul</th>
          <th class="w-1/5 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Pengarang</th>
          <th class="w-1/5 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Departemen</th>
          <th class="w-1/5 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Status</th>
        </tr>
        <tr v-for="doc in docs.data" :key="doc.id" class="hover:bg-gray-100 focus-within:bg-gray-100 
        flex md:table-row flex-col md:flex-row border-4 md:border flex-wrap md:flex-no-wrap"
        >
          <td class="pt-4 md:pt-0 md:border-t break-words block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Judul</span>
            <span class="px-6 py-4 flex items-center focus:text-indigo-500">
              {{ doc.docs_name }}
              <icon v-if="doc.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
            </span>
          </td>
          <td class="border-t block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Pengarang</span>
            <span class="px-6 py-4 flex items-center" tabindex="-1">
              {{ doc.author }}
            </span>
          </td>
          <td class="border-t block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Departemen</span>
            <span class="px-6 py-4 flex items-center" tabindex="-1">
              {{ doc.department }}
            </span>
          </td>
          <td v-if="doc.status == true" class="border-t block md:table-cell relative md:static">
            <span class="px-6 py-4 flex items-center" tabindex="-1">
              Tersedia
            </span>
          </td>
          <td v-if="doc.status == false" class="border-t block md:table-cell relative md:static">
            <span class="px-6 py-4 flex items-center" tabindex="-1">
              Tidak Tersedia
            </span>
          </td>
        </tr>
        <tr v-if="docs.data.length === 0">
          <td class="border-t px-6 py-4" colspan="4">No docs found.</td> 
        </tr>
      </table>
    </div>
    <keep-alive>
      <pagination class="mt-6" :links="docs.links" />
    </keep-alive>
  </div>
</template>

<script>
import Icon from '@/Shared/Icon'
import pickBy from 'lodash/pickBy'
import Layout from '@/Shared/Layout'
import throttle from 'lodash/throttle'
// import mapValues from 'lodash/mapValues'
import Pagination from '@/Shared/Pagination'
import SearchFilter from '@/Shared/SearchFilter'

export default {
  metaInfo: { title: 'Docs' },
  components: {
    Icon,
    SearchFilter,
    Pagination,
  },
  layout: Layout,
  props: {
    docs: Object,
    filters: Object,
    types: Array,
    page: Object,
    src: Object,
  },
  data() {
    return {
      form: {
        search: this.filters.search,
        trashed: this.filters.trashed,
        types:this.filters.types,
      },
    }
  },
  watch: {
    form: {
      handler: throttle(function() {
        let query = pickBy(this.form)
        this.$inertia.replace(this.route('guest', Object.keys(query).length ? query : { remember: 'forget' }))
      }, 150),
      deep: true,
    }, 
  },
  created(){
    this.form.trashed = null
    this.form.search = null
  },
  methods: {
    reset() {
      this.form.search = null
      this.form.types = null
    },
  },

}
</script>