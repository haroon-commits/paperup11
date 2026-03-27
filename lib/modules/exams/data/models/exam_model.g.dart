// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExamModel _$ExamModelFromJson(Map<String, dynamic> json) => _ExamModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  date: DateTime.parse(json['date'] as String),
  subject: json['subject'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$ExamModelToJson(_ExamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'subject': instance.subject,
      'type': instance.type,
    };

_ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => _ResultModel(
  id: (json['id'] as num).toInt(),
  exam: ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
  marksObtained: (json['marksObtained'] as num).toDouble(),
  maxMarks: (json['maxMarks'] as num).toDouble(),
  grade: json['grade'] as String,
  remarks: json['remarks'] as String?,
);

Map<String, dynamic> _$ResultModelToJson(_ResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam': instance.exam,
      'marksObtained': instance.marksObtained,
      'maxMarks': instance.maxMarks,
      'grade': instance.grade,
      'remarks': instance.remarks,
    };
