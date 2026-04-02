// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudentFine {

 String get fineType; double get amount; String get date; String get status;
/// Create a copy of StudentFine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentFineCopyWith<StudentFine> get copyWith => _$StudentFineCopyWithImpl<StudentFine>(this as StudentFine, _$identity);

  /// Serializes this StudentFine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentFine&&(identical(other.fineType, fineType) || other.fineType == fineType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fineType,amount,date,status);

@override
String toString() {
  return 'StudentFine(fineType: $fineType, amount: $amount, date: $date, status: $status)';
}


}

/// @nodoc
abstract mixin class $StudentFineCopyWith<$Res>  {
  factory $StudentFineCopyWith(StudentFine value, $Res Function(StudentFine) _then) = _$StudentFineCopyWithImpl;
@useResult
$Res call({
 String fineType, double amount, String date, String status
});




}
/// @nodoc
class _$StudentFineCopyWithImpl<$Res>
    implements $StudentFineCopyWith<$Res> {
  _$StudentFineCopyWithImpl(this._self, this._then);

  final StudentFine _self;
  final $Res Function(StudentFine) _then;

/// Create a copy of StudentFine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fineType = null,Object? amount = null,Object? date = null,Object? status = null,}) {
  return _then(_self.copyWith(
fineType: null == fineType ? _self.fineType : fineType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentFine].
extension StudentFinePatterns on StudentFine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentFine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentFine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentFine value)  $default,){
final _that = this;
switch (_that) {
case _StudentFine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentFine value)?  $default,){
final _that = this;
switch (_that) {
case _StudentFine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fineType,  double amount,  String date,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentFine() when $default != null:
return $default(_that.fineType,_that.amount,_that.date,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fineType,  double amount,  String date,  String status)  $default,) {final _that = this;
switch (_that) {
case _StudentFine():
return $default(_that.fineType,_that.amount,_that.date,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fineType,  double amount,  String date,  String status)?  $default,) {final _that = this;
switch (_that) {
case _StudentFine() when $default != null:
return $default(_that.fineType,_that.amount,_that.date,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudentFine implements StudentFine {
  const _StudentFine({required this.fineType, required this.amount, required this.date, required this.status});
  factory _StudentFine.fromJson(Map<String, dynamic> json) => _$StudentFineFromJson(json);

@override final  String fineType;
@override final  double amount;
@override final  String date;
@override final  String status;

/// Create a copy of StudentFine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentFineCopyWith<_StudentFine> get copyWith => __$StudentFineCopyWithImpl<_StudentFine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentFineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentFine&&(identical(other.fineType, fineType) || other.fineType == fineType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fineType,amount,date,status);

@override
String toString() {
  return 'StudentFine(fineType: $fineType, amount: $amount, date: $date, status: $status)';
}


}

/// @nodoc
abstract mixin class _$StudentFineCopyWith<$Res> implements $StudentFineCopyWith<$Res> {
  factory _$StudentFineCopyWith(_StudentFine value, $Res Function(_StudentFine) _then) = __$StudentFineCopyWithImpl;
@override @useResult
$Res call({
 String fineType, double amount, String date, String status
});




}
/// @nodoc
class __$StudentFineCopyWithImpl<$Res>
    implements _$StudentFineCopyWith<$Res> {
  __$StudentFineCopyWithImpl(this._self, this._then);

  final _StudentFine _self;
  final $Res Function(_StudentFine) _then;

/// Create a copy of StudentFine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fineType = null,Object? amount = null,Object? date = null,Object? status = null,}) {
  return _then(_StudentFine(
fineType: null == fineType ? _self.fineType : fineType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
