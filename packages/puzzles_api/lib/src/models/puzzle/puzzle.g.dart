// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Puzzle _$PuzzleFromJson(Map<String, dynamic> json) => Puzzle(
      id: json['id'] as int?,
      puzzleType: json['puzzle_type'] as String?,
      createdAt: json['created_at'] as String?,
      lengthOfCharacters: json['length_of_characters'] as int?,
      durationInSeconds: json['duration_in_seconds'] as int?,
      noOfPuzzleItems: json['no_of_puzzle_items'] as int?,
      completedAt: json['completed_at'] as String?,
    );

Map<String, dynamic> _$PuzzleToJson(Puzzle instance) => <String, dynamic>{
      'id': instance.id,
      'puzzle_type': instance.puzzleType,
      'created_at': instance.createdAt,
      'completed_at': instance.completedAt,
      'length_of_characters': instance.lengthOfCharacters,
      'duration_in_seconds': instance.durationInSeconds,
      'no_of_puzzle_items': instance.noOfPuzzleItems,
    };
