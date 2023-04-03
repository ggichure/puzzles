// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PuzzlesItemModel _$PuzzlesItemModelFromJson(Map<String, dynamic> json) =>
    PuzzlesItemModel(
      id: json['id'] as int?,
      puzzleId: json['puzzle_id'] as int?,
      createdAt: json['created_at'] as String?,
      completedAt: json['completed_at'] as String?,
      puzzleType: json['puzzle_type'] as String?,
      isCorrect: json['is_correct'] as bool?,
      choices:
          (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PuzzlesItemModelToJson(PuzzlesItemModel instance) =>
    <String, dynamic>{
      'choices': instance.choices,
      'completed_at': instance.completedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'is_correct': instance.isCorrect,
      'puzzle_id': instance.puzzleId,
      'puzzle_type': instance.puzzleType,
    };
