import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'click_and_collect_notifier.g.dart';

@riverpod
class ClickAndCollectNotifier extends _$ClickAndCollectNotifier {
  Map<String, dynamic> _clickAndCollectForm = {};
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<void> updateClickAndCollect() async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final message = await ref
          .watch(authServiceProvider)
          .updateClickAndCollect(
              clickAndCollect: _clickAndCollectForm['clickAndCollect'],
              maxOrders: _clickAndCollectForm['maxOrders']);
      if (_clickAndCollectForm['cafeTimes'] != null) {
        await ref
            .watch(authServiceProvider)
            .updateCollectionTime(cafeTimes: _clickAndCollectForm['cafeTimes']);
      }
      return message;
    });
  }

  void updateForm({required String key, required dynamic value}) {
    _clickAndCollectForm[key] = value;
  }
}
