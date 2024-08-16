import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';


class JsonCacheManager extends CacheManager with ImageCacheManager {
  // JSONファイルの名前の一部として使用
  static const key = 'libCachedImageData';

  // シングルトン
  static final JsonCacheManager _instance = JsonCacheManager._();
  factory JsonCacheManager() {
    return _instance;
  }

  JsonCacheManager._()
      : super(
          Config(
            key,
            stalePeriod: const Duration(days: 7),
            maxNrOfCacheObjects: 20,
            repo: JsonCacheInfoRepository(databaseName: key),
            // fileSystem: IOFileSystem(key),
            fileService: HttpFileService(),
          ),
        );

  Future<String> getCacheContents() async {
    final directory = await getApplicationSupportDirectory();
    final path = '${directory.path}/$key.json';
    final file = File(path);

    if (await file.exists()) {
      return await file.readAsString();
    } else {
      return 'キャッシュファイルが見つかりません。';
    }
  }

  Future<void> clearCache() async {
    try {
      await emptyCache();
      print('キャッシュを正常に削除しました。');
    } catch (e) {
      print('キャッシュの削除中にエラーが発生しました: $e');
    }
  }
}
