import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/promo_code_model.dart';
import '../../model/subscription_model.dart';
part 'subscription_notifier.g.dart';
@riverpod
Future<SubscriptionModel?> getCafeSubscription(Ref ref) async {
  return ref.watch(authServiceProvider).getSubscription();
}


@riverpod
Future<PromoCodeModel> getPromoCodeDetails(Ref ref,{required String promoCode}) async {
  return ref.watch(authServiceProvider).getPromoCodeDetails(promoCode);
}
