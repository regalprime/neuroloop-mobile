part of 'book_block.dart';
final class ImageBlock extends BookBlock{
    final String path;
    final double? width;
    final double? height;
    const ImageBlock({required this.path, this.width, this.height});
}