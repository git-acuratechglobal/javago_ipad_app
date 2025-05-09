import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/state/home_state.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_notifier.g.dart';
final orderHistoryPageProvider = StateProvider<int>((ref) => 0);

@Riverpod(keepAlive: true)
class HomeNotifier extends _$HomeNotifier {
  @override
  FutureOr<HomeState?> build() async {
   
    final ordersResult = await ref.read(authServiceProvider).getOrders();

    return HomeState(
  ordersResponse: ordersResult
    );
  }
}
// @Riverpod(keepAlive: true)
// class HomeNotifier extends _$HomeNotifier {
//   @override
//   Future<HomeState> build() async {
//     final ordersResult = await ref.read(authServiceProvider).getOrders();
//     return HomeState(ordersResponse: ordersResult);
//   }

//   Future<void> refreshOrders() async {
//     final orders = await ref.read(authServiceProvider).getOrders();
//     state = AsyncData(HomeState(ordersResponse: orders));
//   }
// }
// @riverpod
// @riverpod
// Future<HomeState> homeNotifier(Ref ref) async {
//   // Fetch the order data from the authService
//   final ordersResult = await ref.read(authServiceProvider).getOrders();

//   // Access individualOrders and groupCoffeeRunOrders from the GetOrdersResponse object
//   return HomeState(
//     orderList: ordersResult.individualOrders, // Access individualOrders here
//     groupCoffeeRunOrders: ordersResult.groupCoffeeRunOrders,
//   );
// }
