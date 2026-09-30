import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/features/reader/presentation/bloc/pdf_reader_bloc/pdf_bloc.dart';

class PdfReaderView extends StatelessWidget {
  const PdfReaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const _PdfReaderContent();
  }
}

class _PdfReaderContent extends StatelessWidget {
  const _PdfReaderContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Reader'),
      ),
      body: BlocBuilder<PdfReaderBloc, PdfReaderState>(
        builder: (context, state) {
          switch (state.status) {
            case PdfReaderStatus.initial:
              return const SizedBox.shrink();

            case PdfReaderStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PdfReaderStatus.failure:
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    state.errorMessage ?? 'Failed to extract PDF text.',
                  ),
                ),
              );

            case PdfReaderStatus.success:
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: SelectableText(
                  state.text,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.6,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
