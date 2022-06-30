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

workbox.precaching.precacheAndRoute([{"revision":"f9e30a9bf16219645bb3cf57426712f5","url":"css/app.css"},{"revision":"d41d8cd98f00b204e9800998ecf8427e","url":"favicon.ico"},{"revision":"3e7db4d73e8129de62371d5b05d5fcd4","url":"images/icons/icon-128x128.png"},{"revision":"4a1d6474058b153d6a3701db33a63f3c","url":"images/icons/icon-144x144.png"},{"revision":"de4ad4410b0375493c8c0e8d88bd9119","url":"images/icons/icon-152x152.png"},{"revision":"957dfc347925a4809a880c87534d85eb","url":"images/icons/icon-192x192.png"},{"revision":"149f682f0d9357c39f6c9cf5c5c95199","url":"images/icons/icon-384x384.png"},{"revision":"18e8d82d9df4ff90df686811d09339b2","url":"images/icons/icon-512x512.png"},{"revision":"3b79af186cd91681758b03225e69bf5e","url":"images/icons/icon-72x72.png"},{"revision":"38f31e5cc3fc52566a2fbcb14f1a09cc","url":"images/icons/icon-96x96.png"},{"revision":"4991d9139ac4a5cca00761448bcc61b4","url":"images/icons/splash-1125x2436.png"},{"revision":"41849a55e70e9af8f55c9d18f6ee6563","url":"images/icons/splash-1242x2208.png"},{"revision":"04936d82edce793f90e2d4af7715703f","url":"images/icons/splash-1242x2688.png"},{"revision":"a13ea6fd727c4e37db172d3371452ed7","url":"images/icons/splash-1536x2048.png"},{"revision":"a0670816158f43b823058da33be87fb4","url":"images/icons/splash-1668x2224.png"},{"revision":"0bd50a4d0a0da075bd1e284e956b49b8","url":"images/icons/splash-1668x2388.png"},{"revision":"163d887752c919b4eccea5bcd5be0a5a","url":"images/icons/splash-2048x2732.png"},{"revision":"c9ad775561223eee7802b0f8d4eb3a13","url":"images/icons/splash-640x1136.png"},{"revision":"fe9c9fbe2e7e6b6b0d6663bfeb72fa78","url":"images/icons/splash-750x1334.png"},{"revision":"f68fecc50c9f87e78a323dabaabfd7ef","url":"images/icons/splash-828x1792.png"},{"revision":"bf677598a57b9539055834af51cf6062","url":"images/vendor/pdfjs-dist/web/shadow.png"},{"revision":"344e4397c1d0c753424c9d79acb5f9a1","url":"index.php"},{"revision":"b30adb31574c1074a6c48b5b77371c5e","url":"js/100.js"},{"revision":"7d3f1f061f75697372ef248f7d3c3748","url":"js/101.js"},{"revision":"5d084de19938f3ec455cb81688344c63","url":"js/109.js"},{"revision":"1f41f962b1677eeabce8dec0784d711c","url":"js/11.js"},{"revision":"7750b1e55bf11350b5765b9a69db58c8","url":"js/112.js"},{"revision":"4572ba56b249c9dff0ec7af49feaf012","url":"js/159.js"},{"revision":"9301a850f0d05c6278909beaa7ea19ac","url":"js/185.js"},{"revision":"9a1fc193c71bee5ed6f1eb3c776f59e9","url":"js/2.js"},{"revision":"b251099ad57ca1e7b5f9e21be7886659","url":"js/203.js"},{"revision":"1f3b6acae461f10630281beb5c7a0f34","url":"js/214.js"},{"revision":"84ed9b88631b724ecb62e3e7b0a0384a","url":"js/246.js"},{"revision":"bf7ae7e705d8055425320f2e162bd3a9","url":"js/250.js"},{"revision":"b51a84c28de1bd9e55a004f1138e8adc","url":"js/268.js"},{"revision":"2ab7ea399b6273909d620ad4de7b33ec","url":"js/291.js"},{"revision":"bbfdb9529c52c7ef1c5a649e35e5c8d3","url":"js/296.js"},{"revision":"b22d736a9f46c1649ba9a019341c9a5e","url":"js/312.js"},{"revision":"db888ac29e888424f98fd53e01d4c160","url":"js/318.js"},{"revision":"8d5a090b1cf4e2994f2fe1aa4d74650b","url":"js/322.js"},{"revision":"3a011322b639ed8ff486fab421c261f7","url":"js/326.js"},{"revision":"934dd38fb1f4dc8ccac6ce75d158b9c6","url":"js/350.js"},{"revision":"da73b96784f739fcfa0e10e242f72449","url":"js/352.js"},{"revision":"a6cde56925b306b59a21cca5861b6a38","url":"js/354.js"},{"revision":"dbd30d4e08444ac954c6443f44addbc0","url":"js/413.js"},{"revision":"abc1eed1db72c15b669ca5e2a3aa02f4","url":"js/415.js"},{"revision":"f261e0514a45aa40981194d666d7cdb4","url":"js/429.js"},{"revision":"42b94c215e3ae1028ce6a9538e8c7df2","url":"js/463.js"},{"revision":"8b655037c74eb7be353ba20d9e0814e5","url":"js/468.js"},{"revision":"634c449cde5240a139b32dcc35033873","url":"js/485.js"},{"revision":"0764ab3c6fb039b6774757e187581bb0","url":"js/512.js"},{"revision":"148a124a2aa298a7c6f99feddf3027f9","url":"js/525.js"},{"revision":"aeaa1eea6373f7a0035384fb15fe1244","url":"js/547.js"},{"revision":"28a5836a0c2c94ac6ec3c56d006e15a8","url":"js/567.js"},{"revision":"673be2de99c148972acfb91feeb7b11d","url":"js/568.js"},{"revision":"dc1685347b6afd789fb53efa4775f0bd","url":"js/588.js"},{"revision":"be5f0a13996e44366634c5a2882f64a0","url":"js/600.js"},{"revision":"0ec19049dd9a91cefff13307068cf368","url":"js/626.js"},{"revision":"66f9f15d1e218f4c7fa9d0f8d9fbf3bb","url":"js/634.js"},{"revision":"e9401d49e553b833f3801e7970bcde16","url":"js/653.js"},{"revision":"ec4f8cda7a82448cadc28c577e7f0e5c","url":"js/669.js"},{"revision":"8c53899fc0244fa72cae3c40c58d1674","url":"js/69.js"},{"revision":"8471e06eca8f46efea7fc13e64d131b1","url":"js/706.js"},{"revision":"b67b6c18db852fc6ad6fa36ad74ad88e","url":"js/712.js"},{"revision":"6ceaba79e0df484a889c96673c7bdf02","url":"js/743.js"},{"revision":"42234417eae42987a16df356d4c9d09a","url":"js/754.js"},{"revision":"cff5bc9a58a4ac9681f6859576f80ecc","url":"js/757.js"},{"revision":"b3a27d16f366547a930dbda21c162c96","url":"js/759.js"},{"revision":"173f722cf1fe4d3c92f8c6600dd464a2","url":"js/763.js"},{"revision":"f87ef49fb62621bb2a7492ba22df2f3a","url":"js/764.js"},{"revision":"477861a467d34eb2aa03a87a264f321e","url":"js/775.js"},{"revision":"37707c8e59258642c05a82a78bbe78e4","url":"js/779.js"},{"revision":"b81728b5e1b17d1a97c4d313d31885e6","url":"js/805.js"},{"revision":"96d34f8ee06bdf3648b177c1df72a243","url":"js/819.js"},{"revision":"bddc2df10455e126abbb69d8536a81e8","url":"js/822.js"},{"revision":"a3ad19dd4ad29600ef3ca3834b8c521f","url":"js/826.js"},{"revision":"6b3d541706d9a0bf73507a291f446f19","url":"js/858.js"},{"revision":"efb7b74d73618fe5d60cdcd0cf2234f7","url":"js/889.js"},{"revision":"1282ca5084f2c8db81dfd0df096b6b17","url":"js/939.js"},{"revision":"436ec4f31310e36e59e570401b05b9df","url":"js/948.js"},{"revision":"86fd07db1cc4c9984d189b8606ca1c91","url":"js/954.js"},{"revision":"5e9b2b8d0d58b21e997b094af9fbaa0f","url":"js/978.js"},{"revision":"3a6728fb5a8f1549e9697fb29c31be12","url":"js/app.js"},{"revision":"6b5967ef4259c2cdbe488ea50a954537","url":"js/pdfjsWorker.app.js"},{"revision":"747e30f29ccb4248f2854af4a2d3aa78","url":"js/pdfjsWorker.js"},{"revision":"d08b881221ba7c7341dbbfe1d480c6f5","url":"js/resources_js_Pages_Auth_Login_vue.app.js"},{"revision":"c9d24332c6a7a7f059e73ca9b6d1980c","url":"js/resources_js_Pages_Auth_Login_vue.js"},{"revision":"a6a3d16101ac772f9de4ff50bedbb5a4","url":"js/resources_js_Pages_BookType_Create_vue.js"},{"revision":"6cf56e622a723c088d86216736904cbd","url":"js/resources_js_Pages_BookType_Edit_vue.js"},{"revision":"c23c872fe0c689665954e43dadb129a1","url":"js/resources_js_Pages_BookType_Index_vue.js"},{"revision":"893efdce7c45b7d15e9997bdc39affe2","url":"js/resources_js_Pages_Dashboard_Index_vue.app.js"},{"revision":"69c506425a803d66c9475255816b3632","url":"js/resources_js_Pages_Dashboard_Index_vue.js"},{"revision":"c3f0b1e83db1aec441ea91d05ec6cd44","url":"js/resources_js_Pages_Documents_Create_vue.app.js"},{"revision":"348c81a372ab384b67a714a09a2fed10","url":"js/resources_js_Pages_Documents_Create_vue.js"},{"revision":"2dd76846e1be8f1d72c2dfd2587775db","url":"js/resources_js_Pages_Documents_Edit_vue.app.js"},{"revision":"de7f7e063f82305a321c04f8cd61ce64","url":"js/resources_js_Pages_Documents_Edit_vue.js"},{"revision":"3d5f01215586e3df5cc019c784c3d814","url":"js/resources_js_Pages_Documents_Index_vue.app.js"},{"revision":"1cea0a1e502d8b434b3612354f64a55e","url":"js/resources_js_Pages_Documents_Index_vue.js"},{"revision":"e2c6f6aa49e686156cd5991a8e1400af","url":"js/resources_js_Pages_Documents_PDFViewer_vue.app.js"},{"revision":"39282ebfcdbb6d39efa01cf096d64b2b","url":"js/resources_js_Pages_Documents_PDFViewer_vue.js"},{"revision":"56d61990d125c6b7c10f193c0c45c2a2","url":"js/resources_js_Pages_Documents_tes_vue.js"},{"revision":"0a1fdea367ebf68867317dc6318ad83f","url":"js/resources_js_Pages_Guest_Guest_vue.js"},{"revision":"372a4ece83940f83fdc0ced90cbad665","url":"js/resources_js_Pages_Guest_Rent_vue.js"},{"revision":"e5e086e80569d2bd1bd64c198faaa012","url":"js/resources_js_Pages_Organizations_Create_vue.js"},{"revision":"8e11d7e57c66f525d09c3938b79cb63d","url":"js/resources_js_Pages_Organizations_Edit_vue.js"},{"revision":"36d783b5ec26579f35a53875749713f9","url":"js/resources_js_Pages_Organizations_Index_vue.js"},{"revision":"7257313518ebe752933fc01110a66aa5","url":"js/resources_js_Pages_Report_Create_vue.js"},{"revision":"321e3245b1ddcd161026b8870e2362a0","url":"js/resources_js_Pages_Report_Edit_vue.js"},{"revision":"e25923d411a26dd66fdbf46188f54241","url":"js/resources_js_Pages_Report_Index_vue.js"},{"revision":"456a6ef2a67980c19160cd2628d57d16","url":"js/resources_js_Pages_Reports_Edit_vue.js"},{"revision":"2945c340d29d2acf6147a087a6ecc303","url":"js/resources_js_Pages_Reports_Index_copy_vue.js"},{"revision":"2f61bca9c045497113ec36e330d796c9","url":"js/resources_js_Pages_Reports_Index_vue.app.js"},{"revision":"02dd536411ccb2e7c77b109c6f12ee9f","url":"js/resources_js_Pages_Reports_Index_vue.js"},{"revision":"d97cbdcbb670e40b5a1eeaf5f33d1268","url":"js/resources_js_Pages_Reports_Monthly_vue.js"},{"revision":"4ec9832e74aead5160f3635e7376af1b","url":"js/resources_js_Pages_Types_copy_Create_vue.js"},{"revision":"aacd63484b253a138c881218e30999f3","url":"js/resources_js_Pages_Types_copy_Edit_vue.js"},{"revision":"9f49508c7d75d3e339b744c73d1e6bb8","url":"js/resources_js_Pages_Types_copy_Index_vue.js"},{"revision":"eea123b54928a8afbadf8f5b9a3310c6","url":"js/resources_js_Pages_Types_Create_vue.js"},{"revision":"d4bf752ed8583de2ecfc15372107ced5","url":"js/resources_js_Pages_Types_Edit_vue.js"},{"revision":"aaf1ccb42010de8d76f94f8e90ac2dc6","url":"js/resources_js_Pages_Types_Index_vue.js"},{"revision":"6d8ae6d03d28cf91652660c7073cb69f","url":"js/resources_js_Pages_Users_Create_vue.app.js"},{"revision":"99e540598425b432aeee38ec98d86591","url":"js/resources_js_Pages_Users_Create_vue.js"},{"revision":"9ebb7052122d82e477e86bc0bedf8693","url":"js/resources_js_Pages_Users_Edit_vue.app.js"},{"revision":"33d44763f8556bc02026bdf64003acce","url":"js/resources_js_Pages_Users_Edit_vue.js"},{"revision":"16a73a4db91dfbd50bdda416c92f787b","url":"js/resources_js_Pages_Users_Index_vue.app.js"},{"revision":"553e3a9eaa2c9fc0cd1cc57bc461ca43","url":"js/resources_js_Pages_Users_Index_vue.js"},{"revision":"d0f5ae0b57589d4663e96769877ce5cc","url":"sw-config.js"},{"revision":"1d028cacbeda70df31e673f70cd6a250","url":"offline.html"},{"revision":"c3800de3064245378ddefecd40911674","url":"manifest.json"}] || [])

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


