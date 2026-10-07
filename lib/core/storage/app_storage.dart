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

  Future<File> saveFile({required File sourceFile, required String fileName}) async {
    final directory = await booksDirectory();

    final destination = File(
      path.join(directory.path, fileName),
    );

    return sourceFile.copy(destination.path);
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
}
