import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getSingleVideoFile();
}

// but exactly it's good to use default Cache manager
Future<void> getSingleImageFile() async {
  print("starting to getting image file");
  final file = await DefaultCacheManager().getSingleFile(
    'https://yastatic.net/s3/ml-handbook/admin/edu_logo_0640b6dbf8.svg',
  );
  print(file.path);
}

Future<void> getSingleVideoFile() async {
  print("starting to getting video file");
  // http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4
  final file = await DefaultCacheManager().getSingleFile(
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  );
  print(file.path);
}

Future<void> ownFileManager() async {
  print("starting to getting own cachemanager image file");
  final file = await CustomCacheManager.instance.getSingleFile(
    'https://yastatic.net/s3/ml-handbook/admin/edu_logo_0640b6dbf8.svg',
  );
  print(file.path);
}

class CustomCacheManager {
  static const _key = 'customCacheKey';
  static CacheManager instance = CacheManager(
    Config(
      _key,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 20,
      repo: JsonCacheInfoRepository(databaseName: _key),
      fileSystem: IOFileSystem(_key),
      fileService: HttpFileService(),
    ),
  );
}
