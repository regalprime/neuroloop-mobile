import 'dart:io';

import '../../domain/entities/book.dart';
import '../../domain/entities/document_type.dart';

abstract interface class DocumentParser{
  DocumentType get type;
  Future<Book> parse(File file);
}
