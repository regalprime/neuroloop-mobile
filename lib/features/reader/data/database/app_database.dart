import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/books_dao.dart';
import 'tables/books_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Books,
  ],
  daos: [
    BooksDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(
    executor ??
        driftDatabase(
          name: 'neuroloop',
          native: const DriftNativeOptions(
            shareAcrossIsolates: true,
          ),
        ),
  );

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator migrator) async {
        await migrator.createAll();
      },

      onUpgrade: (Migrator migrator, int from, int to) async {
        // Future migrations will be added here.
      },

      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}