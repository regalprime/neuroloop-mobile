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

  Future<File> saveBook(File source) async {
    final booksDir = await booksDirectory();

    final destination = File(
      path.join(
        booksDir.path,
        path.basename(source.path),
      ),
    );

    return source.copy(destination.path);
  }

  Future<List<File>> getBooks() async {
    final booksDir = await booksDirectory();

    return booksDir.listSync().whereType<File>().toList();
  }

  Future<void> deleteBook(String fileName) async {
    final booksDir = await booksDirectory();

    final file = File(
      path.join(booksDir.path, fileName),
    );

    if (await file.exists()) {
      await file.delete();
    }
  }
}
