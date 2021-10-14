// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Todo extends DataClass implements Insertable<Todo> {
  final int? tagId;
  final String title;
  final String description;
  final DateTime? creationTime;
  final int status;
  Todo(
      {this.tagId,
      required this.title,
      required this.description,
      this.creationTime,
      required this.status});
  factory Todo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Todo(
      tagId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      creationTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_time']),
      status: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || tagId != null) {
      map['tag_id'] = Variable<int?>(tagId);
    }
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(description);
    if (!nullToAbsent || creationTime != null) {
      map['creation_time'] = Variable<DateTime?>(creationTime);
    }
    map['status'] = Variable<int>(status);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      tagId:
          tagId == null && nullToAbsent ? const Value.absent() : Value(tagId),
      title: Value(title),
      description: Value(description),
      creationTime: creationTime == null && nullToAbsent
          ? const Value.absent()
          : Value(creationTime),
      status: Value(status),
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      tagId: serializer.fromJson<int?>(json['tagId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      creationTime: serializer.fromJson<DateTime?>(json['creationTime']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tagId': serializer.toJson<int?>(tagId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'creationTime': serializer.toJson<DateTime?>(creationTime),
      'status': serializer.toJson<int>(status),
    };
  }

  Todo copyWith(
          {int? tagId,
          String? title,
          String? description,
          DateTime? creationTime,
          int? status}) =>
      Todo(
        tagId: tagId ?? this.tagId,
        title: title ?? this.title,
        description: description ?? this.description,
        creationTime: creationTime ?? this.creationTime,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('tagId: $tagId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('creationTime: $creationTime, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(tagId, title, description, creationTime, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.tagId == this.tagId &&
          other.title == this.title &&
          other.description == this.description &&
          other.creationTime == this.creationTime &&
          other.status == this.status);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int?> tagId;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime?> creationTime;
  final Value<int> status;
  const TodosCompanion({
    this.tagId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.creationTime = const Value.absent(),
    this.status = const Value.absent(),
  });
  TodosCompanion.insert({
    this.tagId = const Value.absent(),
    required String title,
    required String description,
    this.creationTime = const Value.absent(),
    required int status,
  })  : title = Value(title),
        description = Value(description),
        status = Value(status);
  static Insertable<Todo> custom({
    Expression<int?>? tagId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime?>? creationTime,
    Expression<int>? status,
  }) {
    return RawValuesInsertable({
      if (tagId != null) 'tag_id': tagId,
      if (title != null) 'title': title,
      if (description != null) 'body': description,
      if (creationTime != null) 'creation_time': creationTime,
      if (status != null) 'status': status,
    });
  }

  TodosCompanion copyWith(
      {Value<int?>? tagId,
      Value<String>? title,
      Value<String>? description,
      Value<DateTime?>? creationTime,
      Value<int>? status}) {
    return TodosCompanion(
      tagId: tagId ?? this.tagId,
      title: title ?? this.title,
      description: description ?? this.description,
      creationTime: creationTime ?? this.creationTime,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tagId.present) {
      map['tag_id'] = Variable<int?>(tagId.value);
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
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('tagId: $tagId, ')
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
  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  late final GeneratedColumn<int?> tagId = GeneratedColumn<int?>(
      'tag_id', aliasedName, true,
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
      'status', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [tagId, title, description, creationTime, status];
  @override
  String get aliasedName => _alias ?? 'todos';
  @override
  String get actualTableName => 'todos';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
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
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tagId};
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

class Content extends DataClass implements Insertable<Content> {
  final int? id;
  final String description;
  final DateTime? creationTime;
  final int? tagId;
  Content({this.id, required this.description, this.creationTime, this.tagId});
  factory Content.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Content(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      creationTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_time']),
      tagId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tag_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || creationTime != null) {
      map['creation_time'] = Variable<DateTime?>(creationTime);
    }
    if (!nullToAbsent || tagId != null) {
      map['tag_id'] = Variable<int?>(tagId);
    }
    return map;
  }

  ContentsCompanion toCompanion(bool nullToAbsent) {
    return ContentsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: Value(description),
      creationTime: creationTime == null && nullToAbsent
          ? const Value.absent()
          : Value(creationTime),
      tagId:
          tagId == null && nullToAbsent ? const Value.absent() : Value(tagId),
    );
  }

  factory Content.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Content(
      id: serializer.fromJson<int?>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      creationTime: serializer.fromJson<DateTime?>(json['creationTime']),
      tagId: serializer.fromJson<int?>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'description': serializer.toJson<String>(description),
      'creationTime': serializer.toJson<DateTime?>(creationTime),
      'tagId': serializer.toJson<int?>(tagId),
    };
  }

  Content copyWith(
          {int? id, String? description, DateTime? creationTime, int? tagId}) =>
      Content(
        id: id ?? this.id,
        description: description ?? this.description,
        creationTime: creationTime ?? this.creationTime,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('Content(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('creationTime: $creationTime, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, creationTime, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Content &&
          other.id == this.id &&
          other.description == this.description &&
          other.creationTime == this.creationTime &&
          other.tagId == this.tagId);
}

class ContentsCompanion extends UpdateCompanion<Content> {
  final Value<int?> id;
  final Value<String> description;
  final Value<DateTime?> creationTime;
  final Value<int?> tagId;
  const ContentsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.creationTime = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  ContentsCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.creationTime = const Value.absent(),
    this.tagId = const Value.absent(),
  }) : description = Value(description);
  static Insertable<Content> custom({
    Expression<int?>? id,
    Expression<String>? description,
    Expression<DateTime?>? creationTime,
    Expression<int?>? tagId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (creationTime != null) 'creation_time': creationTime,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  ContentsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? description,
      Value<DateTime?>? creationTime,
      Value<int?>? tagId}) {
    return ContentsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      creationTime: creationTime ?? this.creationTime,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (creationTime.present) {
      map['creation_time'] = Variable<DateTime?>(creationTime.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int?>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('creationTime: $creationTime, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $ContentsTable extends Contents with TableInfo<$ContentsTable, Content> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ContentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _creationTimeMeta =
      const VerificationMeta('creationTime');
  late final GeneratedColumn<DateTime?> creationTime =
      GeneratedColumn<DateTime?>('creation_time', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  late final GeneratedColumn<int?> tagId = GeneratedColumn<int?>(
      'tag_id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES todos(tagId)');
  @override
  List<GeneratedColumn> get $columns => [id, description, creationTime, tagId];
  @override
  String get aliasedName => _alias ?? 'contents';
  @override
  String get actualTableName => 'contents';
  @override
  VerificationContext validateIntegrity(Insertable<Content> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('creation_time')) {
      context.handle(
          _creationTimeMeta,
          creationTime.isAcceptableOrUnknown(
              data['creation_time']!, _creationTimeMeta));
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Content map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Content.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ContentsTable createAlias(String alias) {
    return $ContentsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TodosTable todos = $TodosTable(this);
  late final $ContentsTable contents = $ContentsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todos, contents];
}
