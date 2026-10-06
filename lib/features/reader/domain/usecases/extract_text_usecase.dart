import 'package:neuroloop/features/reader/domain/repository/pdf_repository.dart';

class ExtractTextUseCase {
  final PdfRepository repository;

  const ExtractTextUseCase({required this.repository});

  Future<String> call({required String bookId}) async {
    return repository.extractText(bookId: bookId);
  }
}
