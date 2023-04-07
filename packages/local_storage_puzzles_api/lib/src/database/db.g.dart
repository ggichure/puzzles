// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $PuzzlesItemTableTable extends PuzzlesItemTable
    with TableInfo<$PuzzlesItemTableTable, PuzzlesItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuzzlesItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<String> completedAt = GeneratedColumn<String>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _puzzleTypeMeta =
      const VerificationMeta('puzzleType');
  @override
  late final GeneratedColumn<String> puzzleType = GeneratedColumn<String>(
      'puzzle_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _choicesMeta =
      const VerificationMeta('choices');
  @override
  late final GeneratedColumn<String> choices = GeneratedColumn<String>(
      'choices', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _puzzleIdMeta =
      const VerificationMeta('puzzleId');
  @override
  late final GeneratedColumn<int> puzzleId = GeneratedColumn<int>(
      'puzzle_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, completedAt, puzzleType, choices, puzzleId];
  @override
  String get aliasedName => _alias ?? 'puzzles_item_table';
  @override
  String get actualTableName => 'puzzles_item_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PuzzlesItemTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('puzzle_type')) {
      context.handle(
          _puzzleTypeMeta,
          puzzleType.isAcceptableOrUnknown(
              data['puzzle_type']!, _puzzleTypeMeta));
    }
    if (data.containsKey('choices')) {
      context.handle(_choicesMeta,
          choices.isAcceptableOrUnknown(data['choices']!, _choicesMeta));
    }
    if (data.containsKey('puzzle_id')) {
      context.handle(_puzzleIdMeta,
          puzzleId.isAcceptableOrUnknown(data['puzzle_id']!, _puzzleIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PuzzlesItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PuzzlesItemTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}completed_at']),
      puzzleType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}puzzle_type']),
      choices: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}choices']),
      puzzleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}puzzle_id']),
    );
  }

  @override
  $PuzzlesItemTableTable createAlias(String alias) {
    return $PuzzlesItemTableTable(attachedDatabase, alias);
  }
}

class PuzzlesItemTableData extends DataClass
    implements Insertable<PuzzlesItemTableData> {
  final int? id;
  final String? createdAt;
  final String? completedAt;
  final String? puzzleType;
  final String? choices;
  final int? puzzleId;
  const PuzzlesItemTableData(
      {this.id,
      this.createdAt,
      this.completedAt,
      this.puzzleType,
      this.choices,
      this.puzzleId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<String>(completedAt);
    }
    if (!nullToAbsent || puzzleType != null) {
      map['puzzle_type'] = Variable<String>(puzzleType);
    }
    if (!nullToAbsent || choices != null) {
      map['choices'] = Variable<String>(choices);
    }
    if (!nullToAbsent || puzzleId != null) {
      map['puzzle_id'] = Variable<int>(puzzleId);
    }
    return map;
  }

  PuzzlesItemTableCompanion toCompanion(bool nullToAbsent) {
    return PuzzlesItemTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      puzzleType: puzzleType == null && nullToAbsent
          ? const Value.absent()
          : Value(puzzleType),
      choices: choices == null && nullToAbsent
          ? const Value.absent()
          : Value(choices),
      puzzleId: puzzleId == null && nullToAbsent
          ? const Value.absent()
          : Value(puzzleId),
    );
  }

  factory PuzzlesItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuzzlesItemTableData(
      id: serializer.fromJson<int?>(json['id']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      completedAt: serializer.fromJson<String?>(json['completedAt']),
      puzzleType: serializer.fromJson<String?>(json['puzzleType']),
      choices: serializer.fromJson<String?>(json['choices']),
      puzzleId: serializer.fromJson<int?>(json['puzzleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'createdAt': serializer.toJson<String?>(createdAt),
      'completedAt': serializer.toJson<String?>(completedAt),
      'puzzleType': serializer.toJson<String?>(puzzleType),
      'choices': serializer.toJson<String?>(choices),
      'puzzleId': serializer.toJson<int?>(puzzleId),
    };
  }

  PuzzlesItemTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> completedAt = const Value.absent(),
          Value<String?> puzzleType = const Value.absent(),
          Value<String?> choices = const Value.absent(),
          Value<int?> puzzleId = const Value.absent()}) =>
      PuzzlesItemTableData(
        id: id.present ? id.value : this.id,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        puzzleType: puzzleType.present ? puzzleType.value : this.puzzleType,
        choices: choices.present ? choices.value : this.choices,
        puzzleId: puzzleId.present ? puzzleId.value : this.puzzleId,
      );
  @override
  String toString() {
    return (StringBuffer('PuzzlesItemTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('puzzleType: $puzzleType, ')
          ..write('choices: $choices, ')
          ..write('puzzleId: $puzzleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, completedAt, puzzleType, choices, puzzleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuzzlesItemTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt &&
          other.puzzleType == this.puzzleType &&
          other.choices == this.choices &&
          other.puzzleId == this.puzzleId);
}

class PuzzlesItemTableCompanion extends UpdateCompanion<PuzzlesItemTableData> {
  final Value<int?> id;
  final Value<String?> createdAt;
  final Value<String?> completedAt;
  final Value<String?> puzzleType;
  final Value<String?> choices;
  final Value<int?> puzzleId;
  const PuzzlesItemTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.choices = const Value.absent(),
    this.puzzleId = const Value.absent(),
  });
  PuzzlesItemTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.choices = const Value.absent(),
    this.puzzleId = const Value.absent(),
  });
  static Insertable<PuzzlesItemTableData> custom({
    Expression<int>? id,
    Expression<String>? createdAt,
    Expression<String>? completedAt,
    Expression<String>? puzzleType,
    Expression<String>? choices,
    Expression<int>? puzzleId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (puzzleType != null) 'puzzle_type': puzzleType,
      if (choices != null) 'choices': choices,
      if (puzzleId != null) 'puzzle_id': puzzleId,
    });
  }

  PuzzlesItemTableCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? createdAt,
      Value<String?>? completedAt,
      Value<String?>? puzzleType,
      Value<String?>? choices,
      Value<int?>? puzzleId}) {
    return PuzzlesItemTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      puzzleType: puzzleType ?? this.puzzleType,
      choices: choices ?? this.choices,
      puzzleId: puzzleId ?? this.puzzleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<String>(completedAt.value);
    }
    if (puzzleType.present) {
      map['puzzle_type'] = Variable<String>(puzzleType.value);
    }
    if (choices.present) {
      map['choices'] = Variable<String>(choices.value);
    }
    if (puzzleId.present) {
      map['puzzle_id'] = Variable<int>(puzzleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuzzlesItemTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('puzzleType: $puzzleType, ')
          ..write('choices: $choices, ')
          ..write('puzzleId: $puzzleId')
          ..write(')'))
        .toString();
  }
}

