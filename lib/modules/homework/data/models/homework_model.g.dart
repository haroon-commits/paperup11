// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homework_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeworkModel _$HomeworkModelFromJson(Map<String, dynamic> json) =>
    _HomeworkModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      subject: json['subject'] as String,
      description: json['description'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: json['status'] as String,
      teacherFeedback: json['teacherFeedback'] as String?,
    );

Map<String, dynamic> _$HomeworkModelToJson(_HomeworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subject': instance.subject,
      'description': instance.description,
      'dueDate': instance.dueDate.toIso8601String(),
      'status': instance.status,
      'teacherFeedback': instance.teacherFeedback,
    };
