import 'dart:io';

import 'package:neuroloop/core/storage/app_storage.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/domain/repository/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final AppStorage storage;

  BooksRepositoryImpl({
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

  @override
  Future<void> deleteBook(String path) {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }
}
