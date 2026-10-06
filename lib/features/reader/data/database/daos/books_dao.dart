import 'package:drift/drift.dart';
import 'package:neuroloop/features/reader/data/database/app_database.dart';
import 'package:neuroloop/features/reader/data/database/tables/books_table.dart';

part 'books_dao.g.dart';

@DriftAccessor(tables: [Books])
class BooksDao extends DatabaseAccessor<AppDatabase> with _$BooksDaoMixin {
  BooksDao(super.attachedDatabase);

  Future<void> insertBook(BooksCompanion book) {
    return into(books).insert(book);
  }

  Future<List<BookRecord>> getBooks() {
    final query = select(books)
      ..orderBy([
        (book) => OrderingTerm(
              expression: book.importedAt,
              mode: OrderingMode.desc,
            ),
      ]);

    return query.get();
  }

  Future<BookRecord?> getBookById(String id) {
    final query = select(books)..where((book) => book.id.equals(id));

    return query.getSingleOrNull();
  }

  Future<int> deleteBook(String id) {
    return (delete(books)..where((book) => book.id.equals(id))).go();
  }

  Stream<List<BookRecord>> watchBooks() {
    final query = select(books)
      ..orderBy([
        (book) => OrderingTerm(
              expression: book.importedAt,
              mode: OrderingMode.desc,
            ),
      ]);

    return query.watch();
  }

  Future<bool> exists(String id) async {
    final book = await getBookById(id);

    return book != null;
  }
}
