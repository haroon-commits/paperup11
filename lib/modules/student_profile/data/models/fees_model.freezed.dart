// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fees_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeeRecord {

 String get month; double get amount; String get date; String get receiptNumber; String get status;// "Paid" | "Pending"
 String? get feeType;
/// Create a copy of FeeRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeeRecordCopyWith<FeeRecord> get copyWith => _$FeeRecordCopyWithImpl<FeeRecord>(this as FeeRecord, _$identity);

  /// Serializes this FeeRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeeRecord&&(identical(other.month, month) || other.month == month)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeType, feeType) || other.feeType == feeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,amount,date,receiptNumber,status,feeType);

@override
String toString() {
  return 'FeeRecord(month: $month, amount: $amount, date: $date, receiptNumber: $receiptNumber, status: $status, feeType: $feeType)';
}


}

/// @nodoc
abstract mixin class $FeeRecordCopyWith<$Res>  {
  factory $FeeRecordCopyWith(FeeRecord value, $Res Function(FeeRecord) _then) = _$FeeRecordCopyWithImpl;
@useResult
$Res call({
 String month, double amount, String date, String receiptNumber, String status, String? feeType
});




}
/// @nodoc
class _$FeeRecordCopyWithImpl<$Res>
    implements $FeeRecordCopyWith<$Res> {
  _$FeeRecordCopyWithImpl(this._self, this._then);

  final FeeRecord _self;
  final $Res Function(FeeRecord) _then;

/// Create a copy of FeeRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? amount = null,Object? date = null,Object? receiptNumber = null,Object? status = null,Object? feeType = freezed,}) {
  return _then(_self.copyWith(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeType: freezed == feeType ? _self.feeType : feeType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeeRecord].
extension FeeRecordPatterns on FeeRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeeRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeeRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeeRecord value)  $default,){
final _that = this;
switch (_that) {
case _FeeRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeeRecord value)?  $default,){
final _that = this;
switch (_that) {
case _FeeRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String month,  double amount,  String date,  String receiptNumber,  String status,  String? feeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeeRecord() when $default != null:
return $default(_that.month,_that.amount,_that.date,_that.receiptNumber,_that.status,_that.feeType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String month,  double amount,  String date,  String receiptNumber,  String status,  String? feeType)  $default,) {final _that = this;
switch (_that) {
case _FeeRecord():
return $default(_that.month,_that.amount,_that.date,_that.receiptNumber,_that.status,_that.feeType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String month,  double amount,  String date,  String receiptNumber,  String status,  String? feeType)?  $default,) {final _that = this;
switch (_that) {
case _FeeRecord() when $default != null:
return $default(_that.month,_that.amount,_that.date,_that.receiptNumber,_that.status,_that.feeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeeRecord implements FeeRecord {
  const _FeeRecord({required this.month, required this.amount, required this.date, required this.receiptNumber, required this.status, this.feeType});
  factory _FeeRecord.fromJson(Map<String, dynamic> json) => _$FeeRecordFromJson(json);

@override final  String month;
@override final  double amount;
@override final  String date;
@override final  String receiptNumber;
@override final  String status;
// "Paid" | "Pending"
@override final  String? feeType;

/// Create a copy of FeeRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeeRecordCopyWith<_FeeRecord> get copyWith => __$FeeRecordCopyWithImpl<_FeeRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeeRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeeRecord&&(identical(other.month, month) || other.month == month)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeType, feeType) || other.feeType == feeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,month,amount,date,receiptNumber,status,feeType);

@override
String toString() {
  return 'FeeRecord(month: $month, amount: $amount, date: $date, receiptNumber: $receiptNumber, status: $status, feeType: $feeType)';
}


}

/// @nodoc
abstract mixin class _$FeeRecordCopyWith<$Res> implements $FeeRecordCopyWith<$Res> {
  factory _$FeeRecordCopyWith(_FeeRecord value, $Res Function(_FeeRecord) _then) = __$FeeRecordCopyWithImpl;
@override @useResult
$Res call({
 String month, double amount, String date, String receiptNumber, String status, String? feeType
});




}
/// @nodoc
class __$FeeRecordCopyWithImpl<$Res>
    implements _$FeeRecordCopyWith<$Res> {
  __$FeeRecordCopyWithImpl(this._self, this._then);

  final _FeeRecord _self;
  final $Res Function(_FeeRecord) _then;

/// Create a copy of FeeRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? amount = null,Object? date = null,Object? receiptNumber = null,Object? status = null,Object? feeType = freezed,}) {
  return _then(_FeeRecord(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeType: freezed == feeType ? _self.feeType : feeType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
