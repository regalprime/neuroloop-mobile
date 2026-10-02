import 'dart:io';

import '../entities/book.dart';

abstract interface class BooksRepository {
  Future<Book> importBook(File file);

  Future<List<Book>> getBookList();

  Future<void> deleteBook(String path);
}
