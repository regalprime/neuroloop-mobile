import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neuroloop/features/reader/domain/usecases/extract_text_usecase.dart';

part 'pdf_reader_event.dart';
part 'pdf_reader_state.dart';

class PdfReaderBloc extends Bloc<PdfReaderEvent, PdfReaderState> {
  final ExtractTextUsecase extractTextUseCase;

  PdfReaderBloc({required this.extractTextUseCase}) : super(const PdfReaderState()) {
    on<PdfSelected>(_onPdfSelected);
  }

  Future<void> _onPdfSelected(PdfSelected event, Emitter<PdfReaderState> emit) async {
    try {
      emit(state.copyWith(
        status: PdfReaderStatus.loading,
        errorMessage: null,
      ));
      final String text = await extractTextUseCase.call(path: event.path);

      emit(state.copyWith(
        status: PdfReaderStatus.success,
        text: text,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: PdfReaderStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
