// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudentFine _$StudentFineFromJson(Map<String, dynamic> json) => _StudentFine(
  fineType: json['fineType'] as String,
  amount: (json['amount'] as num).toDouble(),
  date: json['date'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$StudentFineToJson(_StudentFine instance) =>
    <String, dynamic>{
      'fineType': instance.fineType,
      'amount': instance.amount,
      'date': instance.date,
      'status': instance.status,
    };
