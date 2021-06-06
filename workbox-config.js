/* eslint-disable no-undef */
module.exports = {
  globDirectory: 'public/',
  globPatterns: [
    '**/*.{js,css,png,jpg,ico,php}','offline.html','manifest.json',
  ],
  swSrc: 'public/sw.js',
  swDest: 'public/offline.js',
  maximumFileSizeToCacheInBytes : 20000000,
}