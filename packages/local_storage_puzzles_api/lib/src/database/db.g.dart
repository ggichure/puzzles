// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $PuzzlesItemsModelTableTable extends PuzzlesItemsModelTable
    with TableInfo<$PuzzlesItemsModelTableTable, PuzzlesItemsModelTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuzzlesItemsModelTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _puzzleIdMeta =
      const VerificationMeta('puzzleId');
  @override
  late final GeneratedColumn<int> puzzleId = GeneratedColumn<int>(
      'puzzle_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _puzzleTypeMeta =
      const VerificationMeta('puzzleType');
  @override
  late final GeneratedColumn<String> puzzleType = GeneratedColumn<String>(
      'puzzle_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _puzzleItemMeta =
      const VerificationMeta('puzzleItem');
  @override
  late final GeneratedColumnWithTypeConverter<PuzzlesItemModel?, String>
      puzzleItem = GeneratedColumn<String>('puzzle_item', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<PuzzlesItemModel?>(
              $PuzzlesItemsModelTableTable.$converterpuzzleItemn);
  @override
  List<GeneratedColumn> get $columns => [id, puzzleId, puzzleType, puzzleItem];
  @override
  String get aliasedName => _alias ?? 'puzzles_items_model_table';
  @override
  String get actualTableName => 'puzzles_items_model_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PuzzlesItemsModelTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('puzzle_id')) {
      context.handle(_puzzleIdMeta,
          puzzleId.isAcceptableOrUnknown(data['puzzle_id']!, _puzzleIdMeta));
    }
    if (data.containsKey('puzzle_type')) {
      context.handle(
          _puzzleTypeMeta,
          puzzleType.isAcceptableOrUnknown(
              data['puzzle_type']!, _puzzleTypeMeta));
    }
    context.handle(_puzzleItemMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PuzzlesItemsModelTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PuzzlesItemsModelTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      puzzleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}puzzle_id']),
      puzzleType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}puzzle_type']),
      puzzleItem: $PuzzlesItemsModelTableTable.$converterpuzzleItemn.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}puzzle_item'])),
    );
  }

  @override
  $PuzzlesItemsModelTableTable createAlias(String alias) {
    return $PuzzlesItemsModelTableTable(attachedDatabase, alias);
  }

  static TypeConverter<PuzzlesItemModel, String> $converterpuzzleItem =
      PuzzlesItemsModelConverter();
  static TypeConverter<PuzzlesItemModel?, String?> $converterpuzzleItemn =
      NullAwareTypeConverter.wrap($converterpuzzleItem);
}

class PuzzlesItemsModelTableData extends DataClass
    implements Insertable<PuzzlesItemsModelTableData> {
  /// drift id
  final int id;

  /// [puzzleId] used for quick queries
  final int? puzzleId;

  /// [puzzleType] used for quick queries
  final String? puzzleType;

  /// [puzzleItem] full puzzle item
  final PuzzlesItemModel? puzzleItem;
  const PuzzlesItemsModelTableData(
      {required this.id, this.puzzleId, this.puzzleType, this.puzzleItem});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || puzzleId != null) {
      map['puzzle_id'] = Variable<int>(puzzleId);
    }
    if (!nullToAbsent || puzzleType != null) {
      map['puzzle_type'] = Variable<String>(puzzleType);
    }
    if (!nullToAbsent || puzzleItem != null) {
      final converter = $PuzzlesItemsModelTableTable.$converterpuzzleItemn;
      map['puzzle_item'] = Variable<String>(converter.toSql(puzzleItem));
    }
    return map;
  }

  PuzzlesItemsModelTableCompanion toCompanion(bool nullToAbsent) {
    return PuzzlesItemsModelTableCompanion(
      id: Value(id),
      puzzleId: puzzleId == null && nullToAbsent
          ? const Value.absent()
          : Value(puzzleId),
      puzzleType: puzzleType == null && nullToAbsent
          ? const Value.absent()
          : Value(puzzleType),
      puzzleItem: puzzleItem == null && nullToAbsent
          ? const Value.absent()
          : Value(puzzleItem),
    );
  }

  factory PuzzlesItemsModelTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuzzlesItemsModelTableData(
      id: serializer.fromJson<int>(json['id']),
      puzzleId: serializer.fromJson<int?>(json['puzzleId']),
      puzzleType: serializer.fromJson<String?>(json['puzzleType']),
      puzzleItem: serializer.fromJson<PuzzlesItemModel?>(json['puzzleItem']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'puzzleId': serializer.toJson<int?>(puzzleId),
      'puzzleType': serializer.toJson<String?>(puzzleType),
      'puzzleItem': serializer.toJson<PuzzlesItemModel?>(puzzleItem),
    };
  }

  PuzzlesItemsModelTableData copyWith(
          {int? id,
          Value<int?> puzzleId = const Value.absent(),
          Value<String?> puzzleType = const Value.absent(),
          Value<PuzzlesItemModel?> puzzleItem = const Value.absent()}) =>
      PuzzlesItemsModelTableData(
        id: id ?? this.id,
        puzzleId: puzzleId.present ? puzzleId.value : this.puzzleId,
        puzzleType: puzzleType.present ? puzzleType.value : this.puzzleType,
        puzzleItem: puzzleItem.present ? puzzleItem.value : this.puzzleItem,
      );
  @override
  String toString() {
    return (StringBuffer('PuzzlesItemsModelTableData(')
          ..write('id: $id, ')
          ..write('puzzleId: $puzzleId, ')
          ..write('puzzleType: $puzzleType, ')
          ..write('puzzleItem: $puzzleItem')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, puzzleId, puzzleType, puzzleItem);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuzzlesItemsModelTableData &&
          other.id == this.id &&
          other.puzzleId == this.puzzleId &&
          other.puzzleType == this.puzzleType &&
          other.puzzleItem == this.puzzleItem);
}

