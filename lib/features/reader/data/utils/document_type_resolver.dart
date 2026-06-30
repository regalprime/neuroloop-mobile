import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:neuroloop/features/reader/domain/entities/document_type.dart';

class DocumentTypeResolver {
  const DocumentTypeResolver();

  DocumentType resolve(File file ) {
    switch (path.extension(file.path).toLowerCase()) {
      case '.txt':
        return DocumentType.txt;

        case '.docx':
  return DocumentType.docx;
  case '.pdf':
  return DocumentType.pdf;
  default:
  return DocumentType.unknown;
    }
  }
}