part of 'book_block.dart';

final class PageBreakBlock extends BookBlock {
  final int pageNumber;

  const PageBreakBlock({
    required super.id,
    required this.pageNumber,
  });
}
