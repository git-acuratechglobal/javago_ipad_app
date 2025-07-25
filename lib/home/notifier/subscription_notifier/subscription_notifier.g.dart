// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCafeSubscriptionHash() =>
    r'9f9418c49df5a49b962c6243d7189dbd9e88b06f';

/// See also [getCafeSubscription].
@ProviderFor(getCafeSubscription)
final getCafeSubscriptionProvider =
    AutoDisposeFutureProvider<SubscriptionModel?>.internal(
  getCafeSubscription,
  name: r'getCafeSubscriptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCafeSubscriptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCafeSubscriptionRef
    = AutoDisposeFutureProviderRef<SubscriptionModel?>;
String _$getPromoCodeDetailsHash() =>
    r'1f8b3a93139a04713fa4726542a6f3eba533da3f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getPromoCodeDetails].
@ProviderFor(getPromoCodeDetails)
const getPromoCodeDetailsProvider = GetPromoCodeDetailsFamily();

/// See also [getPromoCodeDetails].
class GetPromoCodeDetailsFamily extends Family<AsyncValue<PromoCodeModel>> {
  /// See also [getPromoCodeDetails].
  const GetPromoCodeDetailsFamily();

  /// See also [getPromoCodeDetails].
  GetPromoCodeDetailsProvider call({
    required String promoCode,
  }) {
    return GetPromoCodeDetailsProvider(
      promoCode: promoCode,
    );
  }

  @override
  GetPromoCodeDetailsProvider getProviderOverride(
    covariant GetPromoCodeDetailsProvider provider,
  ) {
    return call(
      promoCode: provider.promoCode,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPromoCodeDetailsProvider';
}

/// See also [getPromoCodeDetails].
class GetPromoCodeDetailsProvider
    extends AutoDisposeFutureProvider<PromoCodeModel> {
  /// See also [getPromoCodeDetails].
  GetPromoCodeDetailsProvider({
    required String promoCode,
  }) : this._internal(
          (ref) => getPromoCodeDetails(
            ref as GetPromoCodeDetailsRef,
            promoCode: promoCode,
          ),
          from: getPromoCodeDetailsProvider,
          name: r'getPromoCodeDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPromoCodeDetailsHash,
          dependencies: GetPromoCodeDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetPromoCodeDetailsFamily._allTransitiveDependencies,
          promoCode: promoCode,
        );

  GetPromoCodeDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.promoCode,
  }) : super.internal();

  final String promoCode;

  @override
  Override overrideWith(
    FutureOr<PromoCodeModel> Function(GetPromoCodeDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPromoCodeDetailsProvider._internal(
        (ref) => create(ref as GetPromoCodeDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        promoCode: promoCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PromoCodeModel> createElement() {
    return _GetPromoCodeDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPromoCodeDetailsProvider && other.promoCode == promoCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, promoCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetPromoCodeDetailsRef on AutoDisposeFutureProviderRef<PromoCodeModel> {
  /// The parameter `promoCode` of this provider.
  String get promoCode;
}

class _GetPromoCodeDetailsProviderElement
    extends AutoDisposeFutureProviderElement<PromoCodeModel>
    with GetPromoCodeDetailsRef {
  _GetPromoCodeDetailsProviderElement(super.provider);

  @override
  String get promoCode => (origin as GetPromoCodeDetailsProvider).promoCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
