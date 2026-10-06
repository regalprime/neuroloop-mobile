part of 'pdf_bloc.dart';

sealed class PdfReaderEvent extends Equatable {
  const PdfReaderEvent();

  @override
  List<Object?> get props => [];
}

final class PdfSelected extends PdfReaderEvent {
  final String bookId;

  const PdfSelected({required this.bookId});

  @override
  List<Object?> get props => [bookId];
}
