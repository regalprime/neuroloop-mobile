import 'dart:typed_data';

import 'package:neuroloop/features/reader/data/datasources/book_thumbnail_data_source.dart';
import 'package:pdfx/pdfx.dart';

class BookThumbnailDataSourceImpl implements BookThumbnailDataSource {
  const BookThumbnailDataSourceImpl();

  @override
  Future<Uint8List?> generate({required String filePath}) async {
    PdfDocument? document;
    PdfPage? page;
    try {
      document = await PdfDocument.openFile(filePath);
      page = await document.getPage(1);

      final image = await page.render(
        width: 300,
        height: 300 * page.height / page.width,
        format: PdfPageImageFormat.png,
      );

      return image?.bytes;
    } finally {
      await page?.close();
      await document?.close();
    }
  }
}
