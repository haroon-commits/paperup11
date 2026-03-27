import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/modules/exams/data/models/exam_model.dart';
import 'package:paperup1/modules/exams/data/repositories/mock_exams_repository.dart';

final examsRepositoryProvider = Provider<ExamsRepository>((ref) => MockExamsRepository());

class ResultsNotifier extends AsyncNotifier<List<ResultModel>> {
  @override
  FutureOr<List<ResultModel>> build() {
    return [];
  }

  Future<void> fetchResults(int userId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(examsRepositoryProvider);
      return await repository.getResults(userId);
    });
  }
}

final resultsProvider = AsyncNotifierProvider<ResultsNotifier, List<ResultModel>>(() {
  return ResultsNotifier();
});
