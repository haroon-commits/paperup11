import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/modules/fees/data/models/fee_model.dart';
import 'package:paperup1/modules/fees/data/repositories/mock_fees_repository.dart';

final feesRepositoryProvider = Provider<FeesRepository>((ref) => MockFeesRepository());

class FeesNotifier extends AsyncNotifier<List<FeeModel>> {
  @override
  FutureOr<List<FeeModel>> build() {
    return [];
  }

  Future<void> fetchFees(int parentId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(feesRepositoryProvider);
      return await repository.getFees(parentId);
    });
  }

  Future<void> pay(int feeId, String method) async {
    final repository = ref.read(feesRepositoryProvider);
    await repository.payFee(feeId, method);
  }
}

final feesProvider = AsyncNotifierProvider<FeesNotifier, List<FeeModel>>(() {
  return FeesNotifier();
});
