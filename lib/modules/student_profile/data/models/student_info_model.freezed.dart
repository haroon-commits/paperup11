// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentInfo {

 int get id; String get fullName; String get email; String get phone; String get dateOfBirth; String get status;// "Active" / "Inactive"
 String? get rollNumber; String? get classId; String? get sectionId; String? get admissionDate; int? get parentId; String? get bloodGroup; String? get avatarUrl; String? get classSection;
/// Create a copy of StudentInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentInfoCopyWith<StudentInfo> get copyWith => _$StudentInfoCopyWithImpl<StudentInfo>(this as StudentInfo, _$identity);

  /// Serializes this StudentInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.status, status) || other.status == status)&&(identical(other.rollNumber, rollNumber) || other.rollNumber == rollNumber)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.admissionDate, admissionDate) || other.admissionDate == admissionDate)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.classSection, classSection) || other.classSection == classSection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phone,dateOfBirth,status,rollNumber,classId,sectionId,admissionDate,parentId,bloodGroup,avatarUrl,classSection);

@override
String toString() {
  return 'StudentInfo(id: $id, fullName: $fullName, email: $email, phone: $phone, dateOfBirth: $dateOfBirth, status: $status, rollNumber: $rollNumber, classId: $classId, sectionId: $sectionId, admissionDate: $admissionDate, parentId: $parentId, bloodGroup: $bloodGroup, avatarUrl: $avatarUrl, classSection: $classSection)';
}


}

