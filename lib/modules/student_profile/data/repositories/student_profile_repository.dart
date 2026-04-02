import 'package:paperup1/modules/student_profile/data/models/student_info_model.dart';
import 'package:paperup1/modules/student_profile/data/models/attendance_model.dart';
import 'package:paperup1/modules/student_profile/data/models/fine_model.dart';
import 'package:paperup1/modules/student_profile/data/models/fees_model.dart';
import 'package:paperup1/modules/student_profile/data/models/result_model.dart';

abstract class StudentProfileRepository {
  Future<StudentInfo> getStudentInfo(int studentId);
  Future<AttendanceSummary> getAttendance(int studentId, int month, int year);
  Future<List<StudentFine>> getFines(int studentId);
  Future<List<FeeRecord>> getFees(int studentId);
  Future<List<ExamResult>> getResults(int studentId);
}
