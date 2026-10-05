import 'package:equatable/equatable.dart';

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

class Book extends Equatable {
  final String id;
  final String name;
  final String fileName;
  final int size;
  final DateTime importedAt;

  const Book({
    required this.id,
    required this.name,
    required this.fileName,
    required this.size,
    required this.importedAt,
  });

  @override
  List<Object?> get props => [id, name, fileName, size, importedAt];
}
