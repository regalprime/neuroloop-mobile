import 'package:drift/drift.dart';

class BooksTable extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get fileName => text()();

  IntColumn get size => integer()();

  DateTimeColumn get importedAt => dateTime()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

// CREATE TABLE books (
//   id TEXT PRIMARY KEY NOT NULL,
//   name TEXT NOT NULL,
//   file_name TEXT NOT NULL,
//   size INTEGER NOT NULL,
//   imported_at INTEGER NOT NULL
// );
