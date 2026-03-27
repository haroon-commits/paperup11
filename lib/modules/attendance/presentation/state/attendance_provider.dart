import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/modules/attendance/data/models/attendance_model.dart';
import 'package:paperup1/modules/attendance/data/repositories/mock_attendance_repository.dart';

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) => MockAttendanceRepository());

class AttendanceNotifier extends AsyncNotifier<List<AttendanceModel>> {
  @override
  FutureOr<List<AttendanceModel>> build() {
    return [];
  }

  Future<void> fetchLogs(int userId, DateTime month) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(attendanceRepositoryProvider);
      return await repository.getAttendanceLogs(userId, month);
    });
  }

  Future<void> mark(int studentId, DateTime date, String status) async {
    final repository = ref.read(attendanceRepositoryProvider);
    await repository.markAttendance(studentId, date, status);
    // Refresh for the current month
    fetchLogs(studentId, date);
  }
}

final attendanceProvider = AsyncNotifierProvider<AttendanceNotifier, List<AttendanceModel>>(() {
  return AttendanceNotifier();
});
