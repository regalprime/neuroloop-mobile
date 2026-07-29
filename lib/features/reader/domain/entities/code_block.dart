part of 'book_block.dart';

final class CodeBlock extends BookBlock {
  final String language;

  final String code;

  const CodeBlock({
    required super.id,
    required this.language,
    required this.code,
  });
}
