import 'package:paperup1/modules/exams/data/models/exam_model.dart';

abstract class ExamsRepository {
  Future<List<ResultModel>> getResults(int userId);
  Future<List<ExamModel>> getUpcomingExams();
}

class MockExamsRepository implements ExamsRepository {
  @override
  Future<List<ResultModel>> getResults(int userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      ResultModel(
        id: 1,
        exam: ExamModel(
          id: 101,
          title: 'Mid-term Exams 2026',
          date: DateTime(2026, 2, 15),
          subject: 'Mathematics',
          type: 'Mid-term',
        ),
        marksObtained: 88,
        maxMarks: 100,
        grade: 'A',
      ),
      ResultModel(
        id: 2,
        exam: ExamModel(
          id: 102,
          title: 'Mid-term Exams 2026',
          date: DateTime(2026, 2, 16),
          subject: 'Physics',
          type: 'Mid-term',
        ),
        marksObtained: 75,
        maxMarks: 100,
        grade: 'B+',
      ),
    ];
  }

  @override
  Future<List<ExamModel>> getUpcomingExams() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      ExamModel(
        id: 201,
        title: 'Final Term Exams',
        date: DateTime(2026, 5, 10),
        subject: 'All Subjects',
        type: 'Final',
      ),
    ];
  }
}
