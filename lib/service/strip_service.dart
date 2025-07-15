import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/service/dio.dart';

final stripeServiceProvider = Provider<StripeService>((ref) {
  final dio = ref.watch(dioProvider);
  return StripeService(dio);
});

class StripeService {
  final Dio _dio;
  StripeService(this._dio);

  Future<Map<String, dynamic>> createPaymentIntent(
    double amount,
  ) async {
    try {
      final adjustedAmount = (amount * 100).round();
      Map<String, dynamic> body = {
        'amount': adjustedAmount,
        'currency': "GBP",
      };
      final skTest = dotenv.env['STRIPE_SECRET_TEST'];

      var response = await _dio.postUri(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $skTest',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      throw Exception("Stripe Error: ${e.response?.data}");
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
