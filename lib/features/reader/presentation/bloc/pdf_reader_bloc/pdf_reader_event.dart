part of 'pdf_bloc.dart';

sealed class PdfReaderEvent extends Equatable {
  const PdfReaderEvent();

  @override
  List<Object?> get props => [];
}

final class PdfSelected extends PdfReaderEvent {
  final String path;

  const PdfSelected({required this.path});

  @override
  List<Object?> get props => [path];
}
