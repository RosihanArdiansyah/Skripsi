<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Dashboard</h1>
    <div class="mb-8 w-1/3 md:w-1/4 bg-white rounded-md shadow overflow-x-auto">
      <table class="w-full table-auto whitespace-normal lg:break-words">
        <tr v-for="users in user" :key="users.online" class="text-left font-bold">
          <th class="hidden md:block px-6 pt-6 pb-4 font-bold uppercase bg-green-600 text-white">User Online</th>
          <th class="md:hidden px-4 pt-4 pb-4 font-bold uppercase bg-green-600">
            <icon name="users" class="w-4 h-4 mr-2 fill-white" />
          </th>
          <th class="px-4 md:px-6 pt-4 md:pt-6 pb-4 font-bold uppercase bg-green-600 text-white">{{ users.online }}</th>
        </tr>
      </table>
    </div>
    <div class="bg-white rounded-md shadow overflow-x-auto">
      <table class="w-full table-auto whitespace-normal break-all lg:break-words">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600">Department</th>
          <th class="px-6 pt-6 pb-4 font-bold uppercase bg-gray-200 text-gray-600">Total</th>
        </tr>
        <tr v-for="doc in docs" :key="doc.department" class="hover:bg-gray-100 focus-within:bg-gray-100">
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="route('docs.search', doc.department)" tabindex="-1">
              {{ doc.department }}
            </inertia-link> 
          </td>
          <td class="border-t">
            <span class="px-6 py-4 flex items-center focus:text-indigo-500">{{ doc.sum }}</span>
          </td>
        </tr>
      </table>
    </div>
    <!-- <div class="mt-8 bg-white rounded-md shadow overflow-x-auto">
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
    </div> -->
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'
import Icon from '@/Shared/Icon'

export default {
  metaInfo: { title: 'Dashboard' },
  
  components: {
    Icon,
  },
  layout: Layout,
  props: {
    docs: Array,
    user: Array,
  },
  created(){
    console.log(this.$page.props.auth.user)
    console.log(this.docs)
    console.log(this.user)
  },
}
</script>
