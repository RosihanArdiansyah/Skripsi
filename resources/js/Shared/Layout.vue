<template>
  <div>
    <portal-target name="dropdown" slim />
    <div class="md:flex md:flex-col">
      <div class="md:h-screen md:flex md:flex-col">
        <div class="md:flex md:flex-shrink-0">
          <div class="bg-red-900 md:flex-shrink-0 md:w-56 px-6 py-4 flex items-center justify-between md:justify-center">
            <inertia-link class="mt-1" href="/">
              <span class="text-white">E-Library</span>
            </inertia-link>
            <dropdown aria-label="btnDrop" class="md:hidden" placement="bottom-end">
              <svg class="fill-white w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" /></svg>
              <div slot="dropdown" class="mt-2 px-8 py-4 shadow-lg bg-red-800 rounded">
                <main-menu />
              </div>
            </dropdown>
          </div>
          <div class="bg-white border-b w-full p-4 md:py-0 md:px-12 text-sm md:text-md flex justify-between items-center">
            <div v-if="$page.props.auth.user" class="mt-1 mr-4">{{ $page.props.auth.user.account.name }}</div>
            <dropdown class="mt-1" placement="bottom-end"> 
              <div class="flex items-center cursor-pointer select-none group">
                <div v-if="$page.props.auth.user" class="text-gray-700 group-hover:text-red-600 focus:text-red-600 mr-1 whitespace-nowrap">
                  <span>{{ $page.props.auth.user.first_name }}</span>
                  <span class="hidden md:inline">{{ $page.props.auth.user.last_name }}</span>
                </div>
                <icon class="w-5 h-5 group-hover:fill-red-600 fill-gray-700 focus:fill-red-600" name="cheveron-down" />
              </div>
              <div v-if="$page.props.auth.user" slot="dropdown" class="mt-2 py-2 shadow-xl bg-white rounded text-sm">
                <inertia-link class="block px-6 py-2 hover:bg-red-500 hover:text-white" :href="route('users.edit', $page.props.auth.user.id)">Profil</inertia-link>
                <inertia-link class="block px-6 py-2 hover:bg-red-500 hover:text-white w-full text-left" :href="route('logout')" method="post" as="button">Keluar</inertia-link>
              </div>
              <div v-else slot="dropdown" class="mt-2 py-2 shadow-xl bg-white rounded text-sm">
                <inertia-link class="block px-6 py-2 hover:bg-red-500 hover:text-white w-full text-left" :href="route('login')" method="get" as="button">Keluar</inertia-link>
              </div>
            </dropdown>
          </div>
        </div>
        <div aria-label="btnDrop" class="md:flex md:flex-grow md:overflow-hidden">
          <main-menu class="hidden md:block bg-red-800 flex-shrink-0 w-56 p-12 overflow-y-auto" />
          <div class="md:flex-1 px-4 py-8 md:p-12 md:overflow-y-auto" scroll-region>
            <flash-messages />
            <slot />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Icon from '@/Shared/Icon'
import Dropdown from '@/Shared/Dropdown'
import MainMenu from '@/Shared/MainMenu'
import FlashMessages from '@/Shared/FlashMessages'

export default {
  components: {
    Dropdown,
    FlashMessages,
    Icon,
    MainMenu,
  },
}
</script>
