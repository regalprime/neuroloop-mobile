part of 'books_bloc.dart';

sealed class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object?> get props => [];
}

final class BookListRequested extends BooksEvent {
  const BookListRequested();
}

final class ImportBookRequested extends BooksEvent {
  final File file;

  const ImportBookRequested({required this.file});

  @override
  List<Object?> get props => [file];
}

final class DeleteBookRequested extends BooksEvent {
  final String path;

  const DeleteBookRequested({required this.path});

  @override
  List<Object?> get props => [path];
}
