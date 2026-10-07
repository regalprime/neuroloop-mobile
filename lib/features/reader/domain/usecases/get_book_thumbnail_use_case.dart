import 'dart:typed_data';

import 'package:neuroloop/features/reader/data/datasources/book_thumbnail_data_source.dart';
import 'package:neuroloop/features/reader/domain/repository/books_repository.dart';

class GetBookThumbnailUseCase {
  final BooksRepository repository;
  final BookThumbnailDataSource bookThumbnailDataSource;

  const GetBookThumbnailUseCase({required this.repository, required this.bookThumbnailDataSource});

  Future<Uint8List?> call({required String bookId}) async {
    final file = await repository.getBookFile(bookId);
    if (file == null) return null;
    return bookThumbnailDataSource.generate(filePath: file.path);
  }
}
