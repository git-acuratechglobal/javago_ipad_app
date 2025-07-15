// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafe_info_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CafeInfoParams _$CafeInfoParamsFromJson(Map<String, dynamic> json) {
  return _CafeInfoParams.fromJson(json);
}

/// @nodoc
mixin _$CafeInfoParams {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get postcode => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get categories => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'coffee_origin')
  String get coffeeOrigin => throw _privateConstructorUsedError;
  @JsonKey(name: 'coffee_roast')
  String get coffeeRoast => throw _privateConstructorUsedError;
  @JsonKey(name: 'coffee_origin_country')
  String get coffeeOriginCountry => throw _privateConstructorUsedError;
  @JsonKey(name: 'speciallity_coffee')
  int get speciallityCoffee => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<CafeDayTime>? get cafeTimes => throw _privateConstructorUsedError;

  /// Serializes this CafeInfoParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CafeInfoParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CafeInfoParamsCopyWith<CafeInfoParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CafeInfoParamsCopyWith<$Res> {
  factory $CafeInfoParamsCopyWith(
          CafeInfoParams value, $Res Function(CafeInfoParams) then) =
      _$CafeInfoParamsCopyWithImpl<$Res, CafeInfoParams>;
  @useResult
  $Res call(
      {String name,
      String phone,
      String address,
      String city,
      String postcode,
      double latitude,
      double longitude,
      String categories,
      String bio,
      @JsonKey(name: 'coffee_origin') String coffeeOrigin,
      @JsonKey(name: 'coffee_roast') String coffeeRoast,
      @JsonKey(name: 'coffee_origin_country') String coffeeOriginCountry,
      @JsonKey(name: 'speciallity_coffee') int speciallityCoffee,
      String? image,
      List<CafeDayTime>? cafeTimes});
}

/// @nodoc
class _$CafeInfoParamsCopyWithImpl<$Res, $Val extends CafeInfoParams>
    implements $CafeInfoParamsCopyWith<$Res> {
  _$CafeInfoParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CafeInfoParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? address = null,
    Object? city = null,
    Object? postcode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? categories = null,
    Object? bio = null,
    Object? coffeeOrigin = null,
    Object? coffeeRoast = null,
    Object? coffeeOriginCountry = null,
    Object? speciallityCoffee = null,
    Object? image = freezed,
    Object? cafeTimes = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      postcode: null == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeOrigin: null == coffeeOrigin
          ? _value.coffeeOrigin
          : coffeeOrigin // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeRoast: null == coffeeRoast
          ? _value.coffeeRoast
          : coffeeRoast // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeOriginCountry: null == coffeeOriginCountry
          ? _value.coffeeOriginCountry
          : coffeeOriginCountry // ignore: cast_nullable_to_non_nullable
              as String,
      speciallityCoffee: null == speciallityCoffee
          ? _value.speciallityCoffee
          : speciallityCoffee // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      cafeTimes: freezed == cafeTimes
          ? _value.cafeTimes
          : cafeTimes // ignore: cast_nullable_to_non_nullable
              as List<CafeDayTime>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CafeInfoParamsImplCopyWith<$Res>
    implements $CafeInfoParamsCopyWith<$Res> {
  factory _$$CafeInfoParamsImplCopyWith(_$CafeInfoParamsImpl value,
          $Res Function(_$CafeInfoParamsImpl) then) =
      __$$CafeInfoParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String phone,
      String address,
      String city,
      String postcode,
      double latitude,
      double longitude,
      String categories,
      String bio,
      @JsonKey(name: 'coffee_origin') String coffeeOrigin,
      @JsonKey(name: 'coffee_roast') String coffeeRoast,
      @JsonKey(name: 'coffee_origin_country') String coffeeOriginCountry,
      @JsonKey(name: 'speciallity_coffee') int speciallityCoffee,
      String? image,
      List<CafeDayTime>? cafeTimes});
}

