part 'code_block.dart';
part 'divider_block.dart';
part 'image_block.dart';
part 'page_break_block.dart';
part 'quote_block.dart';
part 'text_block.dart';

sealed class BookBlock {
  final String id;

  const BookBlock({
    required this.id,
  });
}
