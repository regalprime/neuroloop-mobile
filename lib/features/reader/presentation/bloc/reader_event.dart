import 'dart:io';

sealed class ReaderEvent {

  const ReaderEvent();
}

class ImportBookRequest extends ReaderEvent {
  final File file;

  const ImportBookRequest({required this.file});
}
