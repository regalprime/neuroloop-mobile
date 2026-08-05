import 'book_content.dart';
import 'book_metadata.dart';
import 'book_resources.dart';
import 'reading_progress.dart';

class Book1 {
  final BookMetadata metadata;
  final BookContent content;
  final ReadingProgress progress;
  final BookResources resources;

  const Book1({
    required this.metadata,
    required this.content,
    required this.progress,
    required this.resources,
  });
}

class Book {
  final String id;
  final String name;
  final String path;
  final int size;
  final DateTime importedAt;

  const Book({
    required this.id,
    required this.name,
    required this.path,
    required this.size,
    required this.importedAt,
  });
}
