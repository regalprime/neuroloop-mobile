import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class Thumbnail extends StatefulWidget {
  final String path;

  const Thumbnail({super.key, required this.path});

  @override
  State<Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {
  PdfController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = PdfController(
      document: PdfDocument.openFile(widget.path),
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    if (controller == null) {
      return const SizedBox(
        width: 56,
        height: 72,
      );
    }

    return SizedBox(
      width: 56,
      height: 72,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: PdfView(
          controller: controller,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
