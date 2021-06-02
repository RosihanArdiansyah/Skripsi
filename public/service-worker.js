importScripts(
	'https://storage.googleapis.com/workbox-cdn/releases/4.3.1/workbox-sw.js'
);

workbox.routing.registerRoute(
	new RegExp('/photos/'),
	new workbox.strategies.StaleWhileRevalidate({
		cacheName: 'photos',
		plugins: [
			new workbox.expiration.Plugin({
				maxEntries: 15
			}),
			new workbox.cacheableResponse.Plugin({
				statuses: [200]
			})
		]
	})
);

workbox.precaching.precacheAndRoute([
  {
    "url": "css/app.css",
    "revision": "0d1fd0bca5966aa99e01db282111a736"
  },
  {
    "url": "images/icon-192x192.png",
    "revision": "957dfc347925a4809a880c87534d85eb"
  },
  {
    "url": "images/vendor/pdfjs-dist/web/shadow.png",
    "revision": "bf677598a57b9539055834af51cf6062"
  },
  {
    "url": "js/11.js",
    "revision": "a49e9d9cfae2368b5d2d692967828d06"
  },
  {
    "url": "js/113.js",
    "revision": "f54adf1512952f527bb1049fcee1577f"
  },
  {
    "url": "js/117.js",
    "revision": "cb6e3a89d8741c94fe7e970df6adbe6b"
  },
  {
    "url": "js/123.js",
    "revision": "140e89c2fd097f9aa7a6aff95b160d9a"
  },
  {
    "url": "js/124.js",
    "revision": "decf923c7bef12e095499084f78e5d0c"
  },
  {
    "url": "js/126.js",
    "revision": "e3e4e93693b347919c96e3df4475316e"
  },
  {
    "url": "js/220.js",
    "revision": "56783826fd0cb293e24d9ca3f6bd3132"
  },
  {
    "url": "js/242.js",
    "revision": "a876198087c8896a5d3b4bc97f160477"
  },
  {
    "url": "js/271.js",
    "revision": "8bd808634c88a02e52b0b815f3b68e08"
  },
  {
    "url": "js/274.js",
    "revision": "8448b454d933295f3749a69e81cb4762"
  },
  {
    "url": "js/290.js",
    "revision": "b9075c2220a92df2232ee85052252da4"
  },
  {
    "url": "js/338.js",
    "revision": "5146e8fb206bd0b007f3454719184700"
  },
  {
    "url": "js/342.js",
    "revision": "b102c60587ad138c11f30c5dfa6bc91c"
  },
  {
    "url": "js/362.js",
    "revision": "12e3d3d9d7124f6200b881e345c57921"
  },
  {
    "url": "js/392.js",
    "revision": "4ee55750174d3a7ed9ac20f245237b95"
  },
  {
    "url": "js/407.js",
    "revision": "eaec3feaa167afe5f3f5b31d19d4e13e"
  },
  {
    "url": "js/427.js",
    "revision": "fee769fb2fd92670a5f4672ea74640cb"
  },
  {
    "url": "js/466.js",
    "revision": "7e182a1ba8aff37b3d5f0a0d3815027a"
  },
  {
    "url": "js/526.js",
    "revision": "219a8495ce7f221970115eae70d3e8c0"
  },
  {
    "url": "js/549.js",
    "revision": "98d292f039dab01c471977dbaeaeb8ec"
  },
  {
    "url": "js/58.js",
    "revision": "644297a6cfdec99a69e974244934e411"
  },
  {
    "url": "js/6.js",
    "revision": "063c3efb5c77e9f8c23fd320a6b79b4d"
  },
  {
    "url": "js/629.js",
    "revision": "bb64428860d9b34c32306bc1a9805532"
  },
  {
    "url": "js/631.js",
    "revision": "f6d8c58b2745c1a076784b0cfa0ac94b"
  },
  {
    "url": "js/64.js",
    "revision": "9ca6e59f3ae9187d225ec82f266cdab6"
  },
  {
    "url": "js/71.js",
    "revision": "99d359d8e92c5d1798e4c08a1879a270"
  },
  {
    "url": "js/716.js",
    "revision": "56b79728897664245ccc5c9db63faf88"
  },
  {
    "url": "js/759.js",
    "revision": "b3a27d16f366547a930dbda21c162c96"
  },
  {
    "url": "js/770.js",
    "revision": "c49e45af5a27fa4c7d8ab661d818a7d1"
  },
  {
    "url": "js/782.js",
    "revision": "6ea077ae9507cb9c3b5764a370e35513"
  },
  {
    "url": "js/822.js",
    "revision": "ad832e2481395921180a48b3873511ef"
  },
  {
    "url": "js/826.js",
    "revision": "b41c4e3213d450cc7154b4512c6998a0"
  },
  {
    "url": "js/832.js",
    "revision": "1c5404cc9c1502f656fe621ceceb017b"
  },
  {
    "url": "js/851.js",
    "revision": "daac49b109550cfbf96cab03936613d2"
  },
  {
    "url": "js/858.js",
    "revision": "9b04f648a2bc6e35ea444acaa48b01b6"
  },
  {
    "url": "js/869.js",
    "revision": "ed99ed020a61b24a563f8cac882ddb04"
  },
  {
    "url": "js/893.js",
    "revision": "9a9c7a8096ee0b198db4f88326436f0d"
  },
  {
    "url": "js/907.js",
    "revision": "39276085bed4e2719723037def9e1de6"
  },
  {
    "url": "js/939.js",
    "revision": "a69bb8a4755b1a553663d0d40147fdde"
  },
  {
    "url": "js/app.js",
    "revision": "5cd1b8d5e01d0651df92d9fb5b00a16e"
  },
  {
    "url": "js/pdfjsWorker.js",
    "revision": "747e30f29ccb4248f2854af4a2d3aa78"
  },
  {
    "url": "js/resources_js_Pages_Auth_Login_vue.js",
    "revision": "d08b881221ba7c7341dbbfe1d480c6f5"
  },
  {
    "url": "js/resources_js_Pages_Dashboard_Index_vue.js",
    "revision": "5dab12069414deb98cef63d0284dda4d"
  },
  {
    "url": "js/resources_js_Pages_Documents_Create_vue.js",
    "revision": "aeea83e0173b797214dc70beec2e57e3"
  },
  {
    "url": "js/resources_js_Pages_Documents_Edit_vue.js",
    "revision": "43012c05748eecbc2718d66c0c0927d5"
  },
  {
    "url": "js/resources_js_Pages_Documents_Index_vue.js",
    "revision": "6d1a2526f20e2bf27991e33a027b8f65"
  },
  {
    "url": "js/resources_js_Pages_Documents_searchIndex_vue.js",
    "revision": "7d4d6e36c91bd1ab33c698901aa3bbd4"
  },
  {
    "url": "js/resources_js_Pages_Documents_Show_vue.js",
    "revision": "ec40ad166c6004c27cf657f938c2391c"
  },
  {
    "url": "js/resources_js_Pages_Documents_View_vue.js",
    "revision": "bbe5d6dd7ba6a3170c169a1117a1f82c"
  },
  {
    "url": "js/resources_js_Pages_Reports_Index_vue.js",
    "revision": "a6525717251059ca15e88365ce075107"
  },
  {
    "url": "js/resources_js_Pages_Users_Create_vue.js",
    "revision": "4f9d4f73bea6355eba08046f6641e9fa"
  },
  {
    "url": "js/resources_js_Pages_Users_Edit_vue.js",
    "revision": "530dfd3f86cfe70aa0d7d613e56f9ece"
  },
  {
    "url": "js/resources_js_Pages_Users_Index_vue.js",
    "revision": "5cf04c5786fe59b68057faf07c2165d8"
  },
  {
    "url": "storage/docs/D42115513_skripsi (1).pdf",
    "revision": "0beff0974647135fefe5d98b04f1582e"
  },
  {
    "url": "storage/docs/tes.pdf",
    "revision": "1d305adf61b4bdb38330faa4facb5e16"
  },
  {
    "url": "sw-base.js",
    "revision": "04f5a80d5b726a4b216a9a8013ef30f4"
  },
  {
    "url": "test/tes.pdf",
    "revision": "1d305adf61b4bdb38330faa4facb5e16"
  }
]);

const networkFirstHandler = new workbox.strategies.NetworkFirst({
	cacheName: 'dynamic',
	plugins: [
		new workbox.expiration.Plugin({
			maxEntries: 10
		}),
		new workbox.cacheableResponse.Plugin({
			statuses: [200]
		})
	]
});

const FALLBACK_URL = workbox.precaching.getCacheKeyForURL('/offline.html');
const matcher = ({ event }) => event.request.mode === 'navigate';
const handler = args =>
	networkFirstHandler
		.handle(args)
		.then(response => response || caches.match(FALLBACK_URL))
		.catch(() => caches.match(FALLBACK_URL));

workbox.routing.registerRoute(matcher, handler);