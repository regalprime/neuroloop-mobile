import 'package:neuroloop/features/reader/data/datasources/pdf_native_data_source.dart';
import 'package:neuroloop/features/reader/domain/repository/pdf_repository.dart';

class PdfRepositoryImpl implements PdfRepository {
  final PdfNativeDataSource dataSource;

  const PdfRepositoryImpl({required this.dataSource});

  @override
  Future<String> extractText({required String bookId}) async {
    // final path = await booksLocalDataSource

    // TODO
    // sua path
    final path = '';

    return dataSource.extractText(path: path);
  }
}
