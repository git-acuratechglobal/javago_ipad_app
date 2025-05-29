import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:java_go/auth/model/cafe_time_and_category.dart';
import 'package:java_go/auth/model/stamp_suggestion.dart';
import 'package:java_go/auth/params/add_stamp_params.dart';
import 'package:java_go/home/model/cafe_stats_model.dart';
import 'package:java_go/home/model/get_menu_items.dart';
import 'package:java_go/home/model/get_orders.dart';
import 'package:java_go/home/model/menu_items_data.dart';
import 'package:java_go/home/model/optional_data.dart';
import 'package:java_go/home/model/order_detail.dart';
import 'package:java_go/home/model/order_details.dart';
import 'package:java_go/home/notifiers/accept_orders.dart';
import 'package:java_go/service/dio.dart';
import 'package:java_go/service/local_storage_service.dart';

import '../auth/model/cafe_model.dart';
import '../auth/model/cafetime_model.dart';
import '../auth/model/getStamp.dart';
import '../auth/params/cafe_info_params.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(dioProvider),
    ref.watch(localStorageServiceProvider),
    ref.watch(localStorageServiceProvider).getToken(),
  );
});

class AuthService {
  final Dio _dio;
  final LocalStorageService _localStorageService;
  final String _token;
  AuthService(this._dio, this._localStorageService, this._token);

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

  Future<String> signUp(String? email, String? password) async {
    return await asyncGuard(() async {
      if (email == null || email.isEmpty) {
        throw Exception('Email is required');
      }
      if (password == null || password.isEmpty) {
        throw Exception('password is required');
      }
      final response = await _dio.post('/register',
          data: FormData.fromMap({
            'email': email,
            'password': password,
          }));

      await saveTokens(response.data['token']);
      print(response.data['token']);
      return response.data['message'] ?? "Register successful.";
    });
  }

  Future<String> addCafeInfo({required CafeInfoParams cafeInfoParams}) async {
    final token = await getTokens();
    return await asyncGuard(() async {
      final rawMap = Map<String, dynamic>.from(cafeInfoParams.toJson());
      final formDataMap = <String, dynamic>{};
      rawMap.forEach((key, value) {
        if (value != null && key != 'cafeTimes') {
          formDataMap[key] = value;
        }
      });
      if (formDataMap['image']!=null) {
        formDataMap['image'] = await MultipartFile.fromFile(
          formDataMap['image'],
          filename: formDataMap['image'].split('/').last,
        );
      }

      final formData = FormData.fromMap(formDataMap);
      final response = await _dio.post(
        '/update-cafe-information',
        data: formData,
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );

      print(response.data['token']);
      return response.data['message'];
    });
  }

  Future<String> updateCafeInfo(
      {required CafeInfoParams cafeInfoParams}) async {
    final token = await getTokens();
    return await asyncGuard(() async {
      final response = await _dio.post(
        '/update-cafe-information',
        data: FormData.fromMap(cafeInfoParams.toJson()),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );

      print(response.data['token']);
      return response.data['message'];
    });
  }





  Future<CafeTimeAndCategory> getCafeTimeAndCategory() async {
    return await asyncGuard(() async {
      final response = await _dio.get(
        '/get-cafe-information-suggestions',
        options: Options(
          headers: {
            'x-access-token': '$_token',
            'Accept': 'application/json',
          },
        ),
      );
      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');

      final dynamic ordersJson = response.data;
      return CafeTimeAndCategory.fromJson(ordersJson);
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

  Future<OptionalItems> getOptionItems(int id) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.get(
        '/get-item-detail/$id',
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
      return OptionalItems.fromJson(ordersJson);
    });
  }

  Future<String> updateAddonItemStatus(int id, int status) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.get(
        '/update-addon-item-status/$id',
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

  Future<MenuItem> showMenuItems(page) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.get(
        '/get-menu-items?page=$page',
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
      return MenuItem.fromJson(ordersJson);
    });
  }