class PuzzlesItemsModelTableCompanion
    extends UpdateCompanion<PuzzlesItemsModelTableData> {
  final Value<int> id;
  final Value<int?> puzzleId;
  final Value<String?> puzzleType;
  final Value<PuzzlesItemModel?> puzzleItem;
  const PuzzlesItemsModelTableCompanion({
    this.id = const Value.absent(),
    this.puzzleId = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.puzzleItem = const Value.absent(),
  });
  PuzzlesItemsModelTableCompanion.insert({
    this.id = const Value.absent(),
    this.puzzleId = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.puzzleItem = const Value.absent(),
  });
  static Insertable<PuzzlesItemsModelTableData> custom({
    Expression<int>? id,
    Expression<int>? puzzleId,
    Expression<String>? puzzleType,
    Expression<String>? puzzleItem,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (puzzleId != null) 'puzzle_id': puzzleId,
      if (puzzleType != null) 'puzzle_type': puzzleType,
      if (puzzleItem != null) 'puzzle_item': puzzleItem,
    });
  }

  PuzzlesItemsModelTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? puzzleId,
      Value<String?>? puzzleType,
      Value<PuzzlesItemModel?>? puzzleItem}) {
    return PuzzlesItemsModelTableCompanion(
      id: id ?? this.id,
      puzzleId: puzzleId ?? this.puzzleId,
      puzzleType: puzzleType ?? this.puzzleType,
      puzzleItem: puzzleItem ?? this.puzzleItem,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (puzzleId.present) {
      map['puzzle_id'] = Variable<int>(puzzleId.value);
    }
    if (puzzleType.present) {
      map['puzzle_type'] = Variable<String>(puzzleType.value);
    }
    if (puzzleItem.present) {
      final converter = $PuzzlesItemsModelTableTable.$converterpuzzleItemn;
      map['puzzle_item'] = Variable<String>(converter.toSql(puzzleItem.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuzzlesItemsModelTableCompanion(')
          ..write('id: $id, ')
          ..write('puzzleId: $puzzleId, ')
          ..write('puzzleType: $puzzleType, ')
          ..write('puzzleItem: $puzzleItem')
          ..write(')'))
        .toString();
  }
}

class $PuzzlesModelTableTable extends PuzzlesModelTable
    with TableInfo<$PuzzlesModelTableTable, PuzzlesModelTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuzzlesModelTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _puzzleTypeMeta =
      const VerificationMeta('puzzleType');
  @override
  late final GeneratedColumn<String> puzzleType = GeneratedColumn<String>(
      'puzzle_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _puzzleMeta = const VerificationMeta('puzzle');
  @override
  late final GeneratedColumnWithTypeConverter<PuzzlesModel?, String> puzzle =
      GeneratedColumn<String>('puzzle', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<PuzzlesModel?>(
              $PuzzlesModelTableTable.$converterpuzzlen);
  @override
  List<GeneratedColumn> get $columns => [id, puzzleType, puzzle];
  @override
  String get aliasedName => _alias ?? 'puzzles_model_table';
  @override
  String get actualTableName => 'puzzles_model_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PuzzlesModelTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('puzzle_type')) {
      context.handle(
          _puzzleTypeMeta,
          puzzleType.isAcceptableOrUnknown(
              data['puzzle_type']!, _puzzleTypeMeta));
    }
    context.handle(_puzzleMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PuzzlesModelTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PuzzlesModelTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      puzzleType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}puzzle_type']),
      puzzle: $PuzzlesModelTableTable.$converterpuzzlen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}puzzle'])),
    );
  }

  @override
  $PuzzlesModelTableTable createAlias(String alias) {
    return $PuzzlesModelTableTable(attachedDatabase, alias);
  }

  static TypeConverter<PuzzlesModel, String> $converterpuzzle =
      PuzzlesModelConverter();
  static TypeConverter<PuzzlesModel?, String?> $converterpuzzlen =
      NullAwareTypeConverter.wrap($converterpuzzle);
}

