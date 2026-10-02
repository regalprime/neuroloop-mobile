part of 'books_bloc.dart';

enum BooksStatus {
  initial,
  loading,
  importing,
  success,
  failure,
}

final class BooksState extends Equatable {
  final BooksStatus status;
  final List<Book> books;
  final String? errorMessage;

  const BooksState({
    this.status = BooksStatus.initial,
    this.books = const [],
    this.errorMessage,
  });

  bool get isLoading => status == BooksStatus.loading || status == BooksStatus.importing;

  BooksState copyWith({
    BooksStatus? status,
    List<Book>? books,
    String? errorMessage,
  }) {
    return BooksState(
      status: status ?? this.status,
      books: books ?? this.books,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, books, errorMessage];
}
