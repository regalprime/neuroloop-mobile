part of 'reader_bloc.dart';
sealed class ReaderEvent {

  const ReaderEvent();
}

class ImportBookRequest extends ReaderEvent {
  final File file;

  const ImportBookRequest({required this.file});
}

class GetBookListRequest extends ReaderEvent {

  const GetBookListRequest();
}
