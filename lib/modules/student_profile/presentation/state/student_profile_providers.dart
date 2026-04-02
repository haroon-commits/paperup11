import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/modules/student_profile/data/models/student_info_model.dart';
import 'package:paperup1/modules/student_profile/data/models/attendance_model.dart';
import 'package:paperup1/modules/student_profile/data/models/fine_model.dart';
import 'package:paperup1/modules/student_profile/data/models/fees_model.dart';
import 'package:paperup1/modules/student_profile/data/models/result_model.dart';
import 'package:paperup1/modules/student_profile/data/repositories/student_profile_repository.dart';
import 'package:paperup1/modules/student_profile/data/repositories/mock_student_profile_repository.dart';

final studentProfileRepositoryProvider = Provider<StudentProfileRepository>((ref) {
  return MockStudentProfileRepository();
});

final studentInfoProvider = FutureProvider<StudentInfo>((ref) async {
  final repository = ref.watch(studentProfileRepositoryProvider);
  final user = ref.watch(authProvider).user;
  // Fallback if user is null for demo purposes
  final userId = user?.id ?? 0; 
  return repository.getStudentInfo(userId);
});

final attendanceProvider = FutureProvider.family<AttendanceSummary, ({int month, int year})>((ref, arg) async {
  final repository = ref.watch(studentProfileRepositoryProvider);
  final user = ref.watch(authProvider).user;
  final userId = user?.id ?? 0;
  return repository.getAttendance(userId, arg.month, arg.year);
});

class CurrentAttendanceMonthYear extends Notifier<({int month, int year})> {
  @override
  ({int month, int year}) build() => (month: 4, year: 2026);
  
  void update(({int month, int year}) val) => state = val;
}

final currentAttendanceMonthYearProvider = NotifierProvider<CurrentAttendanceMonthYear, ({int month, int year})>(CurrentAttendanceMonthYear.new);

final finesProvider = FutureProvider<List<StudentFine>>((ref) async {
  final repository = ref.watch(studentProfileRepositoryProvider);
  final user = ref.watch(authProvider).user;
  final userId = user?.id ?? 0;
  return repository.getFines(userId);
});

final feesProvider = FutureProvider<List<FeeRecord>>((ref) async {
  final repository = ref.watch(studentProfileRepositoryProvider);
  final user = ref.watch(authProvider).user;
  final userId = user?.id ?? 0;
  return repository.getFees(userId);
});

final resultsProvider = FutureProvider<List<ExamResult>>((ref) async {
  final repository = ref.watch(studentProfileRepositoryProvider);
  final user = ref.watch(authProvider).user;
  final userId = user?.id ?? 0;
  return repository.getResults(userId);
});
