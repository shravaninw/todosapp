// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final String description;
  final DateTime? creationTime;
  final int? status;
  Todo(
      {required this.id,
      required this.title,
      required this.description,
      this.creationTime,
      this.status});
  factory Todo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Todo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      creationTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_time']),
      status: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(description);
    if (!nullToAbsent || creationTime != null) {
      map['creation_time'] = Variable<DateTime?>(creationTime);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int?>(status);
    }
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      creationTime: creationTime == null && nullToAbsent
          ? const Value.absent()
          : Value(creationTime),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      creationTime: serializer.fromJson<DateTime?>(json['creationTime']),
      status: serializer.fromJson<int?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'creationTime': serializer.toJson<DateTime?>(creationTime),
      'status': serializer.toJson<int?>(status),
    };
  }

  Todo copyWith(
          {int? id,
          String? title,
          String? description,
          DateTime? creationTime,
          int? status}) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        creationTime: creationTime ?? this.creationTime,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('creationTime: $creationTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, creationTime, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.creationTime == this.creationTime &&
          other.status == this.status);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime?> creationTime;
  final Value<int?> status;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.creationTime = const Value.absent(),
    this.status = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    this.creationTime = const Value.absent(),
    this.status = const Value.absent(),
  })  : title = Value(title),
        description = Value(description);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime?>? creationTime,
    Expression<int?>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'body': description,
      if (creationTime != null) 'creation_time': creationTime,
      if (status != null) 'status': status,
    });
  }

  TodosCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<DateTime?>? creationTime,
      Value<int?>? status}) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creationTime: creationTime ?? this.creationTime,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['body'] = Variable<String>(description.value);
    }
    if (creationTime.present) {
      map['creation_time'] = Variable<DateTime?>(creationTime.value);
    }
    if (status.present) {
      map['status'] = Variable<int?>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('creationTime: $creationTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TodosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'body', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _creationTimeMeta =
      const VerificationMeta('creationTime');
  late final GeneratedColumn<DateTime?> creationTime =
      GeneratedColumn<DateTime?>('creation_time', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<int?> status = GeneratedColumn<int?>(
      'status', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, creationTime, status];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_descriptionMeta,
          description.isAcceptableOrUnknown(data['body']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('creation_time')) {
      context.handle(
          _creationTimeMeta,
          creationTime.isAcceptableOrUnknown(
              data['creation_time']!, _creationTimeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Todo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TodosTable todos = $TodosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos];
}
