<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Daftar User</h1>
    <div class="mb-6 flex justify-between items-center">
      <search-filter v-model="form.search" class="w-full max-w-md mr-4" @reset="reset">
        <select v-model="form.role" class="hidden mt-1 w-full form-select">
          <option :value="null" />
          <option value="pemustaka">Pemustaka</option>
          <option value="pustakawan">Pustakawan</option>
        </select>
        <label class="mt-4 block text-gray-700">Trashed:</label>
        <select v-model="form.trashed" class="mt-1 w-full form-select">
          <option :value="null" />
          <option value="with">With Trashed</option>
          <option value="only">Only Trashed</option>
        </select>
      </search-filter>
      <inertia-link class="btn-indigo" :href="route('users.create')">
        <span>Tambah</span>
        <span class="hidden md:inline">User</span>
      </inertia-link>
    </div>
    <div class="bg-white rounded-md shadow overflow-x-auto">
      <table class="w-full whitespace-nowrap">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Nama</th>
          <th class="px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell">Email</th>
          <th class="px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600 hidden md:table-cell" colspan="2">Role</th>
        </tr>
        <tr v-for="user in users" :key="user.id" class="hover:bg-gray-100 focus-within:bg-gray-100
        flex md:table-row flex-col md:flex-row border-4 md:border flex-wrap md:flex-no-wrap"
        >
          <td class="border-t block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Nama</span>
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="route('users.edit', user.id)">
              <img v-if="user.photo" class="block w-5 h-5 rounded-full mr-2 -my-2" :src="user.photo" />
              {{ user.name }}
              <icon v-if="user.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
            </inertia-link>
          </td>
          <td class="border-t block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Email</span>
            <inertia-link class="px-6 py-4 flex items-center" :href="route('users.edit', user.id)" tabindex="-1">
              {{ user.email }}
            </inertia-link>
          </td>
          <td class="border-t block md:table-cell relative md:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Role</span>
            <inertia-link class="px-6 py-4 flex items-center" :href="route('users.edit', user.id)" tabindex="-1">
              {{ user.owner ? 'Pustakawan' : 'Pemustaka' }}
            </inertia-link>
          </td>
        </tr>
        <tr v-if="users.length == 0">
          <td class="border-t px-6 py-4" colspan="3">No users found.</td>
        </tr>
      </table>
    </div>
    <pagination class="mt-6" :links="users.links" />
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
  metaInfo: { title: 'Users' },
  components: {
    Icon,
    SearchFilter,
    Pagination,
  },
  layout: Layout,
  props: {
    users: Array,
    filters: Object,
  },
  data() {
    return {
      form: {
        search: this.filters.search,
        role: this.filters.role,
        trashed: this.filters.trashed,
      },
    }
  },
  watch: {
    form: {
      handler: throttle(function() {
        let query = pickBy(this.form)
        this.$inertia.replace(this.route('users', Object.keys(query).length ? query : { remember: 'forget' }))
      }, 150),
      deep: true,
    },
  },
  mounted(){
    this.form.search = null
    this.form.role = 'pemustaka'
    this.form.trashed = 'with'
    console.log(this.$page.props.auth.user)
  },
  methods: {
    reset() {
      this.form.search = null
    },
  },
}
</script>
