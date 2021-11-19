<template>
  <div class="p-6 bg-red-800 min-h-screen flex justify-center items-center">
    <div class="w-full bg-white rounded-lg max-w-md">
      <form class="mt-8 shadow-xl overflow-hidden" @submit.prevent="login">
        <div class="px-10 py-12">
          <h1 class="text-center font-bold text-3xl">Selamat Datang</h1>
          <div class="mx-auto mt-6 w-24 border-b-2" />
          <text-input v-model="form.email" :error="form.errors.email" class="mt-10" label="Email" type="email" autofocus autocapitalize="off" />
          <text-input v-model="form.password" :error="form.errors.password" class="mt-6" label="Password" type="password" />
          <label class="mt-6 select-none flex items-center" for="remember">
            <input id="remember" v-model="form.remember" class="mr-1" type="checkbox" />
            <span class="text-sm">Remember Me</span>
          </label>
        </div>
        <div class="px-10 py-4 bg-gray-100 border-t border-gray-100 flex justify-between items-center">
          <a class="hover:underline" tabindex="-1" href="#reset-password">Forget password?</a>
          <loading-button :loading="form.processing" class="btn-indigo" type="submit">Login</loading-button>
        </div>
      </form>
      <div class="px-10 py-4 bg-gray-100 border-t border-gray-100 flex justify-center items-center">
        <button class="btn-indigo" @click="guest()">Masuk sebagai Guest</button>
      </div>
    </div>
  </div>
</template>

<script>

import TextInput from '@/Shared/TextInput'
import LoadingButton from '@/Shared/LoadingButton'

export default {
  metaInfo: { title: 'Login' },
  components: {
    LoadingButton,
    TextInput,
  },
  data() {
    return {
      form: this.$inertia.form({
        email: null,
        password: null,
        remember: false,
      }),
    }
  },
  methods: {
    login() {
      this.form
        .transform(data => ({
          ...data,
          remember: data.remember ? 'on' : '',
        }))
        .post(this.route('login.attempt'))
    },
    guest(){
      this.$inertia.get(this.route('guest'))
    },
  },
}
</script>
