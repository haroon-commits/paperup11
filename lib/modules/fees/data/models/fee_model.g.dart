// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeeModel _$FeeModelFromJson(Map<String, dynamic> json) => _FeeModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  amount: (json['amount'] as num).toDouble(),
  dueDate: DateTime.parse(json['dueDate'] as String),
  status: json['status'] as String,
  paymentDate: json['paymentDate'] == null
      ? null
      : DateTime.parse(json['paymentDate'] as String),
  transactionId: json['transactionId'] as String?,
);

Map<String, dynamic> _$FeeModelToJson(_FeeModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'amount': instance.amount,
  'dueDate': instance.dueDate.toIso8601String(),
  'status': instance.status,
  'paymentDate': instance.paymentDate?.toIso8601String(),
  'transactionId': instance.transactionId,
};
