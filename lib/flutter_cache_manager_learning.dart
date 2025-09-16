import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getSingleFile();
}

Future<void> getSingleFile() async {
  print("starting do getting file");
  final file = await DefaultCacheManager().getSingleFile(
    'https://yastatic.net/s3/ml-handbook/admin/edu_logo_0640b6dbf8.svg',
  );
  print(file.path);
}
