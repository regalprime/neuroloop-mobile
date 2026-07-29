part of 'book_block.dart';

final class ImageBlock extends BookBlock {
  final String imagePath;

  final double? width;

  final double? height;

  const ImageBlock({
    required super.id,
    required this.imagePath,
    this.width,
    this.height,
  });
}
