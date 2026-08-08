import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/features/reader/domain/usecases/get_book_list_usecase.dart';
import 'package:neuroloop/features/reader/domain/usecases/import_book_usecase.dart';

import '../../domain/entities/book.dart';

part 'reader_event.dart';
part 'reader_state.dart';

class ReaderBloc extends Bloc<ReaderEvent, ReaderState> {
  final ImportBookUseCase importBookUseCase;
  final GetBookListUseCase getBookListUseCase;

  ReaderBloc({
    required this.importBookUseCase,
    required this.getBookListUseCase,
  }) : super(const ReaderState()) {
    on<BookListRequested>(_onBookListRequested);
    on<ImportBookRequested>(_onImportBookRequested, transformer: droppable());
  }

  Future<void> _onImportBookRequested(
    ImportBookRequested event,
    Emitter<ReaderState> emit,
  ) async {
    emit(state.copyWith(status: ReaderStatus.loading));
    try {
      await importBookUseCase(event.file);

      final books = await getBookListUseCase();
      emit(state.copyWith(books: books, status: ReaderStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ReaderStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onBookListRequested(
    BookListRequested event,
    Emitter<ReaderState> emit,
  ) async {
    emit(state.copyWith(status: ReaderStatus.loading));
    try {
      final books = await getBookListUseCase();
      emit(state.copyWith(status: ReaderStatus.success, books: books));
    } catch (e) {
      emit(state.copyWith(status: ReaderStatus.failure, errorMessage: e.toString()));
    }
  }
}
