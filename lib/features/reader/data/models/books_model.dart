import 'package:neuroloop/features/reader/domain/entities/book.dart';

class BookModel {
  final String id;
  final String name;
  final String fileName;
  final int size;
  final DateTime importedAt;

  const BookModel({
    required this.id,
    required this.name,
    required this.fileName,
    required this.size,
    required this.importedAt,
  });

  factory BookModel.fromEntity(Book entity) {
    return BookModel(
      id: entity.id,
      name: entity.name,
      fileName: entity.fileName,
      size: entity.size,
      importedAt: entity.importedAt,
    );
  }

  Book toEntity() {
    return Book(
      id: id,
      name: name,
      fileName: fileName,
      size: size,
      importedAt: importedAt,
    );
  }
}
