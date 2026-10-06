import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:neuroloop/core/storage/app_storage.dart';
import 'package:pdfx/pdfx.dart';

class Thumbnail extends StatefulWidget {
  const Thumbnail({
    super.key,
    required this.path,
  });

  final String path;

  @override
  State<Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {
  Uint8List? _imageBytes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _renderThumbnail();
  }

  Future<void> _renderThumbnail() async {
    try {
      final filePath = await const AppStorage().bookFilePath(
        widget.path,
      );

      final document = await PdfDocument.openFile(filePath);

      final page = await document.getPage(1);

      final pageImage = await page.render(
        width: 300,
        height: 300 * page.height / page.width,
        format: PdfPageImageFormat.png,
      );

      await page.close();
      await document.close();

      if (!mounted) return;

      setState(() {
        _imageBytes = pageImage?.bytes;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }

    final imageBytes = _imageBytes;

    if (imageBytes == null) {
      return const Center(
        child: Icon(
          Icons.picture_as_pdf_outlined,
          size: 48,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.memory(
        imageBytes,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}
