// ignore_for_file: comment_references

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
part 'puzzles.g.dart';

/// {@template puzzle}
/// A single puzzle
///
/// contains an [id], [createdAt],[completedAt] in addition to a [puzzleType]
///
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
/// [PuzzlesModel]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class PuzzlesModel extends Equatable {
  /// {@macro puzzle}
  const PuzzlesModel({
    required this.id,
    this.createdAt,
    this.completedAt,
    this.puzzleType,
  }) : assert(
          id == null,
          'id cannot be null',
        );

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

  /// An identifier for what type of puzzle e.g (XOXO,LTRS,SHAPES)
  @JsonKey(name: 'puzzle_type')
  final String? puzzleType;

  @override
  List<dynamic> get props => [
        id,
        completedAt,
        createdAt,
        puzzleType,
      ];

  /// Deserializes the given [JsonMap] into a [PuzzlesModel].
  static PuzzlesModel fromJson(Map<String, dynamic> json) {
    return _$PuzzlesModelFromJson(json);
  }

  /// Converts this [PuzzlesModel] into a [JsonMap].
  Map<String, dynamic> toJson() => _$PuzzlesModelToJson(this);

  /// Returns a copy of this `todo` with the given values updated.
  ///
  /// {@macro puzzle}
  PuzzlesModel copyWith({
    int? id,
    String? createdAt,
    String? completedAt,
    String? puzzleType,
  }) {
    return PuzzlesModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      puzzleType: puzzleType ?? this.puzzleType,
    );
  }
}
