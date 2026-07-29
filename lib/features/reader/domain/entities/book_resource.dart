import 'dart:typed_data';

import 'resource_type.dart';

class BookResource {
  final String id;

  final ResourceType type;

  final Uint8List data;

  final String? mimeType;

  final String? fileName;

  const BookResource({
    required this.id,
    required this.type,
    required this.data,
    this.mimeType,
    this.fileName,
  });
}
