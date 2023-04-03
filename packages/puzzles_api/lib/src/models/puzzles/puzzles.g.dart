// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PuzzlesModel _$PuzzlesModelFromJson(Map<String, dynamic> json) => PuzzlesModel(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      completedAt: json['completed_at'] as String?,
      puzzleType: json['puzzle_type'] as String?,
    );

Map<String, dynamic> _$PuzzlesModelToJson(PuzzlesModel instance) =>
    <String, dynamic>{
      'completed_at': instance.completedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'puzzle_type': instance.puzzleType,
    };
