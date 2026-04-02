// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceDay _$AttendanceDayFromJson(Map<String, dynamic> json) =>
    _AttendanceDay(
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$AttendanceDayToJson(_AttendanceDay instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'status': instance.status,
    };

_AttendanceSummary _$AttendanceSummaryFromJson(Map<String, dynamic> json) =>
    _AttendanceSummary(
      workingDays: (json['workingDays'] as num).toInt(),
      present: (json['present'] as num).toInt(),
      absent: (json['absent'] as num).toInt(),
      leave: (json['leave'] as num).toInt(),
      late: (json['late'] as num).toInt(),
      days: (json['days'] as List<dynamic>)
          .map((e) => AttendanceDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceSummaryToJson(_AttendanceSummary instance) =>
    <String, dynamic>{
      'workingDays': instance.workingDays,
      'present': instance.present,
      'absent': instance.absent,
      'leave': instance.leave,
      'late': instance.late,
      'days': instance.days,
    };
