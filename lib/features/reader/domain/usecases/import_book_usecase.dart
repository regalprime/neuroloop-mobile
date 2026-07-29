import 'dart:io';

import 'package:neuroloop/features/reader/domain/repository/reader_repository.dart';

import '../entities/book.dart';

class ImportBookUseCase {
  final ReaderRepository readerRepository;
  const ImportBookUseCase({required this.readerRepository});

  Future<Book> call(File file ) {
    return readerRepository.importBook(file);
  } 
}