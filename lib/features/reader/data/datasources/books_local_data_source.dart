import 'package:neuroloop/features/reader/domain/entities/book.dart';

abstract interface class BooksLocalDataSource {
  Future<void> insertBook(Book book);

  Future<List<Book>> getBooks();

  Future<Book?> getBookId(String id);

  Future<void> deleteBook(String id);
}
