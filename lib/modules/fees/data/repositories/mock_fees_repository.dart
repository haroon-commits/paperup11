import 'package:paperup1/modules/fees/data/models/fee_model.dart';

abstract class FeesRepository {
  Future<List<FeeModel>> getFees(int parentId);
  Future<void> payFee(int feeId, String paymentMethod);
}

class MockFeesRepository implements FeesRepository {
  @override
  Future<List<FeeModel>> getFees(int parentId) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      FeeModel(
        id: 1,
        title: 'Tuition Fee - March 2026',
        amount: 350.0,
        dueDate: DateTime(2026, 3, 10),
        status: 'Paid',
        paymentDate: DateTime(2026, 3, 5),
        transactionId: 'TXN_987654321',
      ),
      FeeModel(
        id: 2,
        title: 'Bus Fee - March 2026',
        amount: 50.0,
        dueDate: DateTime(2026, 3, 15),
        status: 'Unpaid',
      ),
      FeeModel(
        id: 3,
        title: 'Activity Fee - Term 2',
        amount: 100.0,
        dueDate: DateTime(2026, 4, 1),
        status: 'Unpaid',
      ),
    ];
  }

  @override
  Future<void> payFee(int feeId, String paymentMethod) async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
