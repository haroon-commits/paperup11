// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamResult {

 String get examination; int get totalMarks; int get obtainedMarks; double get percentage; String get grade; String get status;
/// Create a copy of ExamResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamResultCopyWith<ExamResult> get copyWith => _$ExamResultCopyWithImpl<ExamResult>(this as ExamResult, _$identity);

  /// Serializes this ExamResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamResult&&(identical(other.examination, examination) || other.examination == examination)&&(identical(other.totalMarks, totalMarks) || other.totalMarks == totalMarks)&&(identical(other.obtainedMarks, obtainedMarks) || other.obtainedMarks == obtainedMarks)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,examination,totalMarks,obtainedMarks,percentage,grade,status);

@override
String toString() {
  return 'ExamResult(examination: $examination, totalMarks: $totalMarks, obtainedMarks: $obtainedMarks, percentage: $percentage, grade: $grade, status: $status)';
}


}

/// @nodoc
abstract mixin class $ExamResultCopyWith<$Res>  {
  factory $ExamResultCopyWith(ExamResult value, $Res Function(ExamResult) _then) = _$ExamResultCopyWithImpl;
@useResult
$Res call({
 String examination, int totalMarks, int obtainedMarks, double percentage, String grade, String status
});




}
/// @nodoc
class _$ExamResultCopyWithImpl<$Res>
    implements $ExamResultCopyWith<$Res> {
  _$ExamResultCopyWithImpl(this._self, this._then);

  final ExamResult _self;
  final $Res Function(ExamResult) _then;

/// Create a copy of ExamResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? examination = null,Object? totalMarks = null,Object? obtainedMarks = null,Object? percentage = null,Object? grade = null,Object? status = null,}) {
  return _then(_self.copyWith(
examination: null == examination ? _self.examination : examination // ignore: cast_nullable_to_non_nullable
as String,totalMarks: null == totalMarks ? _self.totalMarks : totalMarks // ignore: cast_nullable_to_non_nullable
as int,obtainedMarks: null == obtainedMarks ? _self.obtainedMarks : obtainedMarks // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExamResult].
extension ExamResultPatterns on ExamResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExamResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExamResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExamResult value)  $default,){
final _that = this;
switch (_that) {
case _ExamResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExamResult value)?  $default,){
final _that = this;
switch (_that) {
case _ExamResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String examination,  int totalMarks,  int obtainedMarks,  double percentage,  String grade,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExamResult() when $default != null:
return $default(_that.examination,_that.totalMarks,_that.obtainedMarks,_that.percentage,_that.grade,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String examination,  int totalMarks,  int obtainedMarks,  double percentage,  String grade,  String status)  $default,) {final _that = this;
switch (_that) {
case _ExamResult():
return $default(_that.examination,_that.totalMarks,_that.obtainedMarks,_that.percentage,_that.grade,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String examination,  int totalMarks,  int obtainedMarks,  double percentage,  String grade,  String status)?  $default,) {final _that = this;
switch (_that) {
case _ExamResult() when $default != null:
return $default(_that.examination,_that.totalMarks,_that.obtainedMarks,_that.percentage,_that.grade,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExamResult implements ExamResult {
  const _ExamResult({required this.examination, required this.totalMarks, required this.obtainedMarks, required this.percentage, required this.grade, required this.status});
  factory _ExamResult.fromJson(Map<String, dynamic> json) => _$ExamResultFromJson(json);

@override final  String examination;
@override final  int totalMarks;
@override final  int obtainedMarks;
@override final  double percentage;
@override final  String grade;
@override final  String status;

/// Create a copy of ExamResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamResultCopyWith<_ExamResult> get copyWith => __$ExamResultCopyWithImpl<_ExamResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamResult&&(identical(other.examination, examination) || other.examination == examination)&&(identical(other.totalMarks, totalMarks) || other.totalMarks == totalMarks)&&(identical(other.obtainedMarks, obtainedMarks) || other.obtainedMarks == obtainedMarks)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,examination,totalMarks,obtainedMarks,percentage,grade,status);

@override
String toString() {
  return 'ExamResult(examination: $examination, totalMarks: $totalMarks, obtainedMarks: $obtainedMarks, percentage: $percentage, grade: $grade, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ExamResultCopyWith<$Res> implements $ExamResultCopyWith<$Res> {
  factory _$ExamResultCopyWith(_ExamResult value, $Res Function(_ExamResult) _then) = __$ExamResultCopyWithImpl;
@override @useResult
$Res call({
 String examination, int totalMarks, int obtainedMarks, double percentage, String grade, String status
});




}
/// @nodoc
class __$ExamResultCopyWithImpl<$Res>
    implements _$ExamResultCopyWith<$Res> {
  __$ExamResultCopyWithImpl(this._self, this._then);

  final _ExamResult _self;
  final $Res Function(_ExamResult) _then;

/// Create a copy of ExamResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? examination = null,Object? totalMarks = null,Object? obtainedMarks = null,Object? percentage = null,Object? grade = null,Object? status = null,}) {
  return _then(_ExamResult(
examination: null == examination ? _self.examination : examination // ignore: cast_nullable_to_non_nullable
as String,totalMarks: null == totalMarks ? _self.totalMarks : totalMarks // ignore: cast_nullable_to_non_nullable
as int,obtainedMarks: null == obtainedMarks ? _self.obtainedMarks : obtainedMarks // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
