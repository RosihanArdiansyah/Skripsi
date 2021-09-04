<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Dashboard</h1>
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
  </div>
</template>

<script>
import Layout from '@/Shared/Layout'

export default {
  metaInfo: { title: 'Dashboard' },
  
  layout: Layout,
  props: {
    docs: Array,
  },
  created(){
    console.log(this.$page.props.auth.user)
  },
}
</script>
