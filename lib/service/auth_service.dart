import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/home/model/get_menu_items.dart';
import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/home/model/order_detail.dart';
import 'package:java_go/home/model/order_details.dart';
import 'package:java_go/home/notifiers/accept_orders.dart';
import 'package:java_go/service/dio.dart';
import 'package:java_go/service/local_storage_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(dioProvider),
    ref.watch(localStorageServiceProvider),
  );
});

class AuthService {
  final Dio _dio;
  final LocalStorageService _localStorageService;

  AuthService(
    this._dio,
    this._localStorageService,
  );

  Future<String> login(String email, String password) async {
    return await asyncGuard(() async {
      final response = await _dio.post('/login',
          data: FormData.fromMap({
            'email': email,
            'password': password,
          }));

      await saveTokens(response.data['token']);
      print(response.data['token']);
      return response.data['message'] ?? "Login successful.";
    });
  }

  Future<GetOrdersResponse> getOrders() async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.get(
        '/get-orders',
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');

      final dynamic ordersJson = response.data;
      return GetOrdersResponse.fromJson(ordersJson);
    });
  }


    Future<GetMenuItem> getMenuItems() async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.get(
        '/get-menu-item-options',
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');

      final dynamic ordersJson = response.data;
      return GetMenuItem.fromJson(ordersJson);
    });
  }

  Future<GetOrderDetails> getOrderDetail(String orderId, int isIndividualOrder) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.post(
        '/get-order-details',
        data: FormData.fromMap({
          'id': orderId,
          'is_individual_order': isIndividualOrder,
        }),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      print(FormData.fromMap({
        'order_id': orderId,
        'is_individual_order': isIndividualOrder,
      }));
      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');

      final dynamic ordersJson = response.data;
      return GetOrderDetails.fromJson(ordersJson);
    });
  }

  Future<Orders> OrderDetail(String orderId, int isIndividualOrder) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.post(
        '/get-order-details',
        data: FormData.fromMap({
          'id': orderId,
          'is_individual_order': isIndividualOrder,
        }),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      print(FormData.fromMap({
        'order_id': orderId,
        'is_individual_order': isIndividualOrder,
      }));
      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');

      final dynamic ordersJson = response.data;
      return Orders.fromJson(ordersJson);
    });
  }

  Future<GetOrdersResponse> getTodayOrders() async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.get(
        '/get-today-orders',
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');

      final dynamic todayOrdersJson = response.data;
      return GetOrdersResponse.fromJson(todayOrdersJson);
    });
  }

  Future<RefundResponse> orderAccept(String orderId, int isIndividualOrder) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.post(
        '/mark-order-processed',
        data: FormData.fromMap({
          'id': orderId,
          'is_individual_order': isIndividualOrder,
        }),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.statusMessage}');

      final data = response.data;

      final message = data['message'];
      final unavailableItems = data['unavailable_items'] != null
          ? (data['unavailable_items'] as List)
              .map((item) => UnaviableItems.fromJson(item))
              .toList()
          : null;

      return RefundResponse(
        message: message,
        unavailableItems: unavailableItems,
      );
    });
  }

  Future<String> orderRefund(String orderId, int isIndividualOrder) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.post(
        '/order-refund',
        data: FormData.fromMap({
          'id': orderId,
          'is_individual_order': isIndividualOrder,
        }),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.statusMessage}');

      return response.data['message'];
    });
  }

  Future<String> makeAvailable(int itemId, int status) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');


    return await asyncGuard(() async {
      final response = await _dio.post(
        '/update-menu-item-status/$itemId',
        data: FormData.fromMap({
          'status': status,
        }),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.statusMessage}');

      return response.data['message'];
    });
  }

  Future<String> completeOrder(String orderId, int isIndividualOrder, int status) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.post(
        '/mark-order-completed',
        data: FormData.fromMap({
          'id': orderId,
          'is_individual_order': isIndividualOrder,
          'status': status,
        }),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.statusMessage}');

      return response.data['message'];
    });
  }

  Future<void> saveTokens(String tokens) async {
    await _localStorageService.setToken(tokens);
  }

  Future<String?> getTokens() async {
    return await _localStorageService.getToken();
  }
}

Future<T> asyncGuard<T>(Future<T> Function() future, {Future<T> Function()? dioError}) async {
  try {
    return await future();
  } on DioException catch (e) {
    if (dioError != null) {
      if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        return await dioError();
      }
    }
    throw e.message ?? e.error.toString();
  } on FormatException catch (_) {
    throw "Unable to process data from server";
  } catch (e) {
    rethrow;
  }
}
