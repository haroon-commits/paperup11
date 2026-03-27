import 'package:paperup1/modules/homework/data/models/homework_model.dart';

abstract class HomeworkRepository {
  Future<List<HomeworkModel>> getHomework(int userId);
  Future<void> submitHomework(int homeworkId, String filePath);
  Future<void> uploadHomework(String title, String subject, String description, DateTime dueDate);
}

class MockHomeworkRepository implements HomeworkRepository {
  @override
  Future<List<HomeworkModel>> getHomework(int userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      HomeworkModel(
        id: 1,
        title: 'Quadratic Equations Practice',
        subject: 'Mathematics',
        description: 'Complete exercises 4.1 to 4.3 from the textbook.',
        dueDate: DateTime.now().add(const Duration(days: 2)),
        status: 'Pending',
      ),
      HomeworkModel(
        id: 2,
        title: 'Chemical Bonding Essay',
        subject: 'Chemistry',
        description: 'Write a 500-word essay on different types of chemical bonds.',
        dueDate: DateTime.now().subtract(const Duration(days: 1)),
        status: 'Submitted',
      ),
      HomeworkModel(
        id: 3,
        title: 'English Vocabulary Quiz',
        subject: 'English',
        description: 'Prepare for the vocabulary quiz covering Unit 5.',
        dueDate: DateTime.now().add(const Duration(days: 5)),
        status: 'Evaluated',
        teacherFeedback: 'Excellent work! Keep it up.',
      ),
    ];
  }

  @override
  Future<void> submitHomework(int homeworkId, String filePath) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> uploadHomework(String title, String subject, String description, DateTime dueDate) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
