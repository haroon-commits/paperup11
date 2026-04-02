import 'package:freezed_annotation/freezed_annotation.dart';

part 'fees_model.freezed.dart';
part 'fees_model.g.dart';

@freezed
abstract class FeeRecord with _$FeeRecord {
  const factory FeeRecord({
    required String month,
    required double amount,
    required String date,
    required String receiptNumber,
    required String status, // "Paid" | "Pending"
    String? feeType,
  }) = _FeeRecord;

  factory FeeRecord.fromJson(Map<String, dynamic> json) =>
      _$FeeRecordFromJson(json);
}
