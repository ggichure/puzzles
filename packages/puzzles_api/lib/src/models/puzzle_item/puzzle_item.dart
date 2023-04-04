// ignore_for_file: comment_references

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'puzzle_item.g.dart';

/// {@template puzzle_item}
/// A single puzzle_item
///
/// contains an [id],[createdAt],[completedAt],[puzzleId] ,[isCorrect],[choices]
/// [puzzleType]
///
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
/// [PuzzlesItemModel]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class PuzzlesItemModel extends Equatable {
  /// {@macro puzzle}
  const PuzzlesItemModel({
    required this.id,
    required this.puzzleId,
    this.createdAt,
    this.completedAt,
    this.puzzleType,
    this.isCorrect,
    this.choices,
  });

  /// A list of the provided choices
  ///
  ///
  final List<String>? choices;

  /// The time the puzzle was ended
  ///
  /// If empty DateTime.now() is used
  @JsonKey(name: 'completed_at')
  final String? completedAt;

  /// The time the puzzle was created
  ///
  /// If empty DateTime.now() is used
  @JsonKey(name: 'created_at')
  final String? createdAt;

  /// A unique identifier of the puzzle
  ///
  /// cannot be empty
  final int? id;

  /// Whether item was correct
  ///
  /// defualts to false
  @JsonKey(name: 'is_correct')
  final bool? isCorrect;

  /// A unique identifier of the parent puzzle
  ///
  /// cannot be empty
  @JsonKey(name: 'puzzle_id')
  final int? puzzleId;

  /// An identifier for what type of puzzle e.g (XOXO,LTRS,SHAPES)
  @JsonKey(name: 'puzzle_type')
  final String? puzzleType;

  @override
  List<dynamic> get props => [
        isCorrect,
        id,
        completedAt,
        createdAt,
        puzzleType,
        puzzleId,
        choices,
      ];

  /// Deserializes the given [JsonMap] into a [PuzzlesItemModel].
  static PuzzlesItemModel fromJson(Map<String, dynamic> json) {
    return _$PuzzlesItemModelFromJson(json);
  }

  /// Converts this [PuzzlesItemModel] into a [JsonMap].
  Map<String, dynamic> toJson() => _$PuzzlesItemModelToJson(this);

  /// Returns a copy of this `todo` with the given values updated.
  ///
  /// {@macro puzzle}
  PuzzlesItemModel copyWith({
    int? id,
    String? createdAt,
    String? completedAt,
    String? puzzleType,
    bool? isCorrect,
    List<String>? choices,
    int? puzzleId,
  }) {
    return PuzzlesItemModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      puzzleType: puzzleType ?? this.puzzleType,
      isCorrect: isCorrect ?? this.isCorrect,
      choices: choices ?? this.choices,
      puzzleId: puzzleId ?? this.puzzleId,
    );
  }
}
