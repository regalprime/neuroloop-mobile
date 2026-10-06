import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class AppStorage {
  const AppStorage();

  Future<Directory> booksDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();

    final booksDir = Directory(
      path.join(appDir.path, 'books'),
    );

    if (!await booksDir.exists()) {
      await booksDir.create(recursive: true);
    }

    return booksDir;
  }

  Future<File> saveFile({required File source, required String fileName}) async {
    final booksDir = await booksDirectory();

    final destination = File(
      path.join(booksDir.path, fileName),
    );

    return source.copy(destination.path);
  }

  Future<File> getFile(String fileName) async {
    final directory = await booksDirectory();

    return File(path.join(directory.path, fileName));
  }

  Future<void> deleteFile(String fileName) async {
    final file = await getFile(fileName);

    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<bool> fileExists(String fileName) async {
    final file = await getFile(fileName);

    return file.exists();
  }

  Future<String> bookFilePath(String fileName) async {
    final directory = await booksDirectory();

    return path.join(directory.path, fileName);
  }
}
