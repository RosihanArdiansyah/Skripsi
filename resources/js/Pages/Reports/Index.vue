<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Laporan</h1>
    <div class="mb-6 flex justify-between items-center">
      <search-filter v-model="form.search" class="w-full max-w-md mr-4" @reset="reset">
        <label class="mt-4 block text-gray-700">Trashed:</label>
        <select v-model="form.trashed" class="mt-1 w-full form-select">
          <option :value="null" />
          <option value="with">With Trashed</option>
          <option value="only">Only Trashed</option>
        </select>
      </search-filter>
    </div>
    <div class="bg-white rounded-md shadow overflow-x">
      <table class="w-full table-fixed break-all md:break-words whitespace-normal">
        <tr class="text-left font-bold">
          <th class="w-1/4 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Nama</th>
          <th class="w-1/4 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Departemen</th>
          <th class="w-1/4 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Judul Buku</th>
          <th class="w-1/4 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Waktu</th>
        </tr>
        <tr v-for="report in reports.data" :key="report.id" class="hover:bg-gray-100 focus-within:bg-gray-100
        flex md:table-row flex-col md:flex-row border-4 md:border flex-wrap md:flex-no-wrap"
        >
          <td class="border-t block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Nama</span>
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="route('reports.show', report.id)">
              {{ report.user_name }}
              <icon v-if="report.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
            </inertia-link>
          </td>
          <td class="border-t block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Departemen</span>
            <inertia-link class="px-6 py-4 flex items-center" :href="route('reports.show', report.id)" tabindex="-1">
              {{ report.department }}
            </inertia-link>
          </td>
          <td class="border-t block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Judul Buku</span>
            <inertia-link class="px-6 py-4 flex items-center" :href="route('reports.show', report.id)" tabindex="-1">
              {{ report.doc_name }}
            </inertia-link>
          </td>
          <td class="border-t block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Waktu</span>
            <inertia-link class="px-6 py-4 flex items-center" :href="route('reports.show', report.id)" tabindex="-1">
              {{ report.created_at }}
            </inertia-link>
          </td>
        </tr>
        <tr v-if="reports.data.length == 0">
          <td class="border-t px-6 py-4" colspan="3">No reports found.</td>
        </tr>
      </table>
    </div>
    <pagination class="mt-6" :links="reports.links" />
  </div>
</template>

<script>
import Icon from '@/Shared/Icon'
import pickBy from 'lodash/pickBy'
import Layout from '@/Shared/Layout'
import throttle from 'lodash/throttle'
import Pagination from '@/Shared/Pagination'
// import mapValues from 'lodash/mapValues'
import SearchFilter from '@/Shared/SearchFilter'

export default {
  metaInfo: { title: 'Reports' },
  components: {
    Icon,
    SearchFilter,
    Pagination,
  },
  layout: Layout,
  props: {
    reports: Object,
    filters: Object,
  },
  data() {
    return {
      form: {
        search: this.filters.search,
        trashed: this.filters.trashed,
      },
    }
  },
  watch: {
    form: {
      handler: throttle(function() {
        let query = pickBy(this.form)
        this.$inertia.replace(this.route('reports', Object.keys(query).length ? query : { remember: 'forget' }))
      }, 150),
      deep: true,
    },
  },
  mounted(){
    this.form.search = null
    this.form.trashed = null
    console.log(this.reports)
  },
  methods: {
    reset() {
      this.form.search = null
    },
  },
}
</script>
