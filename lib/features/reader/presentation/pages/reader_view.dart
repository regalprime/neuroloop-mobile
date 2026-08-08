import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/domain/extension/app_extension.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/presentation/bloc/reader_bloc.dart';

class ReaderView extends StatefulWidget {
  const ReaderView({super.key});

  @override
  State<ReaderView> createState() => _ReaderViewState();
}

class _ReaderViewState extends State<ReaderView> {
  @override
  void initState() {
    super.initState();
    context.read<ReaderBloc>().add(const BookListRequested());
  }

  Future<void> _pickAndImportBook() async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'epub', 'txt'],
      );

      final path = result?.files.single.path;

      if (path == null) return;
      if (!mounted) return;
      context.read<ReaderBloc>().add(ImportBookRequested(file: File(path)));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("llllllllllll")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: _ImportButton(
              label: context.l10n.import,
              onPressed: _pickAndImportBook,
            ),
          ),
          Expanded(
            child: BlocConsumer<ReaderBloc, ReaderState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status &&
                  (current.status == ReaderStatus.success || current.status == ReaderStatus.failure),
              listener: (context, state) {
                final messenger = ScaffoldMessenger.of(context);
                if (state.status == ReaderStatus.success) {
                  messenger.showSnackBar(
                    SnackBar(
                      // content: Text(context.l10n.bookImportedSuccessfully),
                      content: Text("lllllll"),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else if (state.status == ReaderStatus.failure && state.books.isNotEmpty) {
                  messenger.showSnackBar(
                    SnackBar(
                      content:
                          // Text(state.errorMessage ?? context.l10n.importFailed),
                          Text(state.errorMessage ?? "llllllllll"),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.status == ReaderStatus.loading && state.books.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status == ReaderStatus.failure && state.books.isEmpty) {
                  return Center(
                    child: Text(
                      // state.errorMessage ?? context.l10n.importFailed,
                      state.errorMessage ?? "llllllll",
                      style: TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  );
                }

                if (state.books.isEmpty) {
                  return Center(child: Text(context.l10n.noBooksAvailable));
                }

                return Column(
                  children: [
                    if (state.isLoading) const LinearProgressIndicator(),
                    Expanded(child: _BookList(books: state.books)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ImportButton extends StatelessWidget {
  const _ImportButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.file_upload_outlined),
      label: Text(label),
    );
  }
}

class _BookList extends StatelessWidget {
  const _BookList({required this.books});

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return Card(
          key: ValueKey(book.id),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(book.name),
            subtitle: Text('ID: ${book.id}'),
          ),
        );
      },
    );
  }
}
