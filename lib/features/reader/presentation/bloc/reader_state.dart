part of 'reader_bloc.dart';

enum ReaderStatus {
  initial,
  loading,
  importing,
  success,
  failure,
}

final class ReaderState extends Equatable {
  final ReaderStatus status;
  final List<Book> books;
  final String? errorMessage;

  const ReaderState({
    this.status = ReaderStatus.initial,
    this.books = const [],
    this.errorMessage,
  });

  bool get isLoading => status == ReaderStatus.loading || status == ReaderStatus.importing;

  ReaderState copyWith({
    ReaderStatus? status,
    List<Book>? books,
    String? errorMessage,
  }) {
    return ReaderState(
      status: status ?? this.status,
      books: books ?? this.books,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, books, errorMessage];
}
