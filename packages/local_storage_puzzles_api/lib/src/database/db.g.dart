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
  late final GeneratedColumnWithTypeConverter<List<String>?, String> choices =
      GeneratedColumn<String>('choices', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>(
              $PuzzlesItemTableTable.$converterchoicesn);
  static const VerificationMeta _puzzleIdMeta =
      const VerificationMeta('puzzleId');
  @override
  late final GeneratedColumn<int> puzzleId = GeneratedColumn<int>(
      'puzzle_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isCorrectMeta =
      const VerificationMeta('isCorrect');
  @override
  late final GeneratedColumn<bool> isCorrect =
      GeneratedColumn<bool>('is_correct', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_correct" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isSimilarMeta =
      const VerificationMeta('isSimilar');
  @override
  late final GeneratedColumn<bool> isSimilar =
      GeneratedColumn<bool>('is_similar', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_similar" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        completedAt,
        puzzleType,
        choices,
        puzzleId,
        isCorrect,
        isSimilar
      ];
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
    context.handle(_choicesMeta, const VerificationResult.success());
    if (data.containsKey('puzzle_id')) {
      context.handle(_puzzleIdMeta,
          puzzleId.isAcceptableOrUnknown(data['puzzle_id']!, _puzzleIdMeta));
    }
    if (data.containsKey('is_correct')) {
      context.handle(_isCorrectMeta,
          isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta));
    }
    if (data.containsKey('is_similar')) {
      context.handle(_isSimilarMeta,
          isSimilar.isAcceptableOrUnknown(data['is_similar']!, _isSimilarMeta));
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
      choices: $PuzzlesItemTableTable.$converterchoicesn.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}choices'])),
      puzzleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}puzzle_id']),
      isCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_correct']),
      isSimilar: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_similar']),
    );
  }

  @override
  $PuzzlesItemTableTable createAlias(String alias) {
    return $PuzzlesItemTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterchoices =
      const ListStringConverter();
  static TypeConverter<List<String>?, String?> $converterchoicesn =
      NullAwareTypeConverter.wrap($converterchoices);
}

