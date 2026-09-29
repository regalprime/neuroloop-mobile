import 'package:get_it/get_it.dart';
import 'package:neuroloop/core/localization/bloc/language_bloc.dart';
import 'package:neuroloop/core/localization/language_repository.dart';
import 'package:neuroloop/core/platform/alarm_platform_service.dart';
import 'package:neuroloop/core/storage/app_storage.dart';
import 'package:neuroloop/core/theme/bloc/theme_bloc.dart';
import 'package:neuroloop/core/theme/theme_repository.dart';
import 'package:neuroloop/features/dashboard/data/repositories_impl/alarm_repository_impl.dart';
import 'package:neuroloop/features/dashboard/domain/repositories/alarm_repository.dart';
import 'package:neuroloop/features/dashboard/domain/usecases/cancel_alarm.dart';
import 'package:neuroloop/features/dashboard/domain/usecases/open_exact_alarm_settings.dart';
import 'package:neuroloop/features/dashboard/domain/usecases/request_notification_permission.dart';
import 'package:neuroloop/features/dashboard/domain/usecases/schedule_alarm.dart';
import 'package:neuroloop/features/dashboard/presentation/bloc/alarm_bloc.dart';
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
  configureLanguageModule();
  configureAlarmModule();
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

void configureAlarmModule() {
  getIt.registerLazySingleton<AlarmPlatformService>(
    () => AlarmPlatformService(),
  );

  getIt.registerLazySingleton<AlarmRepository>(
    () => AlarmRepositoryImpl(alarmPlatformService: getIt<AlarmPlatformService>()),
  );

  getIt.registerFactory<ScheduleAlarmUseCase>(() => ScheduleAlarmUseCase(repository: getIt<AlarmRepository>()));

  getIt.registerFactory<CancelAlarmUseCase>(() => CancelAlarmUseCase(repository: getIt<AlarmRepository>()));

  getIt.registerFactory<OpenExactAlarmSettingsUseCase>(
      () => OpenExactAlarmSettingsUseCase(repository: getIt<AlarmRepository>()));

  getIt.registerFactory<RequestNotificationPermissionUseCase>(
      () => RequestNotificationPermissionUseCase(repository: getIt<AlarmRepository>()));

  getIt.registerFactory<AlarmBloc>(
    () => AlarmBloc(
        scheduleAlarmUseCase: getIt<ScheduleAlarmUseCase>(),
        cancelAlarmUseCase: getIt<CancelAlarmUseCase>(),
        openExactAlarmSettingsUseCase: getIt<OpenExactAlarmSettingsUseCase>(),
        requestNotificationPermissionUseCase: getIt<RequestNotificationPermissionUseCase>()),
  );
}

void configureLanguageModule() {
  getIt.registerLazySingleton<LanguageRepository>(
    () => SharedPreferencesLanguageRepository(
      getIt<SharedPreferences>(),
    ),
  );

  getIt.registerFactory<LanguageBloc>(
    () => LanguageBloc(
      repository: getIt<LanguageRepository>(),
    ),
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