import 'package:java_go/auth/params/add_stamp_params.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_stamp_notifier.g.dart';

@riverpod
class AddStampNotifier extends _$AddStampNotifier {
  @override
  FutureOr<String?> build() {
    return null;
  }

  Future<void> addStamp() async {
    state = AsyncLoading();

    state = await AsyncValue.guard(() async {
      final addStamp = ref.watch(addStampParamsNotifierProvider);
      return ref.watch(authServiceProvider).addStamp(addStampParams: addStamp);
    });
  }
}
