import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_model.freezed.dart';
part 'exam_model.g.dart';

@freezed
abstract class ExamModel with _$ExamModel {
  const factory ExamModel({
    required int id,
    required String title,
    required DateTime date,
    required String subject,
    required String type, // Mid-term, Final, Unit Test
  }) = _ExamModel;

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);
}

@freezed
abstract class ResultModel with _$ResultModel {
  const factory ResultModel({
    required int id,
    required ExamModel exam,
    required double marksObtained,
    required double maxMarks,
    required String grade,
    String? remarks,
  }) = _ResultModel;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}
