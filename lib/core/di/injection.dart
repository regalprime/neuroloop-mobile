import 'package:get_it/get_it.dart';
import 'package:neuroloop/features/reader/domain/repository/reader_repository.dart';
import 'package:neuroloop/features/reader/domain/usecases/get_book_list_usecase.dart';
import 'package:neuroloop/features/reader/domain/usecases/import_book_usecase.dart';
import 'package:neuroloop/features/reader/presentation/bloc/reader_bloc.dart';

import '../../features/reader/data/parsers/document_parser_factory.dart';
import '../../features/reader/data/parsers/pdf_parser.dart';
import '../../features/reader/data/repositories/reader_repository_impl.dart';
import '../../features/reader/data/utils/document_type_resolver.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  configureThemeModule();
  configureReaderModule();
}

void configureThemeModule() {}

void configureReaderModule() {
  // final resolver = DocumentTypeResolver();
  getIt.registerLazySingleton<DocumentTypeResolver>(() => const DocumentTypeResolver());

  getIt.registerLazySingleton<PdfParser>(
    () => const PdfParser(),
  );

  getIt.registerLazySingleton<DocumentParserFactory>(
    () => DocumentParserFactory(
      resolver: getIt(),
      parsers: [
        getIt<PdfParser>(),
      ],
    ),
  );

  getIt.registerLazySingleton<ReaderRepository>(
    () => ReaderRepositoryImpl(parserFactory: getIt()),
  );

  getIt.registerFactory<ImportBookUseCase>(
    () => ImportBookUseCase(readerRepository: getIt()),
  );

  getIt.registerFactory<GetBookListUseCase>(() => GetBookListUseCase(readerRepository: getIt()));

  getIt.registerFactory<ReaderBloc>(() => ReaderBloc(importBookUseCase: getIt(), getBookListUseCase: getIt()));
}
