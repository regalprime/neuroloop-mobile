import 'package:neuroloop/features/reader/domain/repository/books_repository.dart';

class DeleteBookUsecase {
  final BooksRepository repository;

  const DeleteBookUsecase({required this.repository});

  Future<void> call(String path) {
    return repository.deleteBook(path);
  }
}
