abstract interface class PdfRepository {
  Future<String> extractText({required String path});
}
