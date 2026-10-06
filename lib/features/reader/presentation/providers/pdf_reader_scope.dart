import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/core/di/injection.dart';
import 'package:neuroloop/features/reader/presentation/bloc/pdf_reader_bloc/pdf_bloc.dart';

class PdfReaderScope extends StatelessWidget {
  final String bookId;
  final Widget child;

  const PdfReaderScope({super.key, required this.bookId, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PdfReaderBloc>()..add(PdfSelected(bookId: bookId)),
      child: child,
    );
  }
}