class PuzzlesItemTableData extends DataClass
    implements Insertable<PuzzlesItemTableData> {
  final int? id;
  final String? createdAt;
  final String? completedAt;
  final String? puzzleType;
  final List<String>? choices;
  final int? puzzleId;
  final bool? isCorrect;
  final bool? isSimilar;
  const PuzzlesItemTableData(
      {this.id,
      this.createdAt,
      this.completedAt,
      this.puzzleType,
      this.choices,
      this.puzzleId,
      this.isCorrect,
      this.isSimilar});
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
      final converter = $PuzzlesItemTableTable.$converterchoicesn;
      map['choices'] = Variable<String>(converter.toSql(choices));
    }
    if (!nullToAbsent || puzzleId != null) {
      map['puzzle_id'] = Variable<int>(puzzleId);
    }
    if (!nullToAbsent || isCorrect != null) {
      map['is_correct'] = Variable<bool>(isCorrect);
    }
    if (!nullToAbsent || isSimilar != null) {
      map['is_similar'] = Variable<bool>(isSimilar);
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
      isCorrect: isCorrect == null && nullToAbsent
          ? const Value.absent()
          : Value(isCorrect),
      isSimilar: isSimilar == null && nullToAbsent
          ? const Value.absent()
          : Value(isSimilar),
    );
  }

  factory PuzzlesItemTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuzzlesItemTableData(
      id: serializer.fromJson<int?>(json['id']),
      createdAt: serializer.fromJson<String?>(json['created_at']),
      completedAt: serializer.fromJson<String?>(json['completed_at']),
      puzzleType: serializer.fromJson<String?>(json['puzzle_type']),
      choices: serializer.fromJson<List<String>?>(json['choices']),
      puzzleId: serializer.fromJson<int?>(json['puzzle_id']),
      isCorrect: serializer.fromJson<bool?>(json['is_correct']),
      isSimilar: serializer.fromJson<bool?>(json['is_similar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'created_at': serializer.toJson<String?>(createdAt),
      'completed_at': serializer.toJson<String?>(completedAt),
      'puzzle_type': serializer.toJson<String?>(puzzleType),
      'choices': serializer.toJson<List<String>?>(choices),
      'puzzle_id': serializer.toJson<int?>(puzzleId),
      'is_correct': serializer.toJson<bool?>(isCorrect),
      'is_similar': serializer.toJson<bool?>(isSimilar),
    };
  }

  PuzzlesItemTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> completedAt = const Value.absent(),
          Value<String?> puzzleType = const Value.absent(),
          Value<List<String>?> choices = const Value.absent(),
          Value<int?> puzzleId = const Value.absent(),
          Value<bool?> isCorrect = const Value.absent(),
          Value<bool?> isSimilar = const Value.absent()}) =>
      PuzzlesItemTableData(
        id: id.present ? id.value : this.id,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        puzzleType: puzzleType.present ? puzzleType.value : this.puzzleType,
        choices: choices.present ? choices.value : this.choices,
        puzzleId: puzzleId.present ? puzzleId.value : this.puzzleId,
        isCorrect: isCorrect.present ? isCorrect.value : this.isCorrect,
        isSimilar: isSimilar.present ? isSimilar.value : this.isSimilar,
      );
  @override
  String toString() {
    return (StringBuffer('PuzzlesItemTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('puzzleType: $puzzleType, ')
          ..write('choices: $choices, ')
          ..write('puzzleId: $puzzleId, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('isSimilar: $isSimilar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, completedAt, puzzleType,
      choices, puzzleId, isCorrect, isSimilar);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuzzlesItemTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt &&
          other.puzzleType == this.puzzleType &&
          other.choices == this.choices &&
          other.puzzleId == this.puzzleId &&
          other.isCorrect == this.isCorrect &&
          other.isSimilar == this.isSimilar);
}

class PuzzlesItemTableCompanion extends UpdateCompanion<PuzzlesItemTableData> {
  final Value<int?> id;
  final Value<String?> createdAt;
  final Value<String?> completedAt;
  final Value<String?> puzzleType;
  final Value<List<String>?> choices;
  final Value<int?> puzzleId;
  final Value<bool?> isCorrect;
  final Value<bool?> isSimilar;
  const PuzzlesItemTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.choices = const Value.absent(),
    this.puzzleId = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.isSimilar = const Value.absent(),
  });
  PuzzlesItemTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.choices = const Value.absent(),
    this.puzzleId = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.isSimilar = const Value.absent(),
  });
  static Insertable<PuzzlesItemTableData> custom({
    Expression<int>? id,
    Expression<String>? createdAt,
    Expression<String>? completedAt,
    Expression<String>? puzzleType,
    Expression<String>? choices,
    Expression<int>? puzzleId,
    Expression<bool>? isCorrect,
    Expression<bool>? isSimilar,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (puzzleType != null) 'puzzle_type': puzzleType,
      if (choices != null) 'choices': choices,
      if (puzzleId != null) 'puzzle_id': puzzleId,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (isSimilar != null) 'is_similar': isSimilar,
    });
  }

  PuzzlesItemTableCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? createdAt,
      Value<String?>? completedAt,
      Value<String?>? puzzleType,
      Value<List<String>?>? choices,
      Value<int?>? puzzleId,
      Value<bool?>? isCorrect,
      Value<bool?>? isSimilar}) {
    return PuzzlesItemTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      puzzleType: puzzleType ?? this.puzzleType,
      choices: choices ?? this.choices,
      puzzleId: puzzleId ?? this.puzzleId,
      isCorrect: isCorrect ?? this.isCorrect,
      isSimilar: isSimilar ?? this.isSimilar,
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
      final converter = $PuzzlesItemTableTable.$converterchoicesn;
      map['choices'] = Variable<String>(converter.toSql(choices.value));
    }
    if (puzzleId.present) {
      map['puzzle_id'] = Variable<int>(puzzleId.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (isSimilar.present) {
      map['is_similar'] = Variable<bool>(isSimilar.value);
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
          ..write('puzzleId: $puzzleId, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('isSimilar: $isSimilar')
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
  static const VerificationMeta _puzzleIdMeta =
      const VerificationMeta('puzzleId');
  @override
  late final GeneratedColumn<int> puzzleId = GeneratedColumn<int>(
      'puzzle_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _durationInSecondsMeta =
      const VerificationMeta('durationInSeconds');
  @override
  late final GeneratedColumn<int> durationInSeconds = GeneratedColumn<int>(
      'duration_in_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lengthOfCharactersMeta =
      const VerificationMeta('lengthOfCharacters');
  @override
  late final GeneratedColumn<int> lengthOfCharacters = GeneratedColumn<int>(
      'length_of_characters', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _noOfPuzzleItemsMeta =
      const VerificationMeta('noOfPuzzleItems');
  @override
  late final GeneratedColumn<int> noOfPuzzleItems = GeneratedColumn<int>(
      'no_of_puzzle_items', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _completedPuzzlesMeta =
      const VerificationMeta('completedPuzzles');
  @override
  late final GeneratedColumn<int> completedPuzzles = GeneratedColumn<int>(
      'completed_puzzles', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _difficultyLevelMeta =
      const VerificationMeta('difficultyLevel');
  @override
  late final GeneratedColumn<double> difficultyLevel = GeneratedColumn<double>(
      'difficulty_level', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        completedAt,
        puzzleType,
        puzzleId,
        durationInSeconds,
        lengthOfCharacters,
        noOfPuzzleItems,
        completedPuzzles,
        difficultyLevel
      ];
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
    if (data.containsKey('puzzle_id')) {
      context.handle(_puzzleIdMeta,
          puzzleId.isAcceptableOrUnknown(data['puzzle_id']!, _puzzleIdMeta));
    }
    if (data.containsKey('duration_in_seconds')) {
      context.handle(
          _durationInSecondsMeta,
          durationInSeconds.isAcceptableOrUnknown(
              data['duration_in_seconds']!, _durationInSecondsMeta));
    }
    if (data.containsKey('length_of_characters')) {
      context.handle(
          _lengthOfCharactersMeta,
          lengthOfCharacters.isAcceptableOrUnknown(
              data['length_of_characters']!, _lengthOfCharactersMeta));
    }
    if (data.containsKey('no_of_puzzle_items')) {
      context.handle(
          _noOfPuzzleItemsMeta,
          noOfPuzzleItems.isAcceptableOrUnknown(
              data['no_of_puzzle_items']!, _noOfPuzzleItemsMeta));
    }
    if (data.containsKey('completed_puzzles')) {
      context.handle(
          _completedPuzzlesMeta,
          completedPuzzles.isAcceptableOrUnknown(
              data['completed_puzzles']!, _completedPuzzlesMeta));
    }
    if (data.containsKey('difficulty_level')) {
      context.handle(
          _difficultyLevelMeta,
          difficultyLevel.isAcceptableOrUnknown(
              data['difficulty_level']!, _difficultyLevelMeta));
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
      puzzleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}puzzle_id']),
      durationInSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}duration_in_seconds']),
      lengthOfCharacters: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}length_of_characters']),
      noOfPuzzleItems: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}no_of_puzzle_items']),
      completedPuzzles: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}completed_puzzles']),
      difficultyLevel: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}difficulty_level']),
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
  final int? puzzleId;
  final int? durationInSeconds;
  final int? lengthOfCharacters;
  final int? noOfPuzzleItems;
  final int? completedPuzzles;
  final double? difficultyLevel;
  const PuzzlesTableData(
      {this.id,
      this.createdAt,
      this.completedAt,
      this.puzzleType,
      this.puzzleId,
      this.durationInSeconds,
      this.lengthOfCharacters,
      this.noOfPuzzleItems,
      this.completedPuzzles,
      this.difficultyLevel});
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
    if (!nullToAbsent || puzzleId != null) {
      map['puzzle_id'] = Variable<int>(puzzleId);
    }
    if (!nullToAbsent || durationInSeconds != null) {
      map['duration_in_seconds'] = Variable<int>(durationInSeconds);
    }
    if (!nullToAbsent || lengthOfCharacters != null) {
      map['length_of_characters'] = Variable<int>(lengthOfCharacters);
    }
    if (!nullToAbsent || noOfPuzzleItems != null) {
      map['no_of_puzzle_items'] = Variable<int>(noOfPuzzleItems);
    }
    if (!nullToAbsent || completedPuzzles != null) {
      map['completed_puzzles'] = Variable<int>(completedPuzzles);
    }
    if (!nullToAbsent || difficultyLevel != null) {
      map['difficulty_level'] = Variable<double>(difficultyLevel);
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
      puzzleId: puzzleId == null && nullToAbsent
          ? const Value.absent()
          : Value(puzzleId),
      durationInSeconds: durationInSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationInSeconds),
      lengthOfCharacters: lengthOfCharacters == null && nullToAbsent
          ? const Value.absent()
          : Value(lengthOfCharacters),
      noOfPuzzleItems: noOfPuzzleItems == null && nullToAbsent
          ? const Value.absent()
          : Value(noOfPuzzleItems),
      completedPuzzles: completedPuzzles == null && nullToAbsent
          ? const Value.absent()
          : Value(completedPuzzles),
      difficultyLevel: difficultyLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(difficultyLevel),
    );
  }

  factory PuzzlesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuzzlesTableData(
      id: serializer.fromJson<int?>(json['id']),
      createdAt: serializer.fromJson<String?>(json['created_at']),
      completedAt: serializer.fromJson<String?>(json['completed_at']),
      puzzleType: serializer.fromJson<String?>(json['puzzle_type']),
      puzzleId: serializer.fromJson<int?>(json['puzzle_id']),
      durationInSeconds: serializer.fromJson<int?>(json['duration_in_seconds']),
      lengthOfCharacters:
          serializer.fromJson<int?>(json['length_of_characters']),
      noOfPuzzleItems: serializer.fromJson<int?>(json['no_of_puzzle_items']),
      completedPuzzles: serializer.fromJson<int?>(json['completed_puzzles']),
      difficultyLevel: serializer.fromJson<double?>(json['difficulty_level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'created_at': serializer.toJson<String?>(createdAt),
      'completed_at': serializer.toJson<String?>(completedAt),
      'puzzle_type': serializer.toJson<String?>(puzzleType),
      'puzzle_id': serializer.toJson<int?>(puzzleId),
      'duration_in_seconds': serializer.toJson<int?>(durationInSeconds),
      'length_of_characters': serializer.toJson<int?>(lengthOfCharacters),
      'no_of_puzzle_items': serializer.toJson<int?>(noOfPuzzleItems),
      'completed_puzzles': serializer.toJson<int?>(completedPuzzles),
      'difficulty_level': serializer.toJson<double?>(difficultyLevel),
    };
  }

  PuzzlesTableData copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> createdAt = const Value.absent(),
          Value<String?> completedAt = const Value.absent(),
          Value<String?> puzzleType = const Value.absent(),
          Value<int?> puzzleId = const Value.absent(),
          Value<int?> durationInSeconds = const Value.absent(),
          Value<int?> lengthOfCharacters = const Value.absent(),
          Value<int?> noOfPuzzleItems = const Value.absent(),
          Value<int?> completedPuzzles = const Value.absent(),
          Value<double?> difficultyLevel = const Value.absent()}) =>
      PuzzlesTableData(
        id: id.present ? id.value : this.id,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        puzzleType: puzzleType.present ? puzzleType.value : this.puzzleType,
        puzzleId: puzzleId.present ? puzzleId.value : this.puzzleId,
        durationInSeconds: durationInSeconds.present
            ? durationInSeconds.value
            : this.durationInSeconds,
        lengthOfCharacters: lengthOfCharacters.present
            ? lengthOfCharacters.value
            : this.lengthOfCharacters,
        noOfPuzzleItems: noOfPuzzleItems.present
            ? noOfPuzzleItems.value
            : this.noOfPuzzleItems,
        completedPuzzles: completedPuzzles.present
            ? completedPuzzles.value
            : this.completedPuzzles,
        difficultyLevel: difficultyLevel.present
            ? difficultyLevel.value
            : this.difficultyLevel,
      );
  @override
  String toString() {
    return (StringBuffer('PuzzlesTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('puzzleType: $puzzleType, ')
          ..write('puzzleId: $puzzleId, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('lengthOfCharacters: $lengthOfCharacters, ')
          ..write('noOfPuzzleItems: $noOfPuzzleItems, ')
          ..write('completedPuzzles: $completedPuzzles, ')
          ..write('difficultyLevel: $difficultyLevel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      completedAt,
      puzzleType,
      puzzleId,
      durationInSeconds,
      lengthOfCharacters,
      noOfPuzzleItems,
      completedPuzzles,
      difficultyLevel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuzzlesTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.completedAt == this.completedAt &&
          other.puzzleType == this.puzzleType &&
          other.puzzleId == this.puzzleId &&
          other.durationInSeconds == this.durationInSeconds &&
          other.lengthOfCharacters == this.lengthOfCharacters &&
          other.noOfPuzzleItems == this.noOfPuzzleItems &&
          other.completedPuzzles == this.completedPuzzles &&
          other.difficultyLevel == this.difficultyLevel);
}

class PuzzlesTableCompanion extends UpdateCompanion<PuzzlesTableData> {
  final Value<int?> id;
  final Value<String?> createdAt;
  final Value<String?> completedAt;
  final Value<String?> puzzleType;
  final Value<int?> puzzleId;
  final Value<int?> durationInSeconds;
  final Value<int?> lengthOfCharacters;
  final Value<int?> noOfPuzzleItems;
  final Value<int?> completedPuzzles;
  final Value<double?> difficultyLevel;
  const PuzzlesTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.puzzleId = const Value.absent(),
    this.durationInSeconds = const Value.absent(),
    this.lengthOfCharacters = const Value.absent(),
    this.noOfPuzzleItems = const Value.absent(),
    this.completedPuzzles = const Value.absent(),
    this.difficultyLevel = const Value.absent(),
  });
  PuzzlesTableCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.puzzleType = const Value.absent(),
    this.puzzleId = const Value.absent(),
    this.durationInSeconds = const Value.absent(),
    this.lengthOfCharacters = const Value.absent(),
    this.noOfPuzzleItems = const Value.absent(),
    this.completedPuzzles = const Value.absent(),
    this.difficultyLevel = const Value.absent(),
  });
  static Insertable<PuzzlesTableData> custom({
    Expression<int>? id,
    Expression<String>? createdAt,
    Expression<String>? completedAt,
    Expression<String>? puzzleType,
    Expression<int>? puzzleId,
    Expression<int>? durationInSeconds,
    Expression<int>? lengthOfCharacters,
    Expression<int>? noOfPuzzleItems,
    Expression<int>? completedPuzzles,
    Expression<double>? difficultyLevel,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (puzzleType != null) 'puzzle_type': puzzleType,
      if (puzzleId != null) 'puzzle_id': puzzleId,
      if (durationInSeconds != null) 'duration_in_seconds': durationInSeconds,
      if (lengthOfCharacters != null)
        'length_of_characters': lengthOfCharacters,
      if (noOfPuzzleItems != null) 'no_of_puzzle_items': noOfPuzzleItems,
      if (completedPuzzles != null) 'completed_puzzles': completedPuzzles,
      if (difficultyLevel != null) 'difficulty_level': difficultyLevel,
    });
  }

  PuzzlesTableCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? createdAt,
      Value<String?>? completedAt,
      Value<String?>? puzzleType,
      Value<int?>? puzzleId,
      Value<int?>? durationInSeconds,
      Value<int?>? lengthOfCharacters,
      Value<int?>? noOfPuzzleItems,
      Value<int?>? completedPuzzles,
      Value<double?>? difficultyLevel}) {
    return PuzzlesTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      puzzleType: puzzleType ?? this.puzzleType,
      puzzleId: puzzleId ?? this.puzzleId,
      durationInSeconds: durationInSeconds ?? this.durationInSeconds,
      lengthOfCharacters: lengthOfCharacters ?? this.lengthOfCharacters,
      noOfPuzzleItems: noOfPuzzleItems ?? this.noOfPuzzleItems,
      completedPuzzles: completedPuzzles ?? this.completedPuzzles,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
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
    if (puzzleId.present) {
      map['puzzle_id'] = Variable<int>(puzzleId.value);
    }
    if (durationInSeconds.present) {
      map['duration_in_seconds'] = Variable<int>(durationInSeconds.value);
    }
    if (lengthOfCharacters.present) {
      map['length_of_characters'] = Variable<int>(lengthOfCharacters.value);
    }
    if (noOfPuzzleItems.present) {
      map['no_of_puzzle_items'] = Variable<int>(noOfPuzzleItems.value);
    }
    if (completedPuzzles.present) {
      map['completed_puzzles'] = Variable<int>(completedPuzzles.value);
    }
    if (difficultyLevel.present) {
      map['difficulty_level'] = Variable<double>(difficultyLevel.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuzzlesTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('puzzleType: $puzzleType, ')
          ..write('puzzleId: $puzzleId, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('lengthOfCharacters: $lengthOfCharacters, ')
          ..write('noOfPuzzleItems: $noOfPuzzleItems, ')
          ..write('completedPuzzles: $completedPuzzles, ')
          ..write('difficultyLevel: $difficultyLevel')
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
