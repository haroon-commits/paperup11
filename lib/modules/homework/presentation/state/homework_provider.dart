import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/modules/homework/data/models/homework_model.dart';
import 'package:paperup1/modules/homework/data/repositories/mock_homework_repository.dart';

final homeworkRepositoryProvider = Provider<HomeworkRepository>((ref) => MockHomeworkRepository());

class HomeworkNotifier extends AsyncNotifier<List<HomeworkModel>> {
  @override
  FutureOr<List<HomeworkModel>> build() {
    return [];
  }

  Future<void> fetchHomework(int userId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(homeworkRepositoryProvider);
      return await repository.getHomework(userId);
    });
  }

  Future<void> submit(int homeworkId, String filePath) async {
    final repository = ref.read(homeworkRepositoryProvider);
    await repository.submitHomework(homeworkId, filePath);
  }
}

final homeworkProvider = AsyncNotifierProvider<HomeworkNotifier, List<HomeworkModel>>(() {
  return HomeworkNotifier();
});
