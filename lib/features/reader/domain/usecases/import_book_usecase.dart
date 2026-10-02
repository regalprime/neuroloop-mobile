import 'dart:io';

import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/domain/repository/books_repository.dart';

class ImportBookUseCase {
  final BooksRepository readerRepository;

  const ImportBookUseCase({required this.readerRepository});

  Future<Book> call(File file) {
    return readerRepository.importBook(file);
  }
}
