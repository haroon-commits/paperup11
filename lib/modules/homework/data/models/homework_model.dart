import 'package:freezed_annotation/freezed_annotation.dart';

part 'homework_model.freezed.dart';
part 'homework_model.g.dart';

@freezed
abstract class HomeworkModel with _$HomeworkModel {
  const factory HomeworkModel({
    required int id,
    required String title,
    required String subject,
    required String description,
    required DateTime dueDate,
    required String status, // Pending, Submitted, Evaluated
    String? teacherFeedback,
  }) = _HomeworkModel;

  factory HomeworkModel.fromJson(Map<String, dynamic> json) =>
      _$HomeworkModelFromJson(json);
}
