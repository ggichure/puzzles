// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PuzzleItem _$PuzzleItemFromJson(Map<String, dynamic> json) => PuzzleItem(
      id: json['id'] as int?,
      puzzleId: json['puzzle_id'] as String?,
      choices: json['choices'] as String?,
      puzzleType: json['puzzle_type'] as String?,
      createdAt: json['created_at'] as String?,
      completedAt: json['completed_at'] as String?,
    );

Map<String, dynamic> _$PuzzleItemToJson(PuzzleItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'puzzle_id': instance.puzzleId,
      'choices': instance.choices,
      'puzzle_type': instance.puzzleType,
      'created_at': instance.createdAt,
      'completed_at': instance.completedAt,
    };
