<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Daftar Buku</h1>
    <div class="mb-6 flex justify-between items-center">
      <search-filter v-model="form.search" class="w-full max-w-md mr-4" @reset="reset">
        <label class="block text-gray-700">Trashed:</label>
        <select v-model="form.trashed" class="mt-1 w-full form-select">
          <option :value="null" />
          <option value="with">With Trashed</option>
          <option value="only">Only Trashed</option>
        </select>
      </search-filter>
      <inertia-link v-if="$page.props.auth.user.owner == 1" class="btn-indigo" :href="route('docs.create')">
        <span>Tambah</span>
        <span class="hidden md:inline">Dokumen</span>
      </inertia-link>
    </div>
    <div class="bg-white rounded-md shadow overflow-x">
      <table class="w-full table-fixed break-all md:break-words">
        <tr class="text-left font-bold">
          <th class="w-1/2 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Nama</th>
          <th class="w-1/5 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Pengarang</th>
          <th class="w-1/5 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Departemen</th>
          <th class="w-1/10 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell" />
        </tr>
        <tr v-for="doc in docs.data" :key="doc.id" class="hover:bg-gray-100 focus-within:bg-gray-100 
        flex md:table-row flex-col md:flex-row border-4 md:border flex-wrap md:flex-no-wrap"
        >
          <td class="pt-4 md:pt-0 md:border-t break-words block md:table-cell relative md:static">
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="route('docs.edit', doc.id)">
              {{ doc.docs_name }}
              <icon v-if="doc.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
            </inertia-link>
          </td>
          <td class="border-t block md:table-cell relative md:static">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('docs.edit', doc.id)" tabindex="-1">
              {{ doc.author }}
            </inertia-link>
          </td>
          <td class="border-t block md:table-cell relative md:static">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('docs.edit', doc.id)" tabindex="-1">
              {{ doc.department }}
            </inertia-link>
          </td>
          <td v-if="doc.pdf" class="px-6 md:px-0 py-4 pb-4 md:pb-0 border-t block md:table-cell relative md:static items-center">
            <button class="items-center flex align-middle text-white-200 btn-indigo" tabindex="-1" @click="submit(doc.id,doc.docs_name)">Baca</button>
          </td>
          <!--<td class="border-t">
               <inertia-link v-if="!doc.deleted_at" class="inline-block align-middle text-white-600 btn-green" as="button" tabindex="-1"type="button" href="#" @click="destroy">
                 <icon name="trash" class="flex-shrink-0 w-3 h-3 fill-white" />
               </inertia-link>
          </td>-->
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
    page: Object,
    src: Object,
  },
  data() {
    return {
      form: {
        search: this.filters.search,
        trashed: this.filters.trashed,
      },
      records:{
        docs_id: null,
        users_id: null,
        user_name: null,
        department: null,
        doc_name: null,
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
  created(){
    if (this.src != null){
      this.form.search = this.src.val
    }
    if(this.$page.props.auth.user.owner == 1){
      this.form.trashed = 'with'
    }
    console.log('Page: ' + this.page.current_page)
    console.log(this.$page.props.auth.user)
  },
  methods: {
    reset() {
      this.form.search = null
    },
    destroy() {
      if (confirm('Are you sure you want to delete this docs?')) {
        this.$inertia.delete(this.route('docs.destroy', this.doc.id))
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