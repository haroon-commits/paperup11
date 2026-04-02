import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_info_model.freezed.dart';
part 'student_info_model.g.dart';

@freezed
abstract class StudentInfo with _$StudentInfo {
  const factory StudentInfo({
    required int id,
    required String fullName,
    required String email,
    required String phone,
    required String dateOfBirth,
    required String status, // "Active" / "Inactive"
    String? rollNumber,
    String? classId,
    String? sectionId,
    String? admissionDate,
    int? parentId,
    String? bloodGroup,
    String? avatarUrl,
    String? classSection, // display label "Class - Section"
  }) = _StudentInfo;

  factory StudentInfo.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoFromJson(json);
}
