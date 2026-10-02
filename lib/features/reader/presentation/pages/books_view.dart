import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:neuroloop/core/router/app_routes.dart';
import 'package:neuroloop/domain/extension/app_extension.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/presentation/bloc/books_bloc/books_bloc.dart';
import 'package:neuroloop/features/reader/presentation/pages/widgets/thumbnail.dart';

class BooksView extends StatefulWidget {
  const BooksView({super.key});

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  @override
  void initState() {
    super.initState();

    context.read<BooksBloc>().add(const BookListRequested());
  }

  Future<void> _pickAndImportBook() async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      final path = result?.files.single.path;

      if (path == null) return;
      if (!mounted) return;

      context.read<BooksBloc>().add(ImportBookRequested(file: File(path)));
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to import PDF.'),
        ),
      );
    }
  }

  void _openBook(Book book) {
    context.push(
      AppRoutes.pdfViewer,
      extra: book.path,
    );
  }

  // Future<void> _deleteBook(String path) {
  //   fd
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<BooksBloc, BooksState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              (current.status == BooksStatus.success || current.status == BooksStatus.failure),
          listener: (context, state) {
            final messenger = ScaffoldMessenger.of(context);

            if (state.status == BooksStatus.success) {
              messenger.showSnackBar(
                const SnackBar(
                  content: Text('Book imported successfully.'),
                  duration: Duration(seconds: 2),
                ),
              );
            } else if (state.status == BooksStatus.failure && state.books.isNotEmpty) {
              messenger.showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage ?? 'Failed to import book.',
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == BooksStatus.loading && state.books.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state.status == BooksStatus.failure && state.books.isEmpty) {
              return Center(
                child: Text(
                  state.errorMessage ?? 'Failed to load books.',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              );
            }

            if (state.books.isEmpty) {
              return Center(
                child: Text(
                  context.l10n.noBooksAvailable,
                ),
              );
            }

            return Column(
              children: [
                if (state.isLoading) const LinearProgressIndicator(),
                Expanded(
                  child: _BookList(
                    books: state.books,
                    onBookTap: _openBook,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickAndImportBook,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _BookList extends StatelessWidget {
  const _BookList({
    required this.books,
    required this.onBookTap,
  });

  final List<Book> books;
  final ValueChanged<Book> onBookTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 200,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];

        return _BookCard(
          book: book,
          onTap: () => onBookTap(book),
        );
      },
    );
  }
}

class _BookCard extends StatelessWidget {
  const _BookCard({
    required this.book,
    required this.onTap,
  });

  final Book book;
  final VoidCallback onTap;

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
                  path: book.path,
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
                          onPressed: () {
                            // TODO: Implement
                          },
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
