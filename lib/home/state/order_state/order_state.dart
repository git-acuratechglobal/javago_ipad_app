import 'package:freezed_annotation/freezed_annotation.dart';
part "order_state.freezed.dart";

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState({
    required OrderEvent orderEvent,
    String? response,
  }) = _OrderState;
}

enum OrderEvent {
  orderRefund,
  orderComplete,
  orderRefundOrComplete
}
