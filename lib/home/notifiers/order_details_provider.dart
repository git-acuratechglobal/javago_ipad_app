import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:java_go/home/model/order_detail.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_details_provider.g.dart';
@riverpod
Future<GetOrderDetails> getOrderDetails(Ref ref, String orderId, int isIndividualOrder) async {
 print('Fetching order details: id=$orderId, isIndividual=$isIndividualOrder');
  return await ref.read(authServiceProvider).getOrderDetail(orderId, isIndividualOrder);
}
