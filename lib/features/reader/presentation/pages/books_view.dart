import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuroloop/core/router/app_routes.dart';
import 'package:neuroloop/design_system/loading/ds_loading.dart';
import 'package:neuroloop/domain/extension/app_extension.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/presentation/bloc/books_bloc/books_bloc.dart';
import 'package:neuroloop/features/reader/presentation/pages/widgets/book_item.dart';

import '../../../../design_system/design_system.dart';

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
      extra: book.id,
    );
  }

  Future<void> _deleteBook({required String bookId}) async {
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: context.l10n.deleteBook,
      content: Text(context.l10n.confirmDeleteBook),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(context.l10n.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(context.l10n.delete),
        ),
      ],
    );

    if (confirmed != true || !mounted) return;

    context.read<BooksBloc>().add(DeleteBookRequested(bookId: bookId));
  }

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
              return const AppLoading();
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
                if (state.isLoading) const AppLoading(),
                Expanded(
                  child: _BookList(
                    books: state.books,
                    onBookTap: _openBook,
                    onDelete: (book) {
                      _deleteBook(bookId: book.id);
                    },
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
  final List<Book> books;
  final ValueChanged<Book> onBookTap;
  final ValueChanged<Book> onDelete;

  const _BookList({
    required this.books,
    required this.onBookTap,
    required this.onDelete,
  });

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

        return BookItem(
          book: book,
          onTap: () => onBookTap(book),
          onDelete: () => onDelete(book),
        );
      },
    );
  }
}
