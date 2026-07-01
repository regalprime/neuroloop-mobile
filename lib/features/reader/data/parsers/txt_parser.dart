import 'dart:io';

import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/domain/entities/book_block.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

import '../../domain/entities/document_type.dart';
import 'document_parser.dart';

class TxtParser implements DocumentParser{
  @override
  DocumentType get type => DocumentType.txt;

  @override
    Future<Book> parse(File file) async {
      final text = await file.readAsString();

      return Book(bookId: const Uuid().v4(), bookTitle: path.basenameWithoutExtension(file.path), blocks: [TextBlock(text: text)]);
    }

}
