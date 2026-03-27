import 'package:paperup1/modules/attendance/data/models/attendance_model.dart';

abstract class AttendanceRepository {
  Future<List<AttendanceModel>> getAttendanceLogs(int userId, DateTime month);
  Future<void> markAttendance(int studentId, DateTime date, String status);
}

class MockAttendanceRepository implements AttendanceRepository {
  @override
  Future<List<AttendanceModel>> getAttendanceLogs(int userId, DateTime month) async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(20, (index) {
      final date = DateTime(month.year, month.month, index + 1);
      final status = index % 7 == 0 ? 'Absent' : (index % 10 == 0 ? 'Late' : 'Present');
      return AttendanceModel(date: date, status: status);
    });
  }

  @override
  Future<void> markAttendance(int studentId, DateTime date, String status) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
