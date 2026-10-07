import 'dart:io';

import '../entities/book.dart';

abstract interface class BooksRepository {
  Future<Book> importBook(File file);

  Future<List<Book>> getBooks();

  Future<Book?> getBook(String bookId);

  Future<File?> getBookFile(String bookId);

  Future<void> deleteBook(String bookId);

  Stream<List<Book>> watchBooks();
}
