import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
 part 'view_order_provider.g.dart';
@riverpod
Stream<GetOrdersResponse> todayOrders(Ref ref) async* {
  while (true) {
    final data = await ref.read(authServiceProvider).getTodayOrders();
    yield data;
    await Future.delayed(Duration(seconds: 5));
  }
}