class PuzzlesModelTableData extends DataClass
    implements Insertable<PuzzlesModelTableData> {
  /// drift id
  final int id;

  /// [puzzleType] used for quick queries
  final String? puzzleType;

  /// [puzzle] full puzzle
  final PuzzlesModel? puzzle;
  const PuzzlesModelTableData({required this.id, this.puzzleType, this.puzzle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || puzzleType != null) {
      map['puzzle_type'] = Variable<String>(puzzleType);
    }
    if (!nullToAbsent || puzzle != null) {
      final converter = $PuzzlesModelTableTable.$converterpuzzlen;
      map['puzzle'] = Variable<String>(converter.toSql(puzzle));
    }
    return map;
  }

  PuzzlesModelTableCompanion toCompanion(bool nullToAbsent) {
    return PuzzlesModelTableCompanion(
      id: Value(id),
      puzzleType: puzzleType == null && nullToAbsent
          ? const Value.absent()
          : Value(puzzleType),
      puzzle:
          puzzle == null && nullToAbsent ? const Value.absent() : Value(puzzle),
    );
  }

  factory PuzzlesModelTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuzzlesModelTableData(
      id: serializer.fromJson<int>(json['id']),
      puzzleType: serializer.fromJson<String?>(json['puzzleType']),
      puzzle: serializer.fromJson<PuzzlesModel?>(json['puzzle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'puzzleType': serializer.toJson<String?>(puzzleType),
      'puzzle': serializer.toJson<PuzzlesModel?>(puzzle),
    };
  }

  PuzzlesModelTableData copyWith(
          {int? id,
          Value<String?> puzzleType = const Value.absent(),
          Value<PuzzlesModel?> puzzle = const Value.absent()}) =>
      PuzzlesModelTableData(
        id: id ?? this.id,
        puzzleType: puzzleType.present ? puzzleType.value : this.puzzleType,
        puzzle: puzzle.present ? puzzle.value : this.puzzle,
      );
  @override
  String toString() {
    return (StringBuffer('PuzzlesModelTableData(')
          ..write('id: $id, ')
          ..write('puzzleType: $puzzleType, ')
          ..write('puzzle: $puzzle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, puzzleType, puzzle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuzzlesModelTableData &&
          other.id == this.id &&
          other.puzzleType == this.puzzleType &&
          other.puzzle == this.puzzle);
}

class PuzzlesModelTableCompanion
    extends UpdateCompanion<PuzzlesModelTableData> {
  final Value<int> id;
  final Value<String?> puzzleType;
  final Value<PuzzlesModel?> puzzle;
  const PuzzlesModelTableCompanion({
    this.id = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.puzzle = const Value.absent(),
  });
  PuzzlesModelTableCompanion.insert({
    this.id = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.puzzle = const Value.absent(),
  });
  static Insertable<PuzzlesModelTableData> custom({
    Expression<int>? id,
    Expression<String>? puzzleType,
    Expression<String>? puzzle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (puzzleType != null) 'puzzle_type': puzzleType,
      if (puzzle != null) 'puzzle': puzzle,
    });
  }

  PuzzlesModelTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? puzzleType,
      Value<PuzzlesModel?>? puzzle}) {
    return PuzzlesModelTableCompanion(
      id: id ?? this.id,
      puzzleType: puzzleType ?? this.puzzleType,
      puzzle: puzzle ?? this.puzzle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (puzzleType.present) {
      map['puzzle_type'] = Variable<String>(puzzleType.value);
    }
    if (puzzle.present) {
      final converter = $PuzzlesModelTableTable.$converterpuzzlen;
      map['puzzle'] = Variable<String>(converter.toSql(puzzle.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuzzlesModelTableCompanion(')
          ..write('id: $id, ')
          ..write('puzzleType: $puzzleType, ')
          ..write('puzzle: $puzzle')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $PuzzlesItemsModelTableTable puzzlesItemsModelTable =
      $PuzzlesItemsModelTableTable(this);
  late final $PuzzlesModelTableTable puzzlesModelTable =
      $PuzzlesModelTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [puzzlesItemsModelTable, puzzlesModelTable];
}
