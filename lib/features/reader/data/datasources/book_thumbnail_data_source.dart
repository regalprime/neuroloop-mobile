import 'dart:typed_data';

abstract interface class BookThumbnailDataSource {
  Future<Uint8List?> generate({required String filePath});
}
