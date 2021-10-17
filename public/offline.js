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
  ({request}) => request.destination === 'script' ||
                    request.destination === 'style',
  new workbox.strategies.StaleWhileRevalidate({
    cacheName: 'static-resources',
  }),
)

workbox.precaching.precacheAndRoute([{"revision":"4d1cbf7bed26be4ac87faa68eca96999","url":"css/app.css"},{"revision":"d41d8cd98f00b204e9800998ecf8427e","url":"favicon.ico"},{"revision":"3e7db4d73e8129de62371d5b05d5fcd4","url":"images/icons/icon-128x128.png"},{"revision":"4a1d6474058b153d6a3701db33a63f3c","url":"images/icons/icon-144x144.png"},{"revision":"de4ad4410b0375493c8c0e8d88bd9119","url":"images/icons/icon-152x152.png"},{"revision":"957dfc347925a4809a880c87534d85eb","url":"images/icons/icon-192x192.png"},{"revision":"149f682f0d9357c39f6c9cf5c5c95199","url":"images/icons/icon-384x384.png"},{"revision":"18e8d82d9df4ff90df686811d09339b2","url":"images/icons/icon-512x512.png"},{"revision":"3b79af186cd91681758b03225e69bf5e","url":"images/icons/icon-72x72.png"},{"revision":"38f31e5cc3fc52566a2fbcb14f1a09cc","url":"images/icons/icon-96x96.png"},{"revision":"4991d9139ac4a5cca00761448bcc61b4","url":"images/icons/splash-1125x2436.png"},{"revision":"41849a55e70e9af8f55c9d18f6ee6563","url":"images/icons/splash-1242x2208.png"},{"revision":"04936d82edce793f90e2d4af7715703f","url":"images/icons/splash-1242x2688.png"},{"revision":"a13ea6fd727c4e37db172d3371452ed7","url":"images/icons/splash-1536x2048.png"},{"revision":"a0670816158f43b823058da33be87fb4","url":"images/icons/splash-1668x2224.png"},{"revision":"0bd50a4d0a0da075bd1e284e956b49b8","url":"images/icons/splash-1668x2388.png"},{"revision":"163d887752c919b4eccea5bcd5be0a5a","url":"images/icons/splash-2048x2732.png"},{"revision":"c9ad775561223eee7802b0f8d4eb3a13","url":"images/icons/splash-640x1136.png"},{"revision":"fe9c9fbe2e7e6b6b0d6663bfeb72fa78","url":"images/icons/splash-750x1334.png"},{"revision":"f68fecc50c9f87e78a323dabaabfd7ef","url":"images/icons/splash-828x1792.png"},{"revision":"bf677598a57b9539055834af51cf6062","url":"images/vendor/pdfjs-dist/web/shadow.png"},{"revision":"344e4397c1d0c753424c9d79acb5f9a1","url":"index.php"},{"revision":"e9e1b962ca2d912d68028e7f0bda3911","url":"js/109.js"},{"revision":"1f41f962b1677eeabce8dec0784d711c","url":"js/11.js"},{"revision":"531fefb450bdf3e193e8a5ca095a4d7e","url":"js/159.js"},{"revision":"b251099ad57ca1e7b5f9e21be7886659","url":"js/203.js"},{"revision":"bbfdb9529c52c7ef1c5a649e35e5c8d3","url":"js/296.js"},{"revision":"f2b11eb6ff515b975ab4b6e631b63769","url":"js/312.js"},{"revision":"95eff8193a5aab05860b4a8f52c83b46","url":"js/318.js"},{"revision":"e3c5d83d591b96aed2b9c241b7c73bfe","url":"js/322.js"},{"revision":"934dd38fb1f4dc8ccac6ce75d158b9c6","url":"js/350.js"},{"revision":"da73b96784f739fcfa0e10e242f72449","url":"js/352.js"},{"revision":"86443aefa782d24191040dfd94597ccd","url":"js/413.js"},{"revision":"abc1eed1db72c15b669ca5e2a3aa02f4","url":"js/415.js"},{"revision":"42b94c215e3ae1028ce6a9538e8c7df2","url":"js/463.js"},{"revision":"6fb81d4ceca9fcd8a19b6f4d34446c2a","url":"js/468.js"},{"revision":"aeaa1eea6373f7a0035384fb15fe1244","url":"js/547.js"},{"revision":"28a5836a0c2c94ac6ec3c56d006e15a8","url":"js/567.js"},{"revision":"eb13c3f2ba75e2231cc5eb93b3cb23d7","url":"js/568.js"},{"revision":"dc1685347b6afd789fb53efa4775f0bd","url":"js/588.js"},{"revision":"03ef8ba23ad80c14046d532a0300e846","url":"js/653.js"},{"revision":"3dc7c9bde328dc813fbf4afecb1d9ea6","url":"js/712.js"},{"revision":"42234417eae42987a16df356d4c9d09a","url":"js/754.js"},{"revision":"cff5bc9a58a4ac9681f6859576f80ecc","url":"js/757.js"},{"revision":"b3a27d16f366547a930dbda21c162c96","url":"js/759.js"},{"revision":"f87ef49fb62621bb2a7492ba22df2f3a","url":"js/764.js"},{"revision":"477861a467d34eb2aa03a87a264f321e","url":"js/775.js"},{"revision":"08379f3ea0b6feea189554623fb7bb15","url":"js/819.js"},{"revision":"bddc2df10455e126abbb69d8536a81e8","url":"js/822.js"},{"revision":"a3ad19dd4ad29600ef3ca3834b8c521f","url":"js/826.js"},{"revision":"1282ca5084f2c8db81dfd0df096b6b17","url":"js/939.js"},{"revision":"436ec4f31310e36e59e570401b05b9df","url":"js/948.js"},{"revision":"61b659c3ace22242b7761d99ce8e21b8","url":"js/978.js"},{"revision":"fdec692dc7489b397ef88d65148ba5c9","url":"js/app.js"},{"revision":"6b5967ef4259c2cdbe488ea50a954537","url":"js/pdfjsWorker.app.js"},{"revision":"747e30f29ccb4248f2854af4a2d3aa78","url":"js/pdfjsWorker.js"},{"revision":"d08b881221ba7c7341dbbfe1d480c6f5","url":"js/resources_js_Pages_Auth_Login_vue.app.js"},{"revision":"558664172ba4f5ad8220d0e9b5aee863","url":"js/resources_js_Pages_Auth_Login_vue.js"},{"revision":"a6a3d16101ac772f9de4ff50bedbb5a4","url":"js/resources_js_Pages_BookType_Create_vue.js"},{"revision":"6cf56e622a723c088d86216736904cbd","url":"js/resources_js_Pages_BookType_Edit_vue.js"},{"revision":"c23c872fe0c689665954e43dadb129a1","url":"js/resources_js_Pages_BookType_Index_vue.js"},{"revision":"893efdce7c45b7d15e9997bdc39affe2","url":"js/resources_js_Pages_Dashboard_Index_vue.app.js"},{"revision":"bc480cde1d82d420392c1085e02c5c7e","url":"js/resources_js_Pages_Dashboard_Index_vue.js"},{"revision":"c3f0b1e83db1aec441ea91d05ec6cd44","url":"js/resources_js_Pages_Documents_Create_vue.app.js"},{"revision":"f4bcdb78850d4c06b6dcc14c1a1758b1","url":"js/resources_js_Pages_Documents_Create_vue.js"},{"revision":"2dd76846e1be8f1d72c2dfd2587775db","url":"js/resources_js_Pages_Documents_Edit_vue.app.js"},{"revision":"dd3d7408c1eb1c565b4512113837f2af","url":"js/resources_js_Pages_Documents_Edit_vue.js"},{"revision":"3d5f01215586e3df5cc019c784c3d814","url":"js/resources_js_Pages_Documents_Index_vue.app.js"},{"revision":"ebaaf1153b135be04835d9712ca86273","url":"js/resources_js_Pages_Documents_Index_vue.js"},{"revision":"e2c6f6aa49e686156cd5991a8e1400af","url":"js/resources_js_Pages_Documents_PDFViewer_vue.app.js"},{"revision":"23217b44821c1c6693adba313229f98e","url":"js/resources_js_Pages_Documents_PDFViewer_vue.js"},{"revision":"56d61990d125c6b7c10f193c0c45c2a2","url":"js/resources_js_Pages_Documents_tes_vue.js"},{"revision":"e5e086e80569d2bd1bd64c198faaa012","url":"js/resources_js_Pages_Organizations_Create_vue.js"},{"revision":"8e11d7e57c66f525d09c3938b79cb63d","url":"js/resources_js_Pages_Organizations_Edit_vue.js"},{"revision":"36d783b5ec26579f35a53875749713f9","url":"js/resources_js_Pages_Organizations_Index_vue.js"},{"revision":"7257313518ebe752933fc01110a66aa5","url":"js/resources_js_Pages_Report_Create_vue.js"},{"revision":"321e3245b1ddcd161026b8870e2362a0","url":"js/resources_js_Pages_Report_Edit_vue.js"},{"revision":"e25923d411a26dd66fdbf46188f54241","url":"js/resources_js_Pages_Report_Index_vue.js"},{"revision":"33d71a29921f93ee47efe9ff7d934a93","url":"js/resources_js_Pages_Reports_Edit_vue.js"},{"revision":"2f61bca9c045497113ec36e330d796c9","url":"js/resources_js_Pages_Reports_Index_vue.app.js"},{"revision":"e777c3a61a093c0791a1d24c71b77d10","url":"js/resources_js_Pages_Reports_Index_vue.js"},{"revision":"4ec9832e74aead5160f3635e7376af1b","url":"js/resources_js_Pages_Types_copy_Create_vue.js"},{"revision":"aacd63484b253a138c881218e30999f3","url":"js/resources_js_Pages_Types_copy_Edit_vue.js"},{"revision":"9f49508c7d75d3e339b744c73d1e6bb8","url":"js/resources_js_Pages_Types_copy_Index_vue.js"},{"revision":"2e13b54120cd442572f8ec1eb928c819","url":"js/resources_js_Pages_Types_Create_vue.js"},{"revision":"dfde51ff982d20fb497786c360bb0a5c","url":"js/resources_js_Pages_Types_Edit_vue.js"},{"revision":"1846a9abbdf24366a21737c55a6664f6","url":"js/resources_js_Pages_Types_Index_vue.js"},{"revision":"6d8ae6d03d28cf91652660c7073cb69f","url":"js/resources_js_Pages_Users_Create_vue.app.js"},{"revision":"5cd032e387c099d7723f9fa873ab0cf0","url":"js/resources_js_Pages_Users_Create_vue.js"},{"revision":"9ebb7052122d82e477e86bc0bedf8693","url":"js/resources_js_Pages_Users_Edit_vue.app.js"},{"revision":"2228d5b3276ced1cd1a384fa0aca4e01","url":"js/resources_js_Pages_Users_Edit_vue.js"},{"revision":"16a73a4db91dfbd50bdda416c92f787b","url":"js/resources_js_Pages_Users_Index_vue.app.js"},{"revision":"bef46516c489f3be4bc73d739eadb932","url":"js/resources_js_Pages_Users_Index_vue.js"},{"revision":"d0f5ae0b57589d4663e96769877ce5cc","url":"sw-config.js"},{"revision":"1d028cacbeda70df31e673f70cd6a250","url":"offline.html"},{"revision":"c3800de3064245378ddefecd40911674","url":"manifest.json"}] || [])

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


