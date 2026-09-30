import 'package:neuroloop/features/reader/domain/repository/pdf_repository.dart';

class ExtractTextUsecase {
  final PdfRepository repository;

  const ExtractTextUsecase({required this.repository});

  Future<String> call({required String path}) async {
    return repository.extractText(path: path);
  }
}
