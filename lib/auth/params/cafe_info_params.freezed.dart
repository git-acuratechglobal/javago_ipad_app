// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cafe_info_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CafeInfoParams {
  String get name;
  String get phone;
  String get address;
  String get postcode;
  double get latitude;
  double get longitude;
  String get categories;
  String get bio;
  @JsonKey(name: 'coffee_origin')
  String get coffeeOrigin;
  @JsonKey(name: 'coffee_roast')
  String get coffeeRoast;
  @JsonKey(name: 'coffee_origin_country')
  String get coffeeOriginCountry;
  @JsonKey(name: 'speciallity_coffee')
  int get speciallityCoffee;
  String? get image;
  List<CafeDayTime>? get cafeTimes;

  /// Create a copy of CafeInfoParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CafeInfoParamsCopyWith<CafeInfoParams> get copyWith =>
      _$CafeInfoParamsCopyWithImpl<CafeInfoParams>(
          this as CafeInfoParams, _$identity);

  /// Serializes this CafeInfoParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CafeInfoParams &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
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
            const DeepCollectionEquality().equals(other.cafeTimes, cafeTimes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      phone,
      address,
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
      const DeepCollectionEquality().hash(cafeTimes));

  @override
  String toString() {
    return 'CafeInfoParams(name: $name, phone: $phone, address: $address, postcode: $postcode, latitude: $latitude, longitude: $longitude, categories: $categories, bio: $bio, coffeeOrigin: $coffeeOrigin, coffeeRoast: $coffeeRoast, coffeeOriginCountry: $coffeeOriginCountry, speciallityCoffee: $speciallityCoffee, image: $image, cafeTimes: $cafeTimes)';
  }
}

/// @nodoc
abstract mixin class $CafeInfoParamsCopyWith<$Res> {
  factory $CafeInfoParamsCopyWith(
          CafeInfoParams value, $Res Function(CafeInfoParams) _then) =
      _$CafeInfoParamsCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String phone,
      String address,
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
class _$CafeInfoParamsCopyWithImpl<$Res>
    implements $CafeInfoParamsCopyWith<$Res> {
  _$CafeInfoParamsCopyWithImpl(this._self, this._then);

  final CafeInfoParams _self;
  final $Res Function(CafeInfoParams) _then;

  /// Create a copy of CafeInfoParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? address = null,
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
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      postcode: null == postcode
          ? _self.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeOrigin: null == coffeeOrigin
          ? _self.coffeeOrigin
          : coffeeOrigin // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeRoast: null == coffeeRoast
          ? _self.coffeeRoast
          : coffeeRoast // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeOriginCountry: null == coffeeOriginCountry
          ? _self.coffeeOriginCountry
          : coffeeOriginCountry // ignore: cast_nullable_to_non_nullable
              as String,
      speciallityCoffee: null == speciallityCoffee
          ? _self.speciallityCoffee
          : speciallityCoffee // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      cafeTimes: freezed == cafeTimes
          ? _self.cafeTimes
          : cafeTimes // ignore: cast_nullable_to_non_nullable
              as List<CafeDayTime>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CafeInfoParams implements CafeInfoParams {
  const _CafeInfoParams(
      {required this.name,
      required this.phone,
      required this.address,
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
  factory _CafeInfoParams.fromJson(Map<String, dynamic> json) =>
      _$CafeInfoParamsFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String address;
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

  /// Create a copy of CafeInfoParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CafeInfoParamsCopyWith<_CafeInfoParams> get copyWith =>
      __$CafeInfoParamsCopyWithImpl<_CafeInfoParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CafeInfoParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CafeInfoParams &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
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

  @override
  String toString() {
    return 'CafeInfoParams(name: $name, phone: $phone, address: $address, postcode: $postcode, latitude: $latitude, longitude: $longitude, categories: $categories, bio: $bio, coffeeOrigin: $coffeeOrigin, coffeeRoast: $coffeeRoast, coffeeOriginCountry: $coffeeOriginCountry, speciallityCoffee: $speciallityCoffee, image: $image, cafeTimes: $cafeTimes)';
  }
}

/// @nodoc
abstract mixin class _$CafeInfoParamsCopyWith<$Res>
    implements $CafeInfoParamsCopyWith<$Res> {
  factory _$CafeInfoParamsCopyWith(
          _CafeInfoParams value, $Res Function(_CafeInfoParams) _then) =
      __$CafeInfoParamsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String phone,
      String address,
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
class __$CafeInfoParamsCopyWithImpl<$Res>
    implements _$CafeInfoParamsCopyWith<$Res> {
  __$CafeInfoParamsCopyWithImpl(this._self, this._then);

  final _CafeInfoParams _self;
  final $Res Function(_CafeInfoParams) _then;

  /// Create a copy of CafeInfoParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? address = null,
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
    return _then(_CafeInfoParams(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      postcode: null == postcode
          ? _self.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeOrigin: null == coffeeOrigin
          ? _self.coffeeOrigin
          : coffeeOrigin // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeRoast: null == coffeeRoast
          ? _self.coffeeRoast
          : coffeeRoast // ignore: cast_nullable_to_non_nullable
              as String,
      coffeeOriginCountry: null == coffeeOriginCountry
          ? _self.coffeeOriginCountry
          : coffeeOriginCountry // ignore: cast_nullable_to_non_nullable
              as String,
      speciallityCoffee: null == speciallityCoffee
          ? _self.speciallityCoffee
          : speciallityCoffee // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      cafeTimes: freezed == cafeTimes
          ? _self._cafeTimes
          : cafeTimes // ignore: cast_nullable_to_non_nullable
              as List<CafeDayTime>?,
    ));
  }
}

// dart format on
