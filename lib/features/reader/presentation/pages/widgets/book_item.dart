import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/presentation/pages/widgets/thumbnail.dart';

class BookItem extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookItem({
    super.key,
    required this.book,
    required this.onTap,
  });

  String _getTitle({required String name}) {
    final withoutExtension = name.replaceFirst(
      RegExp(r'\.[^.]+$'),
      '',
    );

    return withoutExtension.replaceAll(RegExp(r'[_\-,]+'), ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.w,
                child: Thumbnail(
                  path: book.fileName,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getTitle(name: book.name),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),

                    const Spacer(),

                    // Actions
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // TODO: Implement
                          },
                          tooltip: 'Read',
                          icon: const Icon(Icons.menu_book_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            // TODO: Implement
                          },
                          tooltip: 'More',
                          icon: const Icon(Icons.more_vert),
                        ),
                        IconButton(
                          onPressed: () {},
                          tooltip: 'Delete',
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
