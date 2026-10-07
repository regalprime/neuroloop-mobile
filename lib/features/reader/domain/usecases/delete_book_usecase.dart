import 'package:neuroloop/features/reader/domain/repository/books_repository.dart';

class DeleteBookUsecase {
  final BooksRepository repository;

  const DeleteBookUsecase({required this.repository});

  Future<void> call({required String bookId}) {
    return repository.deleteBook(bookId);
  }
}
