import {registerRoute} from 'workbox-routing'
import { precacheAndRoute,getCacheKeyForURL } from 'workbox-precaching'
import {ExpirationPlugin} from 'workbox-expiration'
import * as strategies from 'workbox-strategies'
import {CacheableResponsePlugin} from 'workbox-cacheable-response'

precacheAndRoute(self.__WB_MANIFEST || [])

addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting()
  }
})

registerRoute(
  ({request}) => request.destination === 'image',
  new strategies.CacheFirst({
    cacheName: 'images',
    plugins: [
      new ExpirationPlugin({
        maxEntries: 60,
        maxAgeSeconds: 30 * 24 * 60 * 60, // 30 Days
      }),
    ],
  }),
)

registerRoute(
  ({request}) => request.destination === 'script' ||
                    request.destination === 'style',
  new strategies.StaleWhileRevalidate({
    cacheName: 'static-resources',
  }),
)

const networkFirstHandler = new strategies.NetworkFirst({
  cacheName: 'dynamic',
  plugins: [
    new ExpirationPlugin({
      maxEntries: 10,
    }),
    new CacheableResponsePlugin({
      statuses: [200],
    }),
  ],
})

const FALLBACK_URL = getCacheKeyForURL('/offline.html')
const matcher = ({ event }) => event.request.mode === 'navigate'
const handler = args =>
  networkFirstHandler
    .handle(args)
    .then(response => response || caches.match(FALLBACK_URL))
    .catch(() => caches.match(FALLBACK_URL))
 
registerRoute(matcher, handler)


