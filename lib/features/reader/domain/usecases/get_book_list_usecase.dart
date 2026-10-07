import 'package:neuroloop/features/reader/domain/entities/book.dart';
import 'package:neuroloop/features/reader/domain/repository/books_repository.dart';

class GetBookListUseCase {
  final BooksRepository readerRepository;

  const GetBookListUseCase({required this.readerRepository});

  Future<List<Book>> call() {
    return readerRepository.getBooks();
  }
}
