import 'package:java_go/home/state/order_state/order_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../service/auth_service.dart';
part 'order_notifier.g.dart';

@riverpod
class OrderNotifier extends _$OrderNotifier {
  @override
  FutureOr<OrderState?> build() {
    return null;
  }

  Future<void> makeOrderComplete(
      String orderId, int isindividual, int status) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(authServiceProvider)
          .completeOrder(orderId, isindividual, status);
      return OrderState(orderEvent: OrderEvent.orderComplete, response: result);
    });
  }

  Future<void> refundOrder(
      String orderId, int isIndividualOrder, List<int> itemIds) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(authServiceProvider)
          .orderRefund(orderId, isIndividualOrder, itemIds.join(","));
      return OrderState(orderEvent: OrderEvent.orderRefund, response: result);
    });
  }

  Future<void> makeOrderRefund(
      String orderId, int isindividual, int status, List<int> itemIds) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (itemIds.isNotEmpty) {
        final result = await ref
            .read(authServiceProvider)
            .orderRefund(orderId, isindividual, itemIds.join(","));
      }
      return OrderState(
          orderEvent: OrderEvent.orderRefundOrComplete,
          response: "Order Refund");
    });
  }

  Future<void> makeOrderRefundOrComplete(
      String orderId, int isindividual, int status, List<int> itemIds) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await ref
          .read(authServiceProvider)
          .completeOrder(orderId, isindividual, status);
      if (itemIds.isNotEmpty) {
        final result = await ref
            .read(authServiceProvider)
            .orderRefund(orderId, isindividual, itemIds.join(","));
      }
      return OrderState(
          orderEvent: OrderEvent.orderRefundOrComplete,
          response: "Order Complete");
    });
  }
}
