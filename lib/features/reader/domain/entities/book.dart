import 'book_content.dart';
import 'book_metadata.dart';
import 'book_resources.dart';
import 'reading_progress.dart';

class Book {
  final BookMetadata metadata;
  final BookContent content;
  final ReadingProgress progress;
  final BookResources resources;

  const Book({
    required this.metadata,
    required this.content,
    required this.progress,
    required this.resources,
  });
}
