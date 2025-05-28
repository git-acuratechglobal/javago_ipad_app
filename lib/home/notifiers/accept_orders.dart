import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/home/state/accept_refund_state.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'accept_orders.g.dart';

// @riverpod
// Future<String> todayOrdersAccept(Ref ref, String orderId, int isIndividualOrder) async {
//  print('Fetching order details: id=$orderId, isIndividual=$isIndividualOrder');
//   return await ref.read(authServiceProvider).orderAccept(orderId, isIndividualOrder);
// }

@riverpod
class AcceptOrders extends _$AcceptOrders {
  @override
  OrderAcceptOrRefundState? build() {
    return OrderAcceptOrRefundState();
  }

  Future<void> acceptOrder(String orderId, int isIndividualOrder) async {
    try {
      state = state?.copyWith(isLoading: true, orderId: orderId, error: "", message: "");
      final result = await ref.watch(authServiceProvider).orderAccept(orderId, isIndividualOrder);

      state = state?.copyWith(
          isLoading: false,
          orderId: orderId,
          isIndividual: isIndividualOrder,
          message: result.message,
          unavailableItems: result.unavailableItems);
    } catch (e) {
    
      state = state?.copyWith(
        isAccenpting: false,
        orderId: orderId,
        isIndividual: isIndividualOrder,
        error: e.toString(),
      );
    }
  }

  Future<void> refundOrder(String orderId, int isIndividualOrder,List<int> itemIds) async {
    state = state?.copyWith(isRefunding: true, orderId: orderId, error: "", message: "");

    try {
      final result = await ref.read(authServiceProvider).orderRefund(orderId, isIndividualOrder,itemIds.join(","));

      // Check if all items were refunded (nothing is marked available)
      // final unavailableItems = state?.unavailableItems ?? [];
      // final refundedAll = unavailableItems.every((item) => item.isSelected);

      // if (refundedAll) {
      //   // All items refunded, mark as completed
      //   await makeOrderComplete(orderId, isIndividualOrder, 2); // status 2 = completed
      // } else {
      //   // Some refunded, rest maybe in progress
      //   await makeOrderComplete(orderId, isIndividualOrder, 1); // status 1 = in progress
      // }

      state = state?.copyWith(
        isRefunding: false,
        orderId: orderId,
        isIndividual: isIndividualOrder,
        message: result,
      );
    } catch (e) {
      // Error handling
      state = state?.copyWith(
        isRefunding: false,
        orderId: orderId,
        isIndividual: isIndividualOrder,
        error: e.toString(),
      );
    }
  }

  Future<void> makeOrderComplete(String orderId, int isindividual, int status) async {
    state = state?.copyWith(isLoading: true, orderId: orderId, error: "", message: "");

    try {
      final result =
          await ref.read(authServiceProvider).completeOrder(orderId, isindividual, status);
      state = state?.copyWith(
          isLoading: false, orderId: orderId, isIndividual: isindividual, message: result);
    } catch (e) {
      // Error handling
      state = state?.copyWith(
        isLoading: false,
        orderId: orderId,
        isIndividual: isindividual,
        error: e.toString(),
      );
    }
  }

  Future<void> makeAvailable(List<UnaviableItems> items) async {
    state = OrderAcceptOrRefundState(isMakingAvailable: true);

    try {
      final results = await Future.wait(
        items.map((item) async {
          return await ref.read(authServiceProvider).makeAvailable(item.id ?? 0, item.status ?? 0);
        }),
      );
      state = state?.copyWith(
        isMakingAvailable: false,
        message: "Menu item status updated successfully!",
      );
    } catch (e) {
      // Error handling
      state = state?.copyWith(
        isMakingAvailable: false,
        error: e.toString(),
      );
    }
  }

  Future<void> makeUnAvailable(int itemId, int status) async {
    state = OrderAcceptOrRefundState();

    try {
      final result = await ref.read(authServiceProvider).makeAvailable(itemId, status);
      state = state?.copyWith(
        isMakingAvailable: false,
        message: "Menu item status updated",
      );
    } catch (e) {
      // Error handling
      state = state?.copyWith(
        isMakingAvailable: false,
        error: e.toString(),
      );
    }
  }
}

class RefundResponse {
  String? message;
  List<UnaviableItems>? unavailableItems;
  RefundResponse({this.message, this.unavailableItems});
}