/// @nodoc
class __$$CafeInfoParamsImplCopyWithImpl<$Res>
    extends _$CafeInfoParamsCopyWithImpl<$Res, _$CafeInfoParamsImpl>
    implements _$$CafeInfoParamsImplCopyWith<$Res> {
  __$$CafeInfoParamsImplCopyWithImpl(
      _$CafeInfoParamsImpl _value, $Res Function(_$CafeInfoParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CafeInfoParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? address = null,
    Object? city = null,
    Object? postcode = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? categories = null,
    Object? bio = null,
    Object? coffeeOrigin = null,
    Object? coffeeRoast = null,
    Object? coffeeOriginCountry = null,
    Object? speciallityCoffee = null,
    Object? image = freezed,
    Object? cafeTimes = freezed,
  }) {
    return _then(_$CafeInfoParamsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      postcode: null == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeOrigin: null == coffeeOrigin
          ? _value.coffeeOrigin
          : coffeeOrigin // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeRoast: null == coffeeRoast
          ? _value.coffeeRoast
          : coffeeRoast // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeOriginCountry: null == coffeeOriginCountry
          ? _value.coffeeOriginCountry
          : coffeeOriginCountry // ignore: cast_nullable_to_non_nullable
              as String,
      speciallityCoffee: null == speciallityCoffee
          ? _value.speciallityCoffee
          : speciallityCoffee // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      cafeTimes: freezed == cafeTimes
          ? _value._cafeTimes
          : cafeTimes // ignore: cast_nullable_to_non_nullable
              as List<CafeDayTime>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CafeInfoParamsImpl implements _CafeInfoParams {
  const _$CafeInfoParamsImpl(
      {required this.name,
      required this.phone,
      required this.address,
      required this.city,
      required this.postcode,
      required this.latitude,
      required this.longitude,
      required this.categories,
      required this.bio,
      @JsonKey(name: 'coffee_origin') required this.coffeeOrigin,
      @JsonKey(name: 'coffee_roast') required this.coffeeRoast,
      @JsonKey(name: 'coffee_origin_country') required this.coffeeOriginCountry,
      @JsonKey(name: 'speciallity_coffee') required this.speciallityCoffee,
      this.image,
      final List<CafeDayTime>? cafeTimes})
      : _cafeTimes = cafeTimes;

  factory _$CafeInfoParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CafeInfoParamsImplFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String address;
  @override
  final String city;
  @override
  final String postcode;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String categories;
  @override
  final String bio;
  @override
  @JsonKey(name: 'coffee_origin')
  final String coffeeOrigin;
  @override
  @JsonKey(name: 'coffee_roast')
  final String coffeeRoast;
  @override
  @JsonKey(name: 'coffee_origin_country')
  final String coffeeOriginCountry;
  @override
  @JsonKey(name: 'speciallity_coffee')
  final int speciallityCoffee;
  @override
  final String? image;
  final List<CafeDayTime>? _cafeTimes;
  @override
  List<CafeDayTime>? get cafeTimes {
    final value = _cafeTimes;
    if (value == null) return null;
    if (_cafeTimes is EqualUnmodifiableListView) return _cafeTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CafeInfoParams(name: $name, phone: $phone, address: $address, city: $city, postcode: $postcode, latitude: $latitude, longitude: $longitude, categories: $categories, bio: $bio, coffeeOrigin: $coffeeOrigin, coffeeRoast: $coffeeRoast, coffeeOriginCountry: $coffeeOriginCountry, speciallityCoffee: $speciallityCoffee, image: $image, cafeTimes: $cafeTimes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CafeInfoParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.coffeeOrigin, coffeeOrigin) ||
                other.coffeeOrigin == coffeeOrigin) &&
            (identical(other.coffeeRoast, coffeeRoast) ||
                other.coffeeRoast == coffeeRoast) &&
            (identical(other.coffeeOriginCountry, coffeeOriginCountry) ||
                other.coffeeOriginCountry == coffeeOriginCountry) &&
            (identical(other.speciallityCoffee, speciallityCoffee) ||
                other.speciallityCoffee == speciallityCoffee) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._cafeTimes, _cafeTimes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      phone,
      address,
      city,
      postcode,
      latitude,
      longitude,
      categories,
      bio,
      coffeeOrigin,
      coffeeRoast,
      coffeeOriginCountry,
      speciallityCoffee,
      image,
      const DeepCollectionEquality().hash(_cafeTimes));

  /// Create a copy of CafeInfoParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CafeInfoParamsImplCopyWith<_$CafeInfoParamsImpl> get copyWith =>
      __$$CafeInfoParamsImplCopyWithImpl<_$CafeInfoParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CafeInfoParamsImplToJson(
      this,
    );
  }
}

abstract class _CafeInfoParams implements CafeInfoParams {
  const factory _CafeInfoParams(
      {required final String name,
      required final String phone,
      required final String address,
      required final String city,
      required final String postcode,
      required final double latitude,
      required final double longitude,
      required final String categories,
      required final String bio,
      @JsonKey(name: 'coffee_origin') required final String coffeeOrigin,
      @JsonKey(name: 'coffee_roast') required final String coffeeRoast,
      @JsonKey(name: 'coffee_origin_country')
      required final String coffeeOriginCountry,
      @JsonKey(name: 'speciallity_coffee') required final int speciallityCoffee,
      final String? image,
      final List<CafeDayTime>? cafeTimes}) = _$CafeInfoParamsImpl;

  factory _CafeInfoParams.fromJson(Map<String, dynamic> json) =
      _$CafeInfoParamsImpl.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  String get address;
  @override
  String get city;
  @override
  String get postcode;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get categories;
  @override
  String get bio;
  @override
  @JsonKey(name: 'coffee_origin')
  String get coffeeOrigin;
  @override
  @JsonKey(name: 'coffee_roast')
  String get coffeeRoast;
  @override
  @JsonKey(name: 'coffee_origin_country')
  String get coffeeOriginCountry;
  @override
  @JsonKey(name: 'speciallity_coffee')
  int get speciallityCoffee;
  @override
  String? get image;
  @override
  List<CafeDayTime>? get cafeTimes;

  /// Create a copy of CafeInfoParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CafeInfoParamsImplCopyWith<_$CafeInfoParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
