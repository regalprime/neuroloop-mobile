import 'package:neuroloop/features/reader/data/database/app_database.dart';
import 'package:neuroloop/features/reader/data/database/daos/books_dao.dart';
import 'package:neuroloop/features/reader/data/datasources/books_local_data_source.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';

class BooksLocalDataSourceImpl implements BooksLocalDataSource {
  const BooksLocalDataSourceImpl({
    required this.booksDao,
  });

  final BooksDao booksDao;

  @override
  Future<void> insertBook(Book book) {
    return booksDao.insertBook(
      BooksCompanion.insert(
        id: book.id,
        name: book.name,
        fileName: book.fileName,
        size: book.size,
        importedAt: book.importedAt,
      ),
    );
  }

  @override
  Future<List<Book>> getBooks() async {
    final records = await booksDao.getBooks();

    return records.map(_toEntity).toList(growable: false);
  }

  @override
  Future<Book?> getBookById(String id) async {
    final record = await booksDao.getBookById(id);

    if (record == null) {
      return null;
    }

    return _toEntity(record);
  }

  @override
  Future<void> deleteBook(String id) async {
    await booksDao.deleteBook(id);
  }

  @override
  Stream<List<Book>> watchBooks() {
    return booksDao.watchBooks().map(
          (records) => records.map(_toEntity).toList(growable: false),
        );
  }

  Book _toEntity(BookRecord record) {
    return Book(
      id: record.id,
      name: record.name,
      fileName: record.fileName,
      size: record.size,
      importedAt: record.importedAt,
    );
  }
}
