import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
 part 'view_order_provider.g.dart';
@riverpod
FutureOr<GetOrdersResponse> todayOrders(Ref ref) async {
  return await ref.read(authServiceProvider).getTodayOrders();
}

