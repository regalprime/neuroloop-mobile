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
  final Map<String, Uint8List?> thumbnails;

  const BooksState({
    this.status = BooksStatus.initial,
    this.books = const [],
    this.thumbnails = const {},
    this.errorMessage,
  });

  bool get isLoading => status == BooksStatus.loading || status == BooksStatus.importing;

  BooksState copyWith({
    BooksStatus? status,
    List<Book>? books,
    Map<String, Uint8List?>? thumbnails,
    String? errorMessage,
  }) {
    return BooksState(
      status: status ?? this.status,
      books: books ?? this.books,
      thumbnails: thumbnails ?? this.thumbnails,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, books, thumbnails, errorMessage];
}
