import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@freezed
abstract class ExamResult with _$ExamResult {
  const factory ExamResult({
    required String examination,
    required int totalMarks,
    required int obtainedMarks,
    required double percentage,
    required String grade,
    required String status, // "Pass" | "Fail"
  }) = _ExamResult;

  factory ExamResult.fromJson(Map<String, dynamic> json) =>
      _$ExamResultFromJson(json);
}
