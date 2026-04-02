import 'package:freezed_annotation/freezed_annotation.dart';

part 'fine_model.freezed.dart';
part 'fine_model.g.dart';

@freezed
abstract class StudentFine with _$StudentFine {
  const factory StudentFine({
    required String fineType,
    required double amount,
    required String date,
    required String status, // "Paid" | "Pending"
  }) = _StudentFine;

  factory StudentFine.fromJson(Map<String, dynamic> json) =>
      _$StudentFineFromJson(json);
}
