'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"main.dart.js_6.part.js": "4b6d81274613851339efdea805a2efa1",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"main.dart.js_1.part.js": "113cbca13db449e392dea9f5f8396fa1",
"main.dart.js_8.part.js": "256d9bf3463520fa724820e782d95b9c",
"main.dart.js_13.part.js": "e0a4b4ce68a24f9aa9014da9b68cfe1e",
"main.dart.js_11.part.js": "e47a5ca50a8109d1d962402d14ce3581",
"main.dart.js_3.part.js": "387e536953beda3b34e61149b7239847",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/atlas_icons/lib/fonts/achievement/achievement.ttf": "b4aaadf0bf250f17427edc2bf8d6fffa",
"assets/packages/atlas_icons/lib/fonts/yoga/yoga.ttf": "66b3143038a6ac7a5b3f98ff41ef1002",
"assets/packages/atlas_icons/lib/fonts/sport/sport.ttf": "35b11c59b869732d524129e81095ee7f",
"assets/packages/atlas_icons/lib/fonts/school/school.ttf": "df386f18a52a9184d05a34e44611fc29",
"assets/packages/atlas_icons/lib/fonts/fitness-gym/fitness-gym.ttf": "4271c3a0c2c52db8714961e022c43119",
"assets/packages/atlas_icons/lib/fonts/laboratory/laboratory.ttf": "2ac143285c91dfeaa7bd76b1b9531503",
"assets/packages/atlas_icons/lib/fonts/transportation/transportation.ttf": "7fe16a999c74f8d1d1c5b380eef01d81",
"assets/packages/atlas_icons/lib/fonts/audio/audio.ttf": "3f1061077885938f7d7950997d204c5d",
"assets/packages/atlas_icons/lib/fonts/marketing/marketing.ttf": "a3c9127874bdf909d03f23340ca680e2",
"assets/packages/atlas_icons/lib/fonts/construction/construction.ttf": "cd4e1da1de050086fca243af5904e782",
"assets/packages/atlas_icons/lib/fonts/leadership/leadership.ttf": "027bd6ee2dd9c7eb2fd83ce8c3112024",
"assets/packages/atlas_icons/lib/fonts/business-finance/business-finance.ttf": "f2acea65ddcc3cc9f4f603eeda551ef0",
"assets/packages/atlas_icons/lib/fonts/social/social.ttf": "14e2653eb89f982208a1c844d145ec0b",
"assets/packages/atlas_icons/lib/fonts/arrow/arrow.ttf": "b1de896027e8f8bce86ecb62033361bb",
"assets/packages/atlas_icons/lib/fonts/hand-gesture/hand-gesture.ttf": "23cf587d654b727258bdd2e539cbf3ef",
"assets/packages/atlas_icons/lib/fonts/christmas/christmas.ttf": "0d5b397bbefbc79ec6962cab78cdfa7a",
"assets/packages/atlas_icons/lib/fonts/content-box/content-box.ttf": "bdac94c1cf513f6765423de96650ca97",
"assets/packages/atlas_icons/lib/fonts/weather/weather.ttf": "bf22ee4acf5483d84fcd4fb215f949e7",
"assets/packages/atlas_icons/lib/fonts/travel/travel.ttf": "ad2106403b4f3178091e5b9b65fbc636",
"assets/packages/atlas_icons/lib/fonts/world-monuments/world-monuments.ttf": "b4838b4465611323a6f32f6085fb6629",
"assets/packages/atlas_icons/lib/fonts/winter/winter.ttf": "498547350c07410d7d2b5ef388786d85",
"assets/packages/atlas_icons/lib/fonts/communication/communication.ttf": "98765079271bc5f10b094f70ec20ef35",
"assets/packages/atlas_icons/lib/fonts/real-estate/real-estate.ttf": "6a12f5fce5044802569cafaa0468851d",
"assets/packages/atlas_icons/lib/fonts/internet-security/internet-security.ttf": "1a54b082a574356bf84cc740303ed2a2",
"assets/packages/atlas_icons/lib/fonts/working-together/working-together.ttf": "0bb881a4d35082e410776be5e1207d49",
"assets/packages/atlas_icons/lib/fonts/personal-development/personal-development.ttf": "cc1fffe7122f1837e50149b9469cb537",
"assets/packages/atlas_icons/lib/fonts/virtual-reality/virtual-reality.ttf": "4f154c6974c3ca6c64e6eabdac9aca8b",
"assets/packages/atlas_icons/lib/fonts/ecology/ecology.ttf": "b83e0c5a4760275984251b83c4ae8288",
"assets/packages/atlas_icons/lib/fonts/love/love.ttf": "d1bb0864325a76ac12868703585dca7e",
"assets/packages/atlas_icons/lib/fonts/cinema/cinema.ttf": "2c4d6cff8e18f0d725ff07aa98ef5951",
"assets/packages/atlas_icons/lib/fonts/food-beverage/food-beverage.ttf": "3bd6a218528261210afd0fecba202a31",
"assets/packages/atlas_icons/lib/fonts/web-design/web-design.ttf": "63e6ea1eeede5eb6d7d1b7e7ea5c5797",
"assets/packages/atlas_icons/lib/fonts/goals/goals.ttf": "0f4c7d9e8c7493ce5c97ed3a6900f454",
"assets/packages/atlas_icons/lib/fonts/medical/medical.ttf": "1870469962656e437fe59fbdc1d41f57",
"assets/packages/atlas_icons/lib/fonts/basic-ui/basic-ui.ttf": "66ce98cbb527bcc6ebe7ee107c5b4c7b",
"assets/packages/atlas_icons/lib/fonts/thanksgiving/thanksgiving.ttf": "3361220d1c358b8e5b9705250af2031f",
"assets/packages/atlas_icons/lib/fonts/partnership/partnership.ttf": "153e3d7bf92828c0b6f344462c96b3a1",
"assets/packages/atlas_icons/lib/fonts/hotel-service/hotel-service.ttf": "50c923469385bd7b44dcb324fe548559",
"assets/packages/atlas_icons/lib/fonts/electronic-gadget/electronic-gadget.ttf": "e24858c0b60a69c5646b1547210fff28",
"assets/packages/atlas_icons/lib/fonts/data-document/data-document.ttf": "a9a08ede494be44999414f064b76e564",
"assets/packages/atlas_icons/lib/fonts/furniture/furniture.ttf": "a3ec0d78085d4bd960a42ad5690c74c9",
"assets/AssetManifest.bin": "88b87f2da0480b8ebb89375d6e649c70",
"assets/fonts/MaterialIcons-Regular.otf": "baadbc486cf8e9a1597942c678065dcf",
"assets/AssetManifest.json": "f9bcff4c4cab633c0feefaadda99b217",
"assets/FontManifest.json": "ed9311ab32697d0f96a2f14b5bd8fe5c",
"assets/assets/lottie/developer_desk.json": "01c4951787d169c6a4ccb03943edbbce",
"assets/assets/lottie/monkey.json": "141926ea7cfbd382af934f09ade219ed",
"assets/assets/font/orbitron/Orbitron.ttf": "83b8326522939aff37ae053681ca1e31",
"assets/assets/font/ShantellSans/ShantellSans-Light.ttf": "c07d784cd6792a027af3571271f29aa0",
"assets/assets/font/ShantellSans/ShantellSans-Bold.ttf": "04cd85ded4d207fcb7065b8bb8fcd85d",
"assets/assets/font/ShantellSans/ShantellSans-Italic.ttf": "685e16a696820b27ff34e4f8a545fad8",
"assets/assets/font/ShantellSans/ShantellSans-ExtraBold.ttf": "433d2580e77af1595b673950b7c2a716",
"assets/assets/font/ShantellSans/ShantellSans-SemiBold.ttf": "0104066f61f3f71d5208d1110852830d",
"assets/assets/font/ShantellSans/ShantellSans-Regular.ttf": "eada857f30c6de2f225df9f63a59dc71",
"assets/assets/font/ShantellSans/ShantellSans-Medium.ttf": "f7da5eefd6ab62f4c05cdf592b9bf812",
"assets/assets/svg/gmail.svg": "9dbc79dab48422c821c75bbfc21165ec",
"assets/assets/svg/linkedin.svg": "5302cafeaf1c723e380155709da80c7f",
"assets/assets/svg/java.svg": "832331d4937e354c16dd25d25b9281c3",
"assets/assets/svg/medium.svg": "0ca732c5cffe73a7cea424bda2ad8e1c",
"assets/assets/svg/github.svg": "c7f4f8cd4e1d67c295179575eab41e59",
"assets/assets/svg/phone.svg": "8f49c04b6976b4d4feca1cd7b73da20c",
"assets/assets/svg/leetcode.svg": "28a14b7d648910987e31442f24e18c6e",
"assets/assets/svg/swift.svg": "c2704a6e58cd0b47bba85c77bc7b1c36",
"assets/assets/svg/firebase.svg": "7f1bf2795e067daf4ac3b42a2a140496",
"assets/assets/svg/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/svg/android.svg": "0dcd0fa993872e9dbdcd58e8af1c6ad5",
"assets/assets/svg/ios.svg": "7179728dda9645ae9ac4e3075c3bab1c",
"assets/assets/svg/api.svg": "0c6ae5066afe528eb0f853fb5847a693",
"assets/assets/svg/kotlin.svg": "de7c472e6f5cfd4e95557fcde4b0c3aa",
"assets/assets/svg/hackerrank.svg": "7d39803b637bac7b5ca0b84d77d68e17",
"assets/assets/svg/ui_ux.svg": "65fd586e60b8547358d35011c0319c0b",
"assets/assets/svg/playstore.svg": "81b1c90e39b3bb2551ac4c47c7a77e46",
"assets/assets/svg/python.svg": "a1872cef0fb917ddf4d387e298d9f160",
"assets/assets/svg/resume.svg": "a84bb12509fdd90918b569f49519f7af",
"assets/assets/svg/web.svg": "86495cc2b6fad31d7982c9d806d5f3b7",
"assets/assets/svg/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/assets/svg/windows.svg": "ac2940cbf0983e3fa802f98e482fdb7d",
"assets/assets/image/journal.jpg": "2af80fff5fa4d04bb1031e9941fac643",
"assets/assets/image/udamy_1.jpg": "5975bf7a96a2013f3aabbc7b4c3542a1",
"assets/assets/image/billd.png": "26c6fc418aaa9e1afb03e5ae69226935",
"assets/assets/image/python_cert.jpg": "fc68e4dd0cc2e51801dfd9ae919bb05d",
"assets/assets/image/smriti.png": "74f642a609f1ba6e61023aeef0ad3aff",
"assets/assets/image/codematrix.jpg": "6c80654640f1e8a31caa2b8befda6508",
"assets/assets/image/rommy.png": "a7771a1439967a21e37d2c83fb88ccd5",
"assets/assets/image/problem_solving.png": "9334c7e4c9c4df13d5cfdb5f8bb1ae30",
"assets/assets/image/arise.png": "0a8ee2941fd84bb6d8879040dc05610c",
"assets/assets/image/car.png": "d319eb37a49b7b4f92bd00891e04cb30",
"assets/NOTICES": "4e5895986b1ccd5d627b12ee1dcf54cc",
"assets/AssetManifest.bin.json": "370968c742f354926d7bcf4ff751ddeb",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"manifest.json": "e4a84e7a863fc15bb6a46bfdca624529",
"main.dart.js_2.part.js": "40c1f210ab0a69b8cdfe3f13ab122bcf",
"main.dart.js_5.part.js": "b85c35766376b2dd9b8b22e83e37c2bd",
"index.html": "a667b9013f1b8a4ee962d2b27de30bc5",
"/": "a667b9013f1b8a4ee962d2b27de30bc5",
"version.json": "7367c9ca1c69727a8bb09a7d2d21d48c",
"flutter_bootstrap.js": "fe03f3b23f329bc4703a2d4fb7533e40",
"main.dart.js_9.part.js": "2ee69889b6969bb4a68280eb70cf3686",
"main.dart.js_12.part.js": "18635e7c3544caff602dcc1e1759b73c",
"main.dart.js": "b3f6da05104837b158f38b150d42a990",
"favicon.png": "357a0e21c8d3facf5ed4f9b630c709b4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
