import 'package:get_it/get_it.dart';
import 'package:neuroloop/core/storage/app_storage.dart';
import 'package:neuroloop/core/theme/theme_bloc.dart';
import 'package:neuroloop/core/theme/theme_repository.dart';
import 'package:neuroloop/features/reader/data/repositories/reader_repository_impl.dart';
import 'package:neuroloop/features/reader/data/utils/document_type_resolver.dart';
import 'package:neuroloop/features/reader/domain/repository/reader_repository.dart';
import 'package:neuroloop/features/reader/domain/usecases/get_book_list_usecase.dart';
import 'package:neuroloop/features/reader/domain/usecases/import_book_usecase.dart';
import 'package:neuroloop/features/reader/presentation/bloc/reader_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  await configureCoreModule();

  configureThemeModule();
  configureReaderModule();

  assert(getIt.isRegistered<ThemeBloc>());
  assert(getIt.isRegistered<ReaderRepository>());
}

Future<void> configureCoreModule() async {
  final preferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(
    preferences,
  );

  getIt.registerLazySingleton<AppStorage>(
    () => const AppStorage(),
  );
}

void configureThemeModule() {
  getIt.registerLazySingleton<ThemeRepository>(
    () => SharedPreferencesThemeRepository(
      getIt<SharedPreferences>(),
    ),
  );

  getIt.registerFactory<ThemeBloc>(
    () => ThemeBloc(
      repository: getIt<ThemeRepository>(),
    ),
  );
}

void configureReaderModule() {
  getIt.registerLazySingleton<DocumentTypeResolver>(
    () => const DocumentTypeResolver(),
  );

  getIt.registerLazySingleton<ReaderRepository>(
    () => ReaderRepositoryImpl(
      storage: getIt<AppStorage>(),
    ),
  );

  getIt.registerFactory<ImportBookUseCase>(
    () => ImportBookUseCase(
      readerRepository: getIt<ReaderRepository>(),
    ),
  );

  getIt.registerFactory<GetBookListUseCase>(
    () => GetBookListUseCase(
      readerRepository: getIt<ReaderRepository>(),
    ),
  );

  getIt.registerFactory<ReaderBloc>(
    () => ReaderBloc(
      importBookUseCase: getIt<ImportBookUseCase>(),
      getBookListUseCase: getIt<GetBookListUseCase>(),
    ),
  );
}
