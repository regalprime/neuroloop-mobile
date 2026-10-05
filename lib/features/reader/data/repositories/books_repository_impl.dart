import 'dart:io';

import 'package:neuroloop/core/storage/app_storage.dart';
import 'package:neuroloop/core/utils/id_generator.dart';
import 'package:neuroloop/features/reader/data/datasources/books_local_data_source.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/domain/repository/books_repository.dart';
import 'package:path/path.dart' as path;

class BooksRepositoryImpl implements BooksRepository {
  final AppStorage storage;
  final BooksLocalDataSource booksLocalDataSource;
  final IdGenerator idGenerator;

  BooksRepositoryImpl({
    required this.storage,
    required this.booksLocalDataSource,
    required this.idGenerator,
  });

  @override
  Future<Book> importBook(File file) async {
    final id = idGenerator.generate();
    final fileExtension = path.extension(file.path);

    final fileName = '$id$fileExtension';

    final saveFile = await storage.saveFile(source: file, fileName: fileName);

    final stat = await saveFile.stat();

    final book = Book(
      id: id,
      name: path.basename(file.path),
      fileName: fileName,
      size: stat.size,
      importedAt: DateTime.now(),
    );

    await booksLocalDataSource.insertBook(book);

    return book;
  }

  @override
  Future<List<Book>> getBookList() {
    return booksLocalDataSource.getBooks();
  }

  @override
  Future<void> deleteBook(String bookId) async {
    final book = await booksLocalDataSource.getBookId(bookId);
    if (book == null) return;

    await storage.deleteFile(book.fileName);
    await booksLocalDataSource.deleteBook(bookId);
  }
}
