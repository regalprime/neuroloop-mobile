part of 'reader_bloc.dart';

sealed class ReaderEvent extends Equatable {
  const ReaderEvent();

  @override
  List<Object?> get props => [];
}

final class BookListRequested extends ReaderEvent {
  const BookListRequested();
}

final class ImportBookRequested extends ReaderEvent {
  final File file;

  const ImportBookRequested({required this.file});

  @override
  List<Object?> get props => [file];
}
