import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:java_go/home/model/get_orders.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    GetOrdersResponse? ordersResponse, 
  }) = _HomeState;
}

// @freezed
// abstract class HomeState with _$HomeState {
//   const factory HomeState({
    
  
//     List<GetOrder>? orderList,
//   }) = _HomeState;
// }