class $PuzzlesTableTable extends PuzzlesTable
    with TableInfo<$PuzzlesTableTable, PuzzlesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuzzlesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<String> completedAt = GeneratedColumn<String>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _puzzleTypeMeta =
      const VerificationMeta('puzzleType');
  @override
  late final GeneratedColumn<String> puzzleType = GeneratedColumn<String>(
      'puzzle_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, completedAt, puzzleType];
  @override
  String get aliasedName => _alias ?? 'puzzles_table';
  @override
  String get actualTableName => 'puzzles_table';
  @override
  VerificationContext validateIntegrity(Insertable<PuzzlesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('puzzle_type')) {
      context.handle(
          _puzzleTypeMeta,
          puzzleType.isAcceptableOrUnknown(
              data['puzzle_type']!, _puzzleTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PuzzlesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PuzzlesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}completed_at']),
      puzzleType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}puzzle_type']),
    );
  }

  @override
  $PuzzlesTableTable createAlias(String alias) {
    return $PuzzlesTableTable(attachedDatabase, alias);
  }
}

class PuzzlesTableData extends DataClass
    implements Insertable<PuzzlesTableData> {
  final int? id;
  final String? createdAt;
  final String? completedAt;
  final String? puzzleType;
  const PuzzlesTableData(
      {this.id, this.createdAt, this.completedAt, this.puzzleType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<String>(completedAt);
    }
    if (!nullToAbsent || puzzleType != null) {
      map['puzzle_type'] = Variable<String>(puzzleType);
    }
    return map;
  }

  PuzzlesTableCompanion toCompanion(bool nullToAbsent) {
    return PuzzlesTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      puzzleType: puzzleType == null && nullToAbsent
          ? const Value.absent()
          : Value(puzzleType),
    );
  }

  factory PuzzlesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuzzlesTableData(
      id: serializer.fromJson<int?>(json['id']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      completedAt: serializer.fromJson<String?>(json['completedAt']),
      puzzleType: serializer.fromJson<String?>(json['puzzleType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'createdAt': serializer.toJson<String?>(createdAt),
      'completedAt': serializer.toJson<String?>(completedAt),
      'puzzleType': serializer.toJson<String?>(puzzleType),
    };
  }

  PuzzlesTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> completedAt = const Value.absent(),
          Value<String?> puzzleType = const Value.absent()}) =>
      PuzzlesTableData(
        id: id.present ? id.value : this.id,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        puzzleType: puzzleType.present ? puzzleType.value : this.puzzleType,
      );
  @override
  String toString() {
    return (StringBuffer('PuzzlesTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('puzzleType: $puzzleType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, completedAt, puzzleType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuzzlesTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt &&
          other.puzzleType == this.puzzleType);
}

class PuzzlesTableCompanion extends UpdateCompanion<PuzzlesTableData> {
  final Value<int?> id;
  final Value<String?> createdAt;
  final Value<String?> completedAt;
  final Value<String?> puzzleType;
  const PuzzlesTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.puzzleType = const Value.absent(),
  });
  PuzzlesTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.puzzleType = const Value.absent(),
  });
  static Insertable<PuzzlesTableData> custom({
    Expression<int>? id,
    Expression<String>? createdAt,
    Expression<String>? completedAt,
    Expression<String>? puzzleType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (puzzleType != null) 'puzzle_type': puzzleType,
    });
  }

  PuzzlesTableCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? createdAt,
      Value<String?>? completedAt,
      Value<String?>? puzzleType}) {
    return PuzzlesTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      puzzleType: puzzleType ?? this.puzzleType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<String>(completedAt.value);
    }
    if (puzzleType.present) {
      map['puzzle_type'] = Variable<String>(puzzleType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuzzlesTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('puzzleType: $puzzleType')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $PuzzlesItemTableTable puzzlesItemTable =
      $PuzzlesItemTableTable(this);
  late final $PuzzlesTableTable puzzlesTable = $PuzzlesTableTable(this);
  late final PuzzlesDao puzzlesDao = PuzzlesDao(this as MyDatabase);
  late final PuzzlesItemDao puzzlesItemDao = PuzzlesItemDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [puzzlesItemTable, puzzlesTable];
}
