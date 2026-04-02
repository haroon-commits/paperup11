// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExamResult _$ExamResultFromJson(Map<String, dynamic> json) => _ExamResult(
  examination: json['examination'] as String,
  totalMarks: (json['totalMarks'] as num).toInt(),
  obtainedMarks: (json['obtainedMarks'] as num).toInt(),
  percentage: (json['percentage'] as num).toDouble(),
  grade: json['grade'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$ExamResultToJson(_ExamResult instance) =>
    <String, dynamic>{
      'examination': instance.examination,
      'totalMarks': instance.totalMarks,
      'obtainedMarks': instance.obtainedMarks,
      'percentage': instance.percentage,
      'grade': instance.grade,
      'status': instance.status,
    };
