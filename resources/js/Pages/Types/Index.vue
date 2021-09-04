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
      <inertia-link class="btn-indigo hidden md:inline" :href="route('types.create')">
        <span>Tambah</span>
        <span class="hidden md:inline">Jenis Buku</span>
      </inertia-link>
    </div>
    <div class="pb-8 flex justify-end md:hidden items-center">
      <inertia-link class="btn-indigo" :href="route('types.create')">
        <span>Tambah</span>
        <span class="hidden md:inline">Jenis Buku</span>
      </inertia-link>
    </div>
    <div class="bg-white rounded-md shadow overflow-x">
      <table class="w-full table-fixed break-all md:break-words">
        <tr class="text-left font-bold">
          <th class="w-1/2 px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Nama</th>
        </tr>
        <tr v-for="type in types.data" :key="type.id" class="hover:bg-gray-100 focus-within:bg-gray-100 
        flex md:table-row flex-col md:flex-row border-4 md:border flex-wrap md:flex-no-wrap"
        >
          <td class="pt-4 md:pt-0 md:border-t break-words block md:table-cell relative md:static">
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="route('types.edit', type.id)">
              {{ type.name }}
              <icon v-if="type.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
            </inertia-link>
          </td>
          <!--<td class="border-t">
               <inertia-link v-if="!type.deleted_at" class="inline-block align-middle text-white-600 btn-green" as="button" tabindex="-1"type="button" href="#" @click="destroy">
                 <icon name="trash" class="flex-shrink-0 w-3 h-3 fill-white" />
               </inertia-link>
          </td>-->
        </tr>
        <tr v-if="types.data.length === 0">
          <td class="border-t px-6 py-4" colspan="4">No types found.</td> 
        </tr>
      </table>
    </div>
    <keep-alive>
      <pagination class="mt-6" :links="types.links" />
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
  metaInfo: { title: 'types' },
  components: {
    Icon,
    SearchFilter,
    Pagination,
  },
  layout: Layout,
  props: {
    types: Object,
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
    }
  },
  watch: {
    form: {
      handler: throttle(function() {
        let query = pickBy(this.form)
        this.$inertia.replace(this.route('types', Object.keys(query).length ? query : { remember: 'forget' }))
      }, 150),
      deep: true,
    }, 
  },
  created(){
    if(this.$page.props.auth.user.owner == 1){
      this.form.trashed = 'with'
    }
    console.log('Page: ' + this.page.current_page)
  },
  methods: {
    reset() {
      this.form.search = null
    },
    destroy() {
      if (confirm('Are you sure you want to delete this types?')) {
        this.$inertia.delete(this.route('types.destroy', this.type.id))
      }
    },
  },

}
</script>