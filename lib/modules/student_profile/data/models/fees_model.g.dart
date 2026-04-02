// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fees_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeeRecord _$FeeRecordFromJson(Map<String, dynamic> json) => _FeeRecord(
  month: json['month'] as String,
  amount: (json['amount'] as num).toDouble(),
  date: json['date'] as String,
  receiptNumber: json['receiptNumber'] as String,
  status: json['status'] as String,
  feeType: json['feeType'] as String?,
);

Map<String, dynamic> _$FeeRecordToJson(_FeeRecord instance) =>
    <String, dynamic>{
      'month': instance.month,
      'amount': instance.amount,
      'date': instance.date,
      'receiptNumber': instance.receiptNumber,
      'status': instance.status,
      'feeType': instance.feeType,
    };
