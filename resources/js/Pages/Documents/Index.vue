<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Documents</h1>
    <div class="mb-6 flex justify-between items-center">
      <search-filter v-model="form.search" class="w-full max-w-md mr-4" @reset="reset">
        <label class="block text-gray-700">Trashed:</label>
        <select v-model="form.trashed" class="mt-1 w-full form-select">
          <option :value="null" />
          <option value="with">With Trashed</option>
          <option value="only">Only Trashed</option>
        </select>
      </search-filter>
      <inertia-link class="btn-indigo" :href="route('docs.create')">
        <span>Create</span>
        <span class="hidden md:inline">doc</span>
      </inertia-link>
    </div>
    <div class="bg-white rounded-md shadow overflow-x-auto">
      <table class="w-full whitespace-nowrap">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4">Nama</th>
          <th class="px-6 pt-6 pb-4">Pengarang</th>
          <th class="px-6 pt-6 pb-4" >Department</th>
        </tr>
        <tr v-for="doc in docs.data" :key="doc.id" class="hover:bg-gray-100 focus-within:bg-gray-100">
         <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="route('docs.edit', doc.id)">
              {{ doc.docs_name }}
              <icon v-if="doc.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('docs.edit', doc.id)" tabindex="-1">
              {{ doc.author }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('docs.edit', doc.id)" tabindex="-1">
              {{ doc.department }}
            </inertia-link>
          </td>
          <td class="border-t">
               <inertia-link v-if="doc.pdf" class="inline-block align-middle text-white-600 btn-indigo" as="button" type="button" :href="route('docs.show', doc.id)">Read</inertia-link>
          </td>
        </tr>
        <tr v-if="docs.data.length === 0">
          <td class="border-t px-6 py-4" colspan="4">No docs found.</td>
        </tr>
      </table>
    </div>
    <pagination class="mt-6" :links="docs.links" />
  </div>
</template>

<script>
import Icon from '@/Shared/Icon'
import pickBy from 'lodash/pickBy'
import Layout from '@/Shared/Layout'
import throttle from 'lodash/throttle'
import mapValues from 'lodash/mapValues'
import Pagination from '@/Shared/Pagination'
import SearchFilter from '@/Shared/SearchFilter'

export default {
  metaInfo: { title: 'docs' },
  components: {
    Icon,
    Pagination,
    SearchFilter,
  },
  layout: Layout,
  props: {
    docs: Object,
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
        this.$inertia.replace(this.route('docs', Object.keys(query).length ? query : { remember: 'forget' }))
      }, 150),
      deep: true,
    },
  },
  methods: {
    reset() {
      this.form = mapValues(this.form, () => null)
    },
    show(){
      this.route('docs.show',this.doc.id)
    },
  },
}
</script>
