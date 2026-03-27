// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    _AttendanceModel(
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$AttendanceModelToJson(_AttendanceModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'remarks': instance.remarks,
    };
