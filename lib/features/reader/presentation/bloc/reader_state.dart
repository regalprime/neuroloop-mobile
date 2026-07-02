import 'package:neuroloop/features/reader/domain/entities/book.dart';

sealed class ReaderState {
  const ReaderState();
}

class ReaderInitial extends ReaderState {}

class ReaderLoading extends ReaderState {}

class ReaderLoaded extends ReaderState {
  final Book book;
  const ReaderLoaded({required this.book});
}

class ReaderFailure extends ReaderState {
  final String message;
  const ReaderFailure({required this.message});
}


