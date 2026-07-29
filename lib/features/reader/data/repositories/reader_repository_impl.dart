import 'dart:io';

import '../../domain/entities/book.dart';
import '../../domain/repository/reader_repository.dart';
import '../parsers/document_parser_factory.dart';

class ReaderRepositoryImpl implements ReaderRepository {
  final DocumentParserFactory parserFactory;

  ReaderRepositoryImpl({required this.parserFactory});

  @override
  Future<Book> importBook(File file) async {
    final parser = parserFactory.resolve(file);

    return parser.parse(file);
  }

  @override
  Future<List<Book>> getBookList() async {
    // Placeholder: return empty list; implement actual storage as needed.
    return [];
  }
}
