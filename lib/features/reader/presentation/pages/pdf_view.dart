import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  final String filePath;

  const PdfView({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.file(File(filePath)),
    );
  }
}
