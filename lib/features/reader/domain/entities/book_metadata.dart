import 'document_type.dart';

class BookMetadata {
  final String id;

  final String title;

  final String? author;

  final String? description;

  final String? thumbnail;

  final String language;

  final int totalPages;

  final int wordCount;

  final DateTime importedAt;

  final DocumentType type;

  const BookMetadata({
    required this.id,
    required this.title,
    this.author,
    this.description,
    this.thumbnail,
    required this.language,
    required this.totalPages,
    required this.wordCount,
    required this.importedAt,
    required this.type,
  });
}
