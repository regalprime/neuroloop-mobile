import '../../domain/repository/reader_repository.dart';

import '../entities/book.dart';

class GetBookListUseCase {
  final ReaderRepository readerRepository;
  const GetBookListUseCase({required this.readerRepository});

  Future<List<Book>> call() {
    return readerRepository.getBookList();
  }
}
