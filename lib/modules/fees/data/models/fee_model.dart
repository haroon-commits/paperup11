import 'package:freezed_annotation/freezed_annotation.dart';

part 'fee_model.freezed.dart';
part 'fee_model.g.dart';

@freezed
abstract class FeeModel with _$FeeModel {
  const factory FeeModel({
    required int id,
    required String title,
    required double amount,
    required DateTime dueDate,
    required String status, // Paid, Unpaid, Partially Paid
    DateTime? paymentDate,
    String? transactionId,
  }) = _FeeModel;

  factory FeeModel.fromJson(Map<String, dynamic> json) =>
      _$FeeModelFromJson(json);
}
