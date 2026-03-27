// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamModel {

 int get id; String get title; DateTime get date; String get subject; String get type;
/// Create a copy of ExamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamModelCopyWith<ExamModel> get copyWith => _$ExamModelCopyWithImpl<ExamModel>(this as ExamModel, _$identity);

  /// Serializes this ExamModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,date,subject,type);

@override
String toString() {
  return 'ExamModel(id: $id, title: $title, date: $date, subject: $subject, type: $type)';
}


}

/// @nodoc
abstract mixin class $ExamModelCopyWith<$Res>  {
  factory $ExamModelCopyWith(ExamModel value, $Res Function(ExamModel) _then) = _$ExamModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, DateTime date, String subject, String type
});




}
/// @nodoc
class _$ExamModelCopyWithImpl<$Res>
    implements $ExamModelCopyWith<$Res> {
  _$ExamModelCopyWithImpl(this._self, this._then);

  final ExamModel _self;
  final $Res Function(ExamModel) _then;

/// Create a copy of ExamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? date = null,Object? subject = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExamModel].
extension ExamModelPatterns on ExamModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExamModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExamModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExamModel value)  $default,){
final _that = this;
switch (_that) {
case _ExamModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExamModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExamModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  DateTime date,  String subject,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExamModel() when $default != null:
return $default(_that.id,_that.title,_that.date,_that.subject,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  DateTime date,  String subject,  String type)  $default,) {final _that = this;
switch (_that) {
case _ExamModel():
return $default(_that.id,_that.title,_that.date,_that.subject,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  DateTime date,  String subject,  String type)?  $default,) {final _that = this;
switch (_that) {
case _ExamModel() when $default != null:
return $default(_that.id,_that.title,_that.date,_that.subject,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExamModel implements ExamModel {
  const _ExamModel({required this.id, required this.title, required this.date, required this.subject, required this.type});
  factory _ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  DateTime date;
@override final  String subject;
@override final  String type;

/// Create a copy of ExamModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamModelCopyWith<_ExamModel> get copyWith => __$ExamModelCopyWithImpl<_ExamModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,date,subject,type);

@override
String toString() {
  return 'ExamModel(id: $id, title: $title, date: $date, subject: $subject, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ExamModelCopyWith<$Res> implements $ExamModelCopyWith<$Res> {
  factory _$ExamModelCopyWith(_ExamModel value, $Res Function(_ExamModel) _then) = __$ExamModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, DateTime date, String subject, String type
});




}
/// @nodoc
class __$ExamModelCopyWithImpl<$Res>
    implements _$ExamModelCopyWith<$Res> {
  __$ExamModelCopyWithImpl(this._self, this._then);

  final _ExamModel _self;
  final $Res Function(_ExamModel) _then;

/// Create a copy of ExamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? date = null,Object? subject = null,Object? type = null,}) {
  return _then(_ExamModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ResultModel {

 int get id; ExamModel get exam; double get marksObtained; double get maxMarks; String get grade; String? get remarks;
/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultModelCopyWith<ResultModel> get copyWith => _$ResultModelCopyWithImpl<ResultModel>(this as ResultModel, _$identity);

  /// Serializes this ResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.exam, exam) || other.exam == exam)&&(identical(other.marksObtained, marksObtained) || other.marksObtained == marksObtained)&&(identical(other.maxMarks, maxMarks) || other.maxMarks == maxMarks)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,exam,marksObtained,maxMarks,grade,remarks);

@override
String toString() {
  return 'ResultModel(id: $id, exam: $exam, marksObtained: $marksObtained, maxMarks: $maxMarks, grade: $grade, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class $ResultModelCopyWith<$Res>  {
  factory $ResultModelCopyWith(ResultModel value, $Res Function(ResultModel) _then) = _$ResultModelCopyWithImpl;
@useResult
$Res call({
 int id, ExamModel exam, double marksObtained, double maxMarks, String grade, String? remarks
});


$ExamModelCopyWith<$Res> get exam;

}
/// @nodoc
class _$ResultModelCopyWithImpl<$Res>
    implements $ResultModelCopyWith<$Res> {
  _$ResultModelCopyWithImpl(this._self, this._then);

  final ResultModel _self;
  final $Res Function(ResultModel) _then;

/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? exam = null,Object? marksObtained = null,Object? maxMarks = null,Object? grade = null,Object? remarks = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,exam: null == exam ? _self.exam : exam // ignore: cast_nullable_to_non_nullable
as ExamModel,marksObtained: null == marksObtained ? _self.marksObtained : marksObtained // ignore: cast_nullable_to_non_nullable
as double,maxMarks: null == maxMarks ? _self.maxMarks : maxMarks // ignore: cast_nullable_to_non_nullable
as double,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExamModelCopyWith<$Res> get exam {
  
  return $ExamModelCopyWith<$Res>(_self.exam, (value) {
    return _then(_self.copyWith(exam: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResultModel].
extension ResultModelPatterns on ResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultModel value)  $default,){
final _that = this;
switch (_that) {
case _ResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _ResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  ExamModel exam,  double marksObtained,  double maxMarks,  String grade,  String? remarks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultModel() when $default != null:
return $default(_that.id,_that.exam,_that.marksObtained,_that.maxMarks,_that.grade,_that.remarks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  ExamModel exam,  double marksObtained,  double maxMarks,  String grade,  String? remarks)  $default,) {final _that = this;
switch (_that) {
case _ResultModel():
return $default(_that.id,_that.exam,_that.marksObtained,_that.maxMarks,_that.grade,_that.remarks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  ExamModel exam,  double marksObtained,  double maxMarks,  String grade,  String? remarks)?  $default,) {final _that = this;
switch (_that) {
case _ResultModel() when $default != null:
return $default(_that.id,_that.exam,_that.marksObtained,_that.maxMarks,_that.grade,_that.remarks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultModel implements ResultModel {
  const _ResultModel({required this.id, required this.exam, required this.marksObtained, required this.maxMarks, required this.grade, this.remarks});
  factory _ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);

@override final  int id;
@override final  ExamModel exam;
@override final  double marksObtained;
@override final  double maxMarks;
@override final  String grade;
@override final  String? remarks;

/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultModelCopyWith<_ResultModel> get copyWith => __$ResultModelCopyWithImpl<_ResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.exam, exam) || other.exam == exam)&&(identical(other.marksObtained, marksObtained) || other.marksObtained == marksObtained)&&(identical(other.maxMarks, maxMarks) || other.maxMarks == maxMarks)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,exam,marksObtained,maxMarks,grade,remarks);

@override
String toString() {
  return 'ResultModel(id: $id, exam: $exam, marksObtained: $marksObtained, maxMarks: $maxMarks, grade: $grade, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class _$ResultModelCopyWith<$Res> implements $ResultModelCopyWith<$Res> {
  factory _$ResultModelCopyWith(_ResultModel value, $Res Function(_ResultModel) _then) = __$ResultModelCopyWithImpl;
@override @useResult
$Res call({
 int id, ExamModel exam, double marksObtained, double maxMarks, String grade, String? remarks
});


@override $ExamModelCopyWith<$Res> get exam;

}
/// @nodoc
class __$ResultModelCopyWithImpl<$Res>
    implements _$ResultModelCopyWith<$Res> {
  __$ResultModelCopyWithImpl(this._self, this._then);

  final _ResultModel _self;
  final $Res Function(_ResultModel) _then;

/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? exam = null,Object? marksObtained = null,Object? maxMarks = null,Object? grade = null,Object? remarks = freezed,}) {
  return _then(_ResultModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,exam: null == exam ? _self.exam : exam // ignore: cast_nullable_to_non_nullable
as ExamModel,marksObtained: null == marksObtained ? _self.marksObtained : marksObtained // ignore: cast_nullable_to_non_nullable
as double,maxMarks: null == maxMarks ? _self.maxMarks : maxMarks // ignore: cast_nullable_to_non_nullable
as double,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExamModelCopyWith<$Res> get exam {
  
  return $ExamModelCopyWith<$Res>(_self.exam, (value) {
    return _then(_self.copyWith(exam: value));
  });
}
}

// dart format on
