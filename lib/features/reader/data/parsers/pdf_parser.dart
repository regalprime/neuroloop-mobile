import 'dart:io';

import 'package:neuroloop/features/reader/data/parsers/document_parser.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';

class PdfParser implements DocumentParser {

  @override
    bool canParser(File file) {
      // TODO: implement canParser
      throw UnimplementedError();
    }

  @override
    Future<Book> parse(File file) {
      // TODO: implement importBook
      throw UnimplementedError();
    }
}
