const CACHE_NAME = 'nuye-program-v1';
const ASSETS_TO_CACHE = [
  '/NUYE/',
  '/NUYE/index.html',
  '/NUYE/manifest.json',
  '/NUYE/images/icon-192.png',
  '/NUYE/images/icon-512.png',
  // any other static resources: CSS, JS, images, etc.
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => cache.addAll(ASSETS_TO_CACHE))
      .then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', event => {
  event.waitUntil(self.clients.claim());
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request).then(cachedResp => {
      return cachedResp || fetch(event.request);
    })
  );
});
