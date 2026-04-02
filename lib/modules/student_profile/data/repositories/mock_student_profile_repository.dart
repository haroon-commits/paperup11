import 'package:paperup1/modules/student_profile/data/models/student_info_model.dart';
import 'package:paperup1/modules/student_profile/data/models/attendance_model.dart';
import 'package:paperup1/modules/student_profile/data/models/fine_model.dart';
import 'package:paperup1/modules/student_profile/data/models/fees_model.dart';
import 'package:paperup1/modules/student_profile/data/models/result_model.dart';
import 'package:paperup1/modules/student_profile/data/repositories/student_profile_repository.dart';

class MockStudentProfileRepository implements StudentProfileRepository {
  @override
  Future<StudentInfo> getStudentInfo(int studentId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const StudentInfo(
      id: 0,
      fullName: 'Ali Hassan',
      email: 'alihassan@example.com',
      phone: '0512345671',
      dateOfBirth: '2026-02-22',
      status: 'Active',
      rollNumber: 'N/A',
      classId: 'N/A',
      sectionId: 'N/A',
      admissionDate: '—',
      parentId: 3,
      bloodGroup: 'N/A',
      classSection: 'Class - Section',
      avatarUrl: 'https://ui-avatars.com/api/?name=Ali+Hassan&background=007AFF&color=fff',
    );
  }

  @override
  Future<AttendanceSummary> getAttendance(int studentId, int month, int year) async {
    await Future.delayed(const Duration(milliseconds: 600));
    
    // Generating dummy days for the month
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final List<AttendanceDay> days = [];
    
    for (int i = 1; i <= daysInMonth; i++) {
        final date = DateTime(year, month, i);
        // Weekend check (Fri/Sat or Sun depending on region, using Sat/Sun)
        if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday) {
            continue; 
        }
        
        String status = 'present';
        if (i % 7 == 0) status = 'absent';
        else if (i % 11 == 0) status = 'leave';
        else if (i % 15 == 0) status = 'late';
        
        days.add(AttendanceDay(date: date, status: status));
    }

    return AttendanceSummary(
      workingDays: 27,
      present: 15,
      absent: 8,
      leave: 2,
      late: 2,
      days: days,
    );
  }

  @override
  Future<List<StudentFine>> getFines(int studentId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return [
      const StudentFine(fineType: 'Late Coming', amount: 100, date: '2024-03-01', status: 'Paid'),
      const StudentFine(fineType: 'Uniform Violation', amount: 200, date: '2024-02-15', status: 'Pending'),
      const StudentFine(fineType: 'Discipline Issue', amount: 500, date: '2024-01-10', status: 'Paid'),
      const StudentFine(fineType: 'Library Late Return', amount: 50, date: '2023-12-20', status: 'Paid'),
    ];
  }

  @override
  Future<List<FeeRecord>> getFees(int studentId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const FeeRecord(month: 'March 2024', amount: 5000, date: '2024-03-05', receiptNumber: 'REC-001', status: 'Paid', feeType: 'Monthly Fee'),
      const FeeRecord(month: 'February 2024', amount: 5000, date: '2024-02-04', receiptNumber: 'REC-002', status: 'Paid'),
      const FeeRecord(month: 'January 2024', amount: 5000, date: '2024-01-08', receiptNumber: 'REC-003', status: 'Paid'),
    ];
  }

  @override
  Future<List<ExamResult>> getResults(int studentId) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return [
      const ExamResult(examination: 'Final Term 2023', totalMarks: 1100, obtainedMarks: 950, percentage: 86, grade: 'A+', status: 'Pass'),
      const ExamResult(examination: 'Mid Term 2023', totalMarks: 500, obtainedMarks: 420, percentage: 84, grade: 'A', status: 'Pass'),
      const ExamResult(examination: 'First Monthly Test', totalMarks: 100, obtainedMarks: 85, percentage: 85, grade: 'A', status: 'Pass'),
    ];
  }
}
