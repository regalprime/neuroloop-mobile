import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroloop/domain/extension/app_extension.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/presentation/pages/widgets/thumbnail.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.book,
    required this.thumbnail,
    required this.onTap,
    required this.onDelete,
  });

  final Book book;
  final Uint8List? thumbnail;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100.w,
              child: Thumbnail(
                imageBytes: thumbnail,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: onTap,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          book.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: onTap,
                        tooltip: context.l10n.read,
                        icon: const Icon(
                          Icons.menu_book_outlined,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        tooltip: context.l10n.more,
                        icon: const Icon(
                          Icons.more_vert,
                        ),
                      ),
                      IconButton(
                        onPressed: onDelete,
                        tooltip: context.l10n.delete,
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
