import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await deleteFolder();
}

Future<void> fileGeneration() async {
  Directory? downloadsProvider = await getDownloadsDirectory();
  final doesDownloadFolderExits = await downloadsProvider?.exists();
  if (!(doesDownloadFolderExits ?? false)) {
    downloadsProvider = await downloadsProvider?.create();
  }
  // for macos open Runner and give permission for downloads folder from XCode
  for (int i = 0; i < 10; i++) {
    final file = File("${downloadsProvider?.path}/tempfiles/text$i.txt");
    final doesFileExits = await file.exists();
    if (!doesFileExits) await file.create(recursive: true);
    await file.writeAsString("Hello, world!");
  }
}

Future<void> renameFiles() async {
  Directory? downloadsProvider = await getDownloadsDirectory();
  final doesDownloadFolderExits = await downloadsProvider?.exists();
  if (!(doesDownloadFolderExits ?? false)) {
    downloadsProvider = await downloadsProvider?.create();
  }
  for (int i = 0; i < 10; i++) {
    final file = File("${downloadsProvider?.path}/tempfiles/text$i.txt");
    final doesFileExits = await file.exists();
    if (doesFileExits) {
      await file.rename("${downloadsProvider?.path}/tempfiles/new_text_name_$i.txt");
    }
  }
}

Future<void> deleteFile() async {
  Directory? downloadsProvider = await getDownloadsDirectory();
  final file = File("${downloadsProvider?.path}/tempfiles/text0.txt");
  final doesFileExits = await file.exists();
  if (doesFileExits) {
    await file.delete();
  }
}

Future<void> deleteFolder() async {
  Directory? downloadsProvider = await getDownloadsDirectory();
  final directory = Directory("${downloadsProvider?.path}/tempfiles");
  final doesFileExits = await directory.exists();
  if (doesFileExits) {
    await directory.delete(recursive: true);
  }
}
