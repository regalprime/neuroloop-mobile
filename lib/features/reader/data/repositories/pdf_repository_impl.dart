import 'package:neuroloop/features/reader/data/datasources/pdf_native_data_source.dart';
import 'package:neuroloop/features/reader/domain/repository/books_repository.dart';
import 'package:neuroloop/features/reader/domain/repository/pdf_repository.dart';

class PdfRepositoryImpl implements PdfRepository {
  final PdfNativeDataSource dataSource;
  final BooksRepository booksRepository;

  const PdfRepositoryImpl({required this.dataSource, required this.booksRepository});

  @override
  Future<String> extractText({required String bookId}) async {
    final file = await booksRepository.getBookFile(bookId);
    if (file == null) {
      throw Exception('Book file not found: $bookId');
    }

    return dataSource.extractText(path: file.path);
  }
}
