part of 'reader_bloc.dart';

sealed class ReaderState {
  const ReaderState();
}

class ReaderInitial extends ReaderState {
  const ReaderInitial();
}

class ReaderLoading extends ReaderState {
  const ReaderLoading();
}

class ImportBookLoaded extends ReaderState {
  final List<Book> book;

  const ImportBookLoaded({required this.book});
}

class BookListLoaded extends ReaderState {
  final List<Book> books;

  const BookListLoaded({required this.books});
}

class ReaderFailure extends ReaderState {
  final String message;

  const ReaderFailure({required this.message});
}
