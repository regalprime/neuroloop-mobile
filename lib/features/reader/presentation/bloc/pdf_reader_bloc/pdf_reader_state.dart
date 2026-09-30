part of 'pdf_bloc.dart';

enum PdfReaderStatus {
  initial,
  loading,
  success,
  failure,
}

class PdfReaderState extends Equatable {
  final PdfReaderStatus status;
  final String text;
  final String? errorMessage;

  const PdfReaderState({this.status = PdfReaderStatus.initial, this.text = '', this.errorMessage});

  PdfReaderState copyWith({
    PdfReaderStatus? status,
    String? text,
    String? errorMessage,
  }) {
    return PdfReaderState(
      status: status ?? this.status,
      text: text ?? this.text,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, text, errorMessage];
}
