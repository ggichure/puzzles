import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:puzzles_api/src/models/json_map.dart';

part 'puzzle.g.dart';

/// {@template puzzle}
/// A single `puzzle` .
///
/// Contains a [puzzleType], [createdAt],[lengthOfCharacters],
/// [durationInSeconds], [durationInSeconds]  and [completedAt]
///
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
///
/// [Puzzle]s are immutable and can be copied using [copyWith], in addition to
/// being serialized and deserialized using [toJson] and [fromJson]
/// respectively.
/// {@endtemplate}
///
@JsonSerializable()
class Puzzle extends Equatable {
  /// {@macro puzzle}
  const Puzzle({
    this.id,
    this.puzzleType,
    this.createdAt,
    this.lengthOfCharacters,
    this.durationInSeconds,
    this.noOfPuzzleItems,
    this.completedAt,
  });

  /// puzzle primary key
  final int? id;

  /// Puzzle type can be xoxoxo,lts,etc
  @JsonKey(name: 'puzzle_type')
  final String? puzzleType;

  /// When the puzzle was created
  @JsonKey(name: 'created_at')
  final String? createdAt;

  /// when the puzzle was completed
  @JsonKey(name: 'completed_at')
  final String? completedAt;

  /// Holds the length of puzzle characters eg 5,6,7
//
  @JsonKey(name: 'length_of_characters')
  final int? lengthOfCharacters;

  /// Holds user selected duration
  @JsonKey(name: 'duration_in_seconds')
  final int? durationInSeconds;

  /// Holds user defined no_of_puzzle_items
  @JsonKey(name: 'no_of_puzzle_items')
  final int? noOfPuzzleItems;

  /// Deserializes the given [JsonMap] into a [Puzzle].
  static Puzzle fromJson(JsonMap json) => _$PuzzleFromJson(json);

  /// Converts this [Puzzle] into a [JsonMap].
  Map<String, dynamic> toJson() => _$PuzzleToJson(this);

  /// {@macro puzzle}
  Puzzle copyWith({
    int? id,
    String? puzzleType,
    String? createdAt,
    String? completedAt,
    int? lengthOfCharacters,
    int? durationInSeconds,
    int? noOfPuzzleItems,
  }) {
    return Puzzle(
      id: id ?? this.id,
      puzzleType: puzzleType ?? this.puzzleType,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      lengthOfCharacters: lengthOfCharacters ?? this.lengthOfCharacters,
      durationInSeconds: durationInSeconds ?? this.durationInSeconds,
      noOfPuzzleItems: noOfPuzzleItems ?? this.noOfPuzzleItems,
    );
  }

  // ignore: override_on_non_overriding_member,

  // ignore: public_member_api_docs
  @override
  List<Object?> get props => [id, puzzleType, createdAt, completedAt];
}
