import 'dart:io';

import 'package:neuroloop/features/reader/data/parsers/document_parser.dart';

class DocumentParserFactory {
  final List<DocumentParser> parsers;
  const DocumentParserFactory({required this.parsers});

  DocumentParser resolve(File file) {
    return parsers.firstWhere(
      (parser) => parser.canParser(file),
      orElse: () => throw UnsupportedError('Unsupported document file '),
    );
  }
}
