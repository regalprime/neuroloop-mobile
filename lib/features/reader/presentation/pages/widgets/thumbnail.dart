import 'dart:typed_data';

import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    super.key,
    required this.imageBytes,
  });

  final Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    if (imageBytes == null) {
      return Container(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Center(
          child: Icon(
            Icons.picture_as_pdf_outlined,
            size: 48,
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.memory(
        imageBytes!,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}
