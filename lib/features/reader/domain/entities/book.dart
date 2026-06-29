import 'package:neuroloop/features/reader/domain/entities/book_block.dart';

class Book {
  final String bookId;
  final String bookTitle;
  final List<BookBlock> blocks;
  const Book({required this.bookId, required this.bookTitle, required this.blocks});  
}