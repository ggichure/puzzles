import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:puzzles_api/src/models/json_map.dart';

part 'puzzle_item.g.dart';

/// {@template puzzle_item}
/// A single `puzzle_item` .
///
/// Contains a [puzzleType], [createdAt],[puzzleId] ,[choices ]and [completedAt]
///
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
///
/// [PuzzleItem]s are immutable and can be copied using [copyWith], in addition
///  to
/// being serialized and deserialized using [toJson] and [fromJson]
/// respectively.
/// {@endtemplate}
///
@JsonSerializable()
class PuzzleItem extends Equatable {
  /// {@macro puzzle_item}
  const PuzzleItem({
    this.id,
    this.puzzleId,
    this.choices,
    this.puzzleType,
    this.createdAt,
    this.completedAt,
  });

  /// puzzle_item primary key
  final int? id;

  /// related puzzle primary key
  @JsonKey(name: 'puzzle_id')
  final String? puzzleId;

  /// choices generated
  final String? choices;

  /// Puzzle type can be xoxoxo,lts,etc
  @JsonKey(name: 'puzzle_type')
  final String? puzzleType;

  /// When the puzzle was created
  @JsonKey(name: 'created_at')
  final String? createdAt;

  /// when the puzzle was completed
  @JsonKey(name: 'completed_at')
  final String? completedAt;

  /// Deserializes the given [JsonMap] into a [PuzzleItem].
  static PuzzleItem fromJson(JsonMap json) => _$PuzzleItemFromJson(json);

  /// Converts this [PuzzleItem] into a [JsonMap].
  Map<String, dynamic> toJson() => _$PuzzleItemToJson(this);

  /// {@macro puzzle_item}
  PuzzleItem copyWith({
    int? id,
    String? puzzleId,
    String? choices,
    String? puzzleType,
    String? createdAt,
    String? completedAt,
  }) {
    return PuzzleItem(
      id: id ?? this.id,
      puzzleId: puzzleId ?? this.puzzleId,
      choices: choices ?? this.choices,
      puzzleType: puzzleType ?? this.puzzleType,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      puzzleId,
      choices,
      puzzleType,
      createdAt,
      completedAt,
    ];
  }
}