/// @nodoc
abstract mixin class $StudentInfoCopyWith<$Res>  {
  factory $StudentInfoCopyWith(StudentInfo value, $Res Function(StudentInfo) _then) = _$StudentInfoCopyWithImpl;
@useResult
$Res call({
 int id, String fullName, String email, String phone, String dateOfBirth, String status, String? rollNumber, String? classId, String? sectionId, String? admissionDate, int? parentId, String? bloodGroup, String? avatarUrl, String? classSection
});




}
/// @nodoc
class _$StudentInfoCopyWithImpl<$Res>
    implements $StudentInfoCopyWith<$Res> {
  _$StudentInfoCopyWithImpl(this._self, this._then);

  final StudentInfo _self;
  final $Res Function(StudentInfo) _then;

/// Create a copy of StudentInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? phone = null,Object? dateOfBirth = null,Object? status = null,Object? rollNumber = freezed,Object? classId = freezed,Object? sectionId = freezed,Object? admissionDate = freezed,Object? parentId = freezed,Object? bloodGroup = freezed,Object? avatarUrl = freezed,Object? classSection = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rollNumber: freezed == rollNumber ? _self.rollNumber : rollNumber // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,sectionId: freezed == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String?,admissionDate: freezed == admissionDate ? _self.admissionDate : admissionDate // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,classSection: freezed == classSection ? _self.classSection : classSection // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentInfo].
extension StudentInfoPatterns on StudentInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentInfo value)  $default,){
final _that = this;
switch (_that) {
case _StudentInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentInfo value)?  $default,){
final _that = this;
switch (_that) {
case _StudentInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String fullName,  String email,  String phone,  String dateOfBirth,  String status,  String? rollNumber,  String? classId,  String? sectionId,  String? admissionDate,  int? parentId,  String? bloodGroup,  String? avatarUrl,  String? classSection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentInfo() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.dateOfBirth,_that.status,_that.rollNumber,_that.classId,_that.sectionId,_that.admissionDate,_that.parentId,_that.bloodGroup,_that.avatarUrl,_that.classSection);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String fullName,  String email,  String phone,  String dateOfBirth,  String status,  String? rollNumber,  String? classId,  String? sectionId,  String? admissionDate,  int? parentId,  String? bloodGroup,  String? avatarUrl,  String? classSection)  $default,) {final _that = this;
switch (_that) {
case _StudentInfo():
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.dateOfBirth,_that.status,_that.rollNumber,_that.classId,_that.sectionId,_that.admissionDate,_that.parentId,_that.bloodGroup,_that.avatarUrl,_that.classSection);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String fullName,  String email,  String phone,  String dateOfBirth,  String status,  String? rollNumber,  String? classId,  String? sectionId,  String? admissionDate,  int? parentId,  String? bloodGroup,  String? avatarUrl,  String? classSection)?  $default,) {final _that = this;
switch (_that) {
case _StudentInfo() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.dateOfBirth,_that.status,_that.rollNumber,_that.classId,_that.sectionId,_that.admissionDate,_that.parentId,_that.bloodGroup,_that.avatarUrl,_that.classSection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentInfo implements StudentInfo {
  const _StudentInfo({required this.id, required this.fullName, required this.email, required this.phone, required this.dateOfBirth, required this.status, this.rollNumber, this.classId, this.sectionId, this.admissionDate, this.parentId, this.bloodGroup, this.avatarUrl, this.classSection});
  factory _StudentInfo.fromJson(Map<String, dynamic> json) => _$StudentInfoFromJson(json);

@override final  int id;
@override final  String fullName;
@override final  String email;
@override final  String phone;
@override final  String dateOfBirth;
@override final  String status;
// "Active" / "Inactive"
@override final  String? rollNumber;
@override final  String? classId;
@override final  String? sectionId;
@override final  String? admissionDate;
@override final  int? parentId;
@override final  String? bloodGroup;
@override final  String? avatarUrl;
@override final  String? classSection;

/// Create a copy of StudentInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentInfoCopyWith<_StudentInfo> get copyWith => __$StudentInfoCopyWithImpl<_StudentInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.status, status) || other.status == status)&&(identical(other.rollNumber, rollNumber) || other.rollNumber == rollNumber)&&(identical(other.classId, classId) || other.classId == classId)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.admissionDate, admissionDate) || other.admissionDate == admissionDate)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.classSection, classSection) || other.classSection == classSection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phone,dateOfBirth,status,rollNumber,classId,sectionId,admissionDate,parentId,bloodGroup,avatarUrl,classSection);

@override
String toString() {
  return 'StudentInfo(id: $id, fullName: $fullName, email: $email, phone: $phone, dateOfBirth: $dateOfBirth, status: $status, rollNumber: $rollNumber, classId: $classId, sectionId: $sectionId, admissionDate: $admissionDate, parentId: $parentId, bloodGroup: $bloodGroup, avatarUrl: $avatarUrl, classSection: $classSection)';
}


}

/// @nodoc
abstract mixin class _$StudentInfoCopyWith<$Res> implements $StudentInfoCopyWith<$Res> {
  factory _$StudentInfoCopyWith(_StudentInfo value, $Res Function(_StudentInfo) _then) = __$StudentInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String fullName, String email, String phone, String dateOfBirth, String status, String? rollNumber, String? classId, String? sectionId, String? admissionDate, int? parentId, String? bloodGroup, String? avatarUrl, String? classSection
});




}
/// @nodoc
class __$StudentInfoCopyWithImpl<$Res>
    implements _$StudentInfoCopyWith<$Res> {
  __$StudentInfoCopyWithImpl(this._self, this._then);

  final _StudentInfo _self;
  final $Res Function(_StudentInfo) _then;

/// Create a copy of StudentInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? phone = null,Object? dateOfBirth = null,Object? status = null,Object? rollNumber = freezed,Object? classId = freezed,Object? sectionId = freezed,Object? admissionDate = freezed,Object? parentId = freezed,Object? bloodGroup = freezed,Object? avatarUrl = freezed,Object? classSection = freezed,}) {
  return _then(_StudentInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rollNumber: freezed == rollNumber ? _self.rollNumber : rollNumber // ignore: cast_nullable_to_non_nullable
as String?,classId: freezed == classId ? _self.classId : classId // ignore: cast_nullable_to_non_nullable
as String?,sectionId: freezed == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String?,admissionDate: freezed == admissionDate ? _self.admissionDate : admissionDate // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,classSection: freezed == classSection ? _self.classSection : classSection // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
