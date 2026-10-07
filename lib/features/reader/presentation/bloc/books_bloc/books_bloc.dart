import 'dart:io';
import 'dart:typed_data';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/domain/usecases/delete_book_usecase.dart';
import 'package:neuroloop/features/reader/domain/usecases/get_book_list_usecase.dart';
import 'package:neuroloop/features/reader/domain/usecases/get_book_thumbnail_use_case.dart';
import 'package:neuroloop/features/reader/domain/usecases/import_book_usecase.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final ImportBookUseCase importBookUseCase;
  final GetBookListUseCase getBookListUseCase;
  final DeleteBookUsecase deleteBookUseCase;
  final GetBookThumbnailUseCase getBookThumbnailUseCase;

  BooksBloc({
    required this.importBookUseCase,
    required this.getBookListUseCase,
    required this.deleteBookUseCase,
    required this.getBookThumbnailUseCase,
  }) : super(const BooksState()) {
    on<BookListRequested>(_onBookListRequested);
    on<ImportBookRequested>(_onImportBookRequested, transformer: droppable());
    on<DeleteBookRequested>(_deleteBookRequested, transformer: droppable());
    on<BookThumbnailRequested>(_onBookThumbnailRequested);
  }

  Future<void> _onBookListRequested(
    BookListRequested event,
    Emitter<BooksState> emit,
  ) async {
    emit(
      state.copyWith(
        status: BooksStatus.loading,
      ),
    );

    try {
      final books = await getBookListUseCase();

      emit(
        state.copyWith(
          status: BooksStatus.success,
          books: books,
          thumbnails: {},
        ),
      );

      for (final book in books) {
        add(
          BookThumbnailRequested(
            bookId: book.id,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: BooksStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onBookThumbnailRequested(
    BookThumbnailRequested event,
    Emitter<BooksState> emit,
  ) async {
    try {
      final thumbnail = await getBookThumbnailUseCase(
        bookId: event.bookId,
      );

      if (isClosed) return;

      final thumbnails = Map<String, Uint8List?>.from(
        state.thumbnails,
      );

      thumbnails[event.bookId] = thumbnail;

      emit(
        state.copyWith(
          thumbnails: thumbnails,
        ),
      );
    } catch (_) {
      if (isClosed) return;

      final thumbnails = Map<String, Uint8List?>.from(
        state.thumbnails,
      );

      thumbnails[event.bookId] = null;

      emit(
        state.copyWith(
          thumbnails: thumbnails,
        ),
      );
    }
  }

  Future<void> _deleteBookRequested(
    DeleteBookRequested event,
    Emitter<BooksState> emit,
  ) async {
    emit(state.copyWith(status: BooksStatus.loading));
    try {
      await deleteBookUseCase.call(bookId: event.bookId);
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
}
