import 'dart:io';

import '../../domain/entities/book.dart';

abstract interface class DocumentParser{
  bool canParser(File file);
  Future<Book> parse(File file);
}
