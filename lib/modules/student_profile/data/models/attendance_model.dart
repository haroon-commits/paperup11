import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
abstract class AttendanceDay with _$AttendanceDay {
  const factory AttendanceDay({
    required DateTime date,
    required String status, // "present" | "absent" | "leave" | "late"
  }) = _AttendanceDay;

  factory AttendanceDay.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDayFromJson(json);
}

@freezed
abstract class AttendanceSummary with _$AttendanceSummary {
  const factory AttendanceSummary({
    required int workingDays,
    required int present,
    required int absent,
    required int leave,
    required int late,
    required List<AttendanceDay> days,
  }) = _AttendanceSummary;

  factory AttendanceSummary.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSummaryFromJson(json);
}
