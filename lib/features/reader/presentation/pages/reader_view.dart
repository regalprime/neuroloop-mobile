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
    // Load initial book list when the view is created
    context.read<ReaderBloc>().add(GetBookListRequest());
  }

  Widget _importButton({required String text}) {
    return GestureDetector(
      onTap: _pickAndImportBook,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _pickAndImportBook() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'epub', 'txt'], // adjust as needed
    );

    if (result != null && result.files.isNotEmpty) {
      final file = File(result.files.single.path!);
      if (!mounted) return;
      context.read<ReaderBloc>().add(ImportBookRequest(file: file));
    }
  }

  Widget _bookList() {
    return BlocConsumer<ReaderBloc, ReaderState>(
      listener: (context, state) {
        if (state is ImportBookLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('book imported!'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ReaderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BookListLoaded) {
          final List<Book> books = state.books;
          if (books.isEmpty) {
            return Center(
              child: Text(context.l10n.noBooksAvailable),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: Text(book.metadata.title),
                  subtitle: Text('ID: ddd'),
                ),
              );
            },
          );
        } else if (state is ReaderFailure) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          // ReaderInitial or other states
          return const Center(child: Text('No books loaded'));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _importButton(text: context.l10n.import),
          _bookList(),
        ],
      ),
    );
  }
}
