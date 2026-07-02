import 'dart:io';

import 'package:neuroloop/features/reader/data/parsers/document_parser.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';

import '../../domain/entities/document_type.dart';

class PdfParser implements DocumentParser {

  @override
  DocumentType get type => DocumentType.pdf;

  @override
    Future<Book> parse(File file) {
       
    }
}
