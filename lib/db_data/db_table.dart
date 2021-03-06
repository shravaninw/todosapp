import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db_table.g.dart';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for drift to know about the generated code

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Todos extends Table {
  //IntColumn get id => integer().nullable().autoIncrement()();
  IntColumn get tagId => integer().nullable().autoIncrement()();

  TextColumn get title => text().withLength(min: 6, max: 32)();

  TextColumn get description => text().named('body')();

  DateTimeColumn get creationTime => dateTime().nullable()();

  IntColumn get status => integer()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

// this annotation tells drift to prepare a database class that uses both of the
// tables we just define
// d. We'll see how to use that database class in a moment.
@DriftDatabase(
  tables: [Todos, Contents],
)
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;
//  @override
//  MigrationStrategy get migration =>
//      MigrationStrategy(onUpgrade: (migrator, from, to) async {
//        if (from == 1) {
//          await migrator.addColumn(todos, todos.tagId);
//          // await migrator.createTable(steps);
//        }
//      });

  Future<List<Todo>> getAllTodos() => select(todos).get();

  Stream<List<Todo>> watchAllTodos() => select(todos).watch();

  Future insertTodo(Todo todo) => into(todos).insert(todo);

  Future deleteTodo(Todo todo) => delete(todos).delete(todo);

  Future updateTodo(Todo todo) => update(todos).replace(todo);
  Stream<List<Content>> watchAllContent(int key) =>
      (select(contents)..where((tbl) => tbl.tagId.equals(key))).watch();
  Future insertContent(Content content) => into(contents).insert(content);
  Future deleteContent(Content content) => delete(contents).delete(content);
}

class Contents extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get description => text()();

  DateTimeColumn get creationTime => dateTime().nullable()();
  IntColumn get tagId =>
      integer().customConstraint('NULL REFERENCES todos(tagId)').nullable()();
}
