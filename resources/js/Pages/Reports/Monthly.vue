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
    <div class="mt-8 bg-white rounded-md shadow overflow-x-auto">
      <table class="w-full table-auto whitespace-normal break-all lg:break-words">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600">Bulan</th>
          <th class="px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600">Total</th>
        </tr>
        <tr v-for="report in reports" :key="report.months" class="hover:bg-gray-100 focus-within:bg-gray-100">
          <td class="border-t">
            <span class="px-6 py-4 flex items-center" tabindex="-1">
              {{ report.month }}
            </span> 
          </td>
          <td class="border-t">
            <span class="px-6 py-4 flex items-center focus:text-indigo-500">{{ report.sum }}</span>
          </td>
        </tr>
      </table>
    </div>
    <!-- <pagination class="mt-6" :links="reports.links" /> -->
  </div>
</template> 

<script>
import pickBy from 'lodash/pickBy'
import Layout from '@/Shared/Layout'
import throttle from 'lodash/throttle'
// import Pagination from '@/Shared/Pagination'
// import mapValues from 'lodash/mapValues'
import SearchFilter from '@/Shared/SearchFilter'

export default {
  metaInfo: { title: 'Reports' },
  components: {
    SearchFilter,
    // Pagination,
  },
  layout: Layout,
  props: {
    reports: Array,
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
