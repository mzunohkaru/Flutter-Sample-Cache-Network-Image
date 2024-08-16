import '../manager/json_cache_manager.dart';

Future<void> verifyJsonCacheStorage() async {
  final cacheManager = JsonCacheManager();
  final cacheContents = await cacheManager.getCacheContents();
  print("json exists: $cacheContents");
}

Future<void> clearCache() async {
  final cacheManager = JsonCacheManager();
  await cacheManager.clearCache();
}
