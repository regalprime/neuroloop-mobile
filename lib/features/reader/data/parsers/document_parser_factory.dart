import 'dart:io';

import 'package:neuroloop/features/reader/data/parsers/document_parser.dart';
import 'package:neuroloop/features/reader/data/utils/document_type_resolver.dart';

class DocumentParserFactory {
  final DocumentTypeResolver resolver;
  final List<DocumentParser> parsers;
  const DocumentParserFactory({required this.parsers, required this.resolver});

  DocumentParser resolve(File file) {
    final type = resolver.resolve(file);
    return parsers.firstWhere(
      (parser) => parser.type == type,
      orElse: () =>
          throw UnsupportedError('Document type "$type" is not supportted.'),
    );
  }
}
