// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudentInfo _$StudentInfoFromJson(Map<String, dynamic> json) => _StudentInfo(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  dateOfBirth: json['dateOfBirth'] as String,
  status: json['status'] as String,
  rollNumber: json['rollNumber'] as String?,
  classId: json['classId'] as String?,
  sectionId: json['sectionId'] as String?,
  admissionDate: json['admissionDate'] as String?,
  parentId: (json['parentId'] as num?)?.toInt(),
  bloodGroup: json['bloodGroup'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  classSection: json['classSection'] as String?,
);

Map<String, dynamic> _$StudentInfoToJson(_StudentInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'dateOfBirth': instance.dateOfBirth,
      'status': instance.status,
      'rollNumber': instance.rollNumber,
      'classId': instance.classId,
      'sectionId': instance.sectionId,
      'admissionDate': instance.admissionDate,
      'parentId': instance.parentId,
      'bloodGroup': instance.bloodGroup,
      'avatarUrl': instance.avatarUrl,
      'classSection': instance.classSection,
    };
