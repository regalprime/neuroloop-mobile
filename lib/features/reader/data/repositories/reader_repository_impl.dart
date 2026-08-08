import 'dart:io';

import 'package:neuroloop/core/storage/app_storage.dart';

import '../../domain/entities/book.dart';
import '../../domain/repository/reader_repository.dart';

class ReaderRepositoryImpl implements ReaderRepository {
  final AppStorage storage;

  ReaderRepositoryImpl({
    required this.storage,
  });

  @override
  Future<Book> importBook(File file) async {
    final savedFile = await storage.saveBook(file);
    final stat = await savedFile.stat();

    return Book(
      id: savedFile.path,
      name: savedFile.uri.pathSegments.last,
      path: savedFile.path,
      size: stat.size,
      importedAt: DateTime.now(),
    );
  }

  @override
  Future<List<Book>> getBookList() async {
    final files = await storage.getBooks();

    return Future.wait(
      files.map((file) async {
        final stat = await file.stat();

        return Book(
          id: file.path,
          name: file.uri.pathSegments.last,
          path: file.path,
          size: stat.size,
          importedAt: stat.modified,
        );
      }),
    );
  }
}
