import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/domain/usecases/delete_book_usecase.dart';
import 'package:neuroloop/features/reader/domain/usecases/get_book_list_usecase.dart';
import 'package:neuroloop/features/reader/domain/usecases/import_book_usecase.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final ImportBookUseCase importBookUseCase;
  final GetBookListUseCase getBookListUseCase;
  final DeleteBookUsecase deleteBookUsecase;

  BooksBloc({
    required this.importBookUseCase,
    required this.getBookListUseCase,
    required this.deleteBookUsecase,
  }) : super(const BooksState()) {
    on<BookListRequested>(_onBookListRequested);
    on<ImportBookRequested>(_onImportBookRequested, transformer: droppable());
    on<DeleteBookRequested>(_deleteBookRequested);
  }

  Future<void> _deleteBookRequested(DeleteBookRequested event, Emitter<BooksState> emit) async {
    emit(state.copyWith(status: BooksStatus.loading));
    try {
      deleteBookUsecase.call(event.path);
      final books = await getBookListUseCase();
      emit(state.copyWith(status: BooksStatus.success, books: books));
    } catch (e) {
      emit(state.copyWith(status: BooksStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onImportBookRequested(
    ImportBookRequested event,
    Emitter<BooksState> emit,
  ) async {
    emit(state.copyWith(status: BooksStatus.loading));
    try {
      await importBookUseCase(event.file);

      final books = await getBookListUseCase();

      emit(
        state.copyWith(
          books: books,
          status: BooksStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BooksStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onBookListRequested(
    BookListRequested event,
    Emitter<BooksState> emit,
  ) async {
    emit(state.copyWith(status: BooksStatus.loading));
    try {
      final books = await getBookListUseCase();
      emit(state.copyWith(status: BooksStatus.success, books: books));
    } catch (e) {
      emit(state.copyWith(status: BooksStatus.failure, errorMessage: e.toString()));
    }
  }
}
