<template>
  <div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('dashboard')">
        <icon name="dashboard" class="w-4 h-4 mr-2" :class="isUrl('') ? 'fill-white' : 'fill-yellow-400 group-hover:fill-white'" />
        <div :class="isUrl('') ? 'text-white' : 'text-yellow-300 group-hover:text-white'">Dashboard</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('docs')">
        <icon name="book" class="w-4 h-4 mr-2" :class="isUrl('docs') ? 'fill-white' : 'fill-yellow-400 group-hover:fill-white'" />
        <div :class="isUrl('docs') ? 'text-white' : 'text-yellow-300 group-hover:text-white'">Bacaan</div>
      </inertia-link> 
    </div>
    <!-- <div class="mb-4">
      <inertia-link class="flex items-center group py-3" :href="route('docs')">
        <icon name="book" class="w-4 h-4 mr-2" :class="isUrl('docs') ? 'fill-white' : 'fill-yellow-400 group-hover:fill-white'" />
        <div :class="isUrl('docs') ? 'text-white' : 'text-yellow-300 group-hover:text-white'">Tugas Akhir</div>
      </inertia-link>
    </div> -->
    <div v-if="$page.props.auth.user.owner == 1" class="mt-8">
      <div class="mb-2">
        <span class="flex items-center group py-3 text-yellow-300 text-xl">Database</span>
      </div>
      <div class="mb-4">
        <inertia-link class="flex items-center group py-3" :href="route('users')">
          <icon name="users" class="w-4 h-4 mr-2" :class="isUrl('users') ? 'fill-white' : 'fill-yellow-400 group-hover:fill-white'" />
          <div :class="isUrl('users') ? 'text-white' : 'text-yellow-300 group-hover:text-white'">Users</div>
        </inertia-link>
      </div>
      <div class="mb-4">
        <inertia-link class="flex items-center group py-3" :href="route('types')">
          <icon name="book" class="w-4 h-4 mr-2" :class="isUrl('types') ? 'fill-white' : 'fill-yellow-400 group-hover:fill-white'" />
          <div :class="isUrl('types') ? 'text-white' : 'text-yellow-300 group-hover:text-white'">Jenis Buku</div>
        </inertia-link>
      </div>
      <div class="mb-4"> 
        <inertia-link class="flex items-center group py-3" :href="route('reports')">
          <icon name="printer" class="w-4 h-4 mr-2" :class="isUrl('reports') ? 'fill-white' : 'fill-yellow-400 group-hover:fill-white'" />
          <div :class="isUrl('reports') ? 'text-white' : 'text-yellow-300 group-hover:text-white'">Laporan</div>
        </inertia-link>
      </div>
    </div>
  </div>
</template>

<script>
import Icon from '@/Shared/Icon'

export default {
  components: {
    Icon,
  },
  methods: {
    isUrl(...urls) {
      let currentUrl = this.$page.url.substr(1)
      if (urls[0] === '') {
        return currentUrl === ''
      }
      return urls.filter(url => currentUrl.startsWith(url)).length
    },
    // anu() {
    //   if (confirm('Apakah anda ingin melihat laporan bulanan?')) {
    //     this.$inertia.get(this.route('reports.monthly'))
    //   } else this.$inertia.get(this.route('reports'))
    // },
  },
}
</script>
