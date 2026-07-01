import 'dart:io';

import 'package:neuroloop/features/reader/domain/entities/book.dart';

import '../../domain/entities/document_type.dart';
import 'document_parser.dart';

class TxtParser implements DocumentParser{
  @override
  DocumentType get type => DocumentType.txt;

  @override
    Future<Book> parse(File file) async {
      
    }

}
