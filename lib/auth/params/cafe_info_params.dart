import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cafe_info_params.freezed.dart';
part 'cafe_info_params.g.dart';

@freezed
abstract class CafeInfoParams with _$CafeInfoParams {
  const factory CafeInfoParams({
    required String name,
    required String phone,
    required String address,
    required String postcode,
    required double latitude,
    required double longitude,
    required String categories,
    required String bio,
    @JsonKey(name: 'coffee_origin') required String coffeeOrigin,
    @JsonKey(name: 'coffee_roast') required String coffeeRoast,
    @JsonKey(name: 'coffee_origin_country') required String coffeeOriginCountry,
    @JsonKey(name: 'speciallity_coffee') required int speciallityCoffee,
    required String image,
  }) = _CafeInfoParams;

  factory CafeInfoParams.fromJson(Map<String, dynamic> json) =>
      _$CafeInfoParamsFromJson(json);
}

@Riverpod(keepAlive: true)
class CafeInfoParamsNotifier extends _$CafeInfoParamsNotifier {
  @override
  CafeInfoParams build() {
    return CafeInfoParams(
      name: '',
      phone: '',
      address: '',
      postcode: '',
      latitude: 0.0,
      longitude: 0.0,
      categories: '',
      bio: '',
      coffeeOrigin: '',
      coffeeRoast: '',
      coffeeOriginCountry: '',
      speciallityCoffee: 0,
      image: "",
    );
  }

  void updateName(String name) => state = state.copyWith(name: name);
  void updatePhone(String phone) => state = state.copyWith(phone: phone);
  void updateAddress(String address) =>
      state = state.copyWith(address: address);
  void updatePostcode(String postcode) =>
      state = state.copyWith(postcode: postcode);
  void updateLatitude(double lat) => state = state.copyWith(latitude: lat);
  void updateLongitude(double lng) => state = state.copyWith(longitude: lng);
  void updateCategories(String cat) => state = state.copyWith(categories: cat);
  void updateBio(String bio) => state = state.copyWith(bio: bio);
  void updateCoffeeOrigin(String origin) =>
      state = state.copyWith(coffeeOrigin: origin);
  void updateCoffeeRoast(String roast) =>
      state = state.copyWith(coffeeRoast: roast);
  void updateCoffeeOriginCountry(String country) =>
      state = state.copyWith(coffeeOriginCountry: country);
  void updateSpecialityCoffee(int value) =>
      state = state.copyWith(speciallityCoffee: value);
  void updateImage(String image) => state = state.copyWith(image: image);
}
