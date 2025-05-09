import 'package:java_go/home/model/get_orders.dart';

class OrderAcceptOrRefundState {
  final bool? isLoading;
  final String? orderId;
  final int? isIndividual;
  final bool isRefunding;
  final bool isAccenpting;
  final bool isMakingAvailable;

  final int? status;
  final int? itemId;
  final String? message;
  final String? error;
  final List<UnaviableItems>? unavailableItems;
  OrderAcceptOrRefundState(
      {this.isLoading = false,
      this.isRefunding = false,
      this.isMakingAvailable = false,
      this.orderId,
      this.itemId,
      this.isIndividual,
      this.isAccenpting = false,
      this.status,
      this.message,
      this.error,
      this.unavailableItems});

  OrderAcceptOrRefundState copyWith({
    bool? isLoading,
    bool? isRefunding,
    bool? isAccenpting,
    bool? isMakingAvailable,
    String? orderId,
    int? isIndividual,
    int? status,
    int? itemId,
    String? message,
    String? error,
    List<UnaviableItems>? unavailableItems,
  }) {
    return OrderAcceptOrRefundState(
      isLoading: isLoading ?? this.isLoading,
       isRefunding: isRefunding ?? this.isRefunding,
      isMakingAvailable: isMakingAvailable ?? this.isMakingAvailable,
      isAccenpting: isAccenpting ?? this.isAccenpting,
      orderId: orderId ?? this.orderId,
      isIndividual: isIndividual ?? this.isIndividual,
      status: status ?? this.status,
      itemId: itemId ?? this.itemId,
      message: message ?? this.message,
      error: error ?? this.error,
      unavailableItems: unavailableItems ?? this.unavailableItems,
    );
  }
}
