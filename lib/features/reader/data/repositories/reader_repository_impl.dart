import 'dart:io';

import '../../domain/entities/book.dart';
import '../../domain/repository/reader_repository.dart';
import '../parsers/document_parser_factory.dart';

class ReaderRepositoryImpl implements ReaderRepository {
  final DocumentParserFactory parserFactory;

  ReaderRepositoryImpl(this.parserFactory);

  @override
  Future<Book> importBook(File file) async {
    final parser = parserFactory.resolve(file);

    return parser.parse(file);
  }
}