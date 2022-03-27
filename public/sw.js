/* eslint-disable no-undef */
importScripts('https://storage.googleapis.com/workbox-cdn/releases/6.1.5/workbox-sw.js')

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting()
  }
})

workbox.routing.registerRoute(
  ({request}) => request.destination === 'image',
  new workbox.strategies.CacheFirst({
    cacheName: 'images',
    plugins: [
      new workbox.expiration.ExpirationPlugin({
        maxEntries: 60,
        maxAgeSeconds: 30 * 24 * 60 * 60, // 30 Days
      }),
    ],
  }),
)

workbox.routing.registerRoute(
  ({url}) => url.origin === self.location.origin &&
             url.pathname.startsWith('/storage/'),
  new workbox.strategies.CacheFirst({
    cacheName: 'docs',
    plugins: [
      new workbox.expiration.ExpirationPlugin({
        maxEntries: 60,
        maxAgeSeconds: 30 * 24 * 60 * 60, // 30 Days
      }),
    ],
  }),
)

workbox.routing.registerRoute(
  ({request}) => request.destination === 'script' ||
                    request.destination === 'style',
  new workbox.strategies.StaleWhileRevalidate({
    cacheName: 'static-resources',
  }),
)

workbox.precaching.precacheAndRoute(self.__WB_MANIFEST || [])

const networkFirstHandler = new workbox.strategies.CacheFirst({
  cacheName: 'dynamic',
  plugins: [
    new workbox.expiration.ExpirationPlugin({
      maxEntries: 10,
    }),
    new workbox.cacheableResponse.CacheableResponsePlugin({
      statuses: [200],
    }),
  ],
})

const FALLBACK_URL = workbox.precaching.getCacheKeyForURL('/offline.html')
const matcher = ({ event }) => event.request.mode === 'navigate'
const handler = args =>
  networkFirstHandler
    .handle(args)
    .then(response => response || caches.match(FALLBACK_URL))
    .catch(() => caches.match(FALLBACK_URL))
 
workbox.routing.registerRoute(matcher, handler)


