import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuroloop/features/reader/domain/usecases/import_book_usecase.dart';
import 'package:neuroloop/features/reader/domain/usecases/get_book_list_usecase.dart';

import '../../domain/entities/book.dart';
part 'reader_event.dart';
part 'reader_state.dart';

class ReaderBloc extends Bloc<ReaderEvent, ReaderState> {
  final ImportBookUseCase importBookUseCase;
  final GetBookListUseCase getBookListUseCase;

  ReaderBloc({
    required this.importBookUseCase,
    required this.getBookListUseCase,
  }) : super(const ReaderInitial()) {
    on<ImportBookRequest>(_onImportPdf);
    on<GetBookListRequest>(_onGetBookList);
  }

  Future<void> _onImportPdf(
    ImportBookRequest event,
    Emitter<ReaderState> emit,
  ) async {
    emit(const ReaderLoading());
    try {
      final book = await importBookUseCase(event.file);
      emit(ImportBookLoaded(book: book));
    } catch (e) {
      emit(ReaderFailure(message: e.toString()));
    }
  }

  Future<void> _onGetBookList(
    GetBookListRequest event,
    Emitter<ReaderState> emit,
  ) async {
    emit(const ReaderLoading());
    try {
      final books = await getBookListUseCase();
      emit(BookListLoaded(books: books));
    } catch (e) {
      emit(ReaderFailure(message: e.toString()));
    }
  }
}