  Future<GetOrderDetails> getOrderDetail(
      String orderId, int isIndividualOrder) async {
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

  Future<RefundResponse> orderAccept(
      String orderId, int isIndividualOrder) async {
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

  Future<String> orderRefund(
      String orderId, int isIndividualOrder, String itemIds) async {
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
          'item_ids': itemIds
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

  Future<String> completeOrder(
      String orderId, int isIndividualOrder, int status) async {
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

  Future<String> deleteItem(int id) async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.delete(
        '/delete-menu-item/$id',
        data: FormData.fromMap({
          'id': id,
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

  Future<String> addMenuItems(
      {required Map<String, dynamic> itemsParams}) async {
    return asyncGuard(() async {
      print(itemsParams);
      final token = await getTokens();
      if (token == null || token.isEmpty) {
        throw Exception("Authorization failed: Token is missing.");
      }
      print('Token used for Authorization: $token');
      final response = await _dio.post("/add-menu-item",
          options: Options(
            headers: {
              'x-access-token': '$token',
              'Accept': 'application/json',
            },
          ),
          data: FormData.fromMap(itemsParams));
      return response.data['message'];
    });
  }

  Future<CafeModel?> getCafeData() async {
    return asyncGuard(() async {
      final token = await getTokens();
      if (token == null || token.isEmpty) {
        return null;
      }
      final response = await _dio.get(
        "/profile",
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      final cafeDataJson = response.data['user'][0];

      return CafeModel.fromJson(cafeDataJson);
    });
  }

  Future<CafeStatsModel> getCafeStats() async {
    return asyncGuard(() async {
      final token = await getTokens();
      if (token == null || token.isEmpty) {
        throw Exception("Authorization failed: Token is missing.");
      }
      final response = await _dio.get(
        "/get-cafe-stats",
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      final cafeDataJson = response.data;

      return CafeStatsModel.fromJson(cafeDataJson);
    });
  }

  Future<String> updateClickAndCollect(
      { int ?clickAndCollect,  int? maxOrders}) async {
    return asyncGuard(() async {
      if(clickAndCollect!=null&&maxOrders==null){
        throw Exception("Please choose max Order");
      }
      final token = await getTokens();
      if (token == null || token.isEmpty) {
        throw Exception("Authorization failed: Token is missing.");
      }
      final response = await _dio.post(
        "/update-click-collect",
        data: FormData.fromMap({
          "click_and_collect": clickAndCollect??0,
          "max_orders_click_collect": maxOrders
        }),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      final message = response.data['message'];

      return message;
    });
  }
  Future<String> updateCafeHours(
      {required List<CafeDayTime> cafeTimes}) async {
    return asyncGuard(() async {
      final token = await getTokens();
      if (token == null || token.isEmpty) {
        throw Exception("Authorization failed: Token is missing.");
      }
      final Map<String, dynamic> formMap = {};

      for (int i = 0; i < cafeTimes.length; i++) {
        final dayTime = cafeTimes[i];

        formMap['cafe[$i][open_time]'] = dayTime.openTimeFormatted;
        formMap['cafe[$i][close_time]'] = dayTime.closeTimeFormatted;
        formMap['cafe[$i][is_active]'] = dayTime.isActive;
      }

      final response = await _dio.post(
        "/update-cafe-hours",
        data: FormData.fromMap(formMap),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      final message = response.data['message'];

      return message;
    });
  }

  Future<String> updateCollectionTime(
      {required List<CafeDayTime> cafeTimes}) async {
    return asyncGuard(() async {
      final token = await getTokens();
      if (token == null || token.isEmpty) {
        throw Exception("Authorization failed: Token is missing.");
      }
      final Map<String, dynamic> formMap = {};

      for (int i = 0; i < cafeTimes.length; i++) {
        final dayTime = cafeTimes[i];

        formMap['cafe[$i][open_time]'] = dayTime.openTimeFormatted;
        formMap['cafe[$i][close_time]'] = dayTime.closeTimeFormatted;
        formMap['cafe[$i][is_active]'] = dayTime.isActive;
      }

      final response = await _dio.post(
        "/update-click-collect-hours",
        data: FormData.fromMap(formMap),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      final message = response.data['message'];

      return message;
    });
  }

  Future<GetStamp> getStamp() async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.get(
        '/get-loyalty-stamp',
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
      return GetStamp.fromJson(ordersJson);
    });
  }

  Future<StampSuggestion> stampSuggestion() async {
    final token = await getTokens();
    if (token == null || token.isEmpty) {
      throw Exception("Authorization failed: Token is missing.");
    }
    print('Token used for Authorization: $token');

    return await asyncGuard(() async {
      final response = await _dio.get(
        '/get-loyalty-stamp-suggestions',
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );
      print('Response Headers: ${response.headers}');
      print('Response Data: ${response.data}');

      final dynamic ordersJson = response.data['data'];
      return StampSuggestion.fromJson(ordersJson);
    });
  }

  Future<String> addStamp({required AddStampParams addStampParams}) async {
    final token = await getTokens();
    return await asyncGuard(() async {
      final response = await _dio.post(
        '/add-loyalty-stamp',
        data: FormData.fromMap(addStampParams.toJson()),
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );

      print(response.data['token']);
      return response.data['message'] ?? "Register successful.";
    });
  }

  Future<String> publish() async {
    final token = await getTokens();
    return await asyncGuard(() async {
      final response = await _dio.get(
        '/update-publishing-status',
        options: Options(
          headers: {
            'x-access-token': '$token',
            'Accept': 'application/json',
          },
        ),
      );

      print(response.data['token']);
      return response.data['message'] ?? "Register successful.";
    });
  }


  Future<void> saveTokens(String tokens) async {
    await _localStorageService.setToken(tokens);
  }

  Future<String?> getTokens() async {
    return await _localStorageService.getToken();
  }
}

Future<T> asyncGuard<T>(Future<T> Function() future,
    {Future<T> Function()? dioError}) async {
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
