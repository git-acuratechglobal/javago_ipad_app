// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getOrderDetailsHash() => r'0ba7148f43011e22bbb3e62fff29819585258aca';

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

/// See also [getOrderDetails].
@ProviderFor(getOrderDetails)
const getOrderDetailsProvider = GetOrderDetailsFamily();

/// See also [getOrderDetails].
class GetOrderDetailsFamily extends Family<AsyncValue<GetOrderDetails>> {
  /// See also [getOrderDetails].
  const GetOrderDetailsFamily();

  /// See also [getOrderDetails].
  GetOrderDetailsProvider call(
    String orderId,
    int isIndividualOrder,
  ) {
    return GetOrderDetailsProvider(
      orderId,
      isIndividualOrder,
    );
  }

  @override
  GetOrderDetailsProvider getProviderOverride(
    covariant GetOrderDetailsProvider provider,
  ) {
    return call(
      provider.orderId,
      provider.isIndividualOrder,
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
  String? get name => r'getOrderDetailsProvider';
}

/// See also [getOrderDetails].
class GetOrderDetailsProvider
    extends AutoDisposeFutureProvider<GetOrderDetails> {
  /// See also [getOrderDetails].
  GetOrderDetailsProvider(
    String orderId,
    int isIndividualOrder,
  ) : this._internal(
          (ref) => getOrderDetails(
            ref as GetOrderDetailsRef,
            orderId,
            isIndividualOrder,
          ),
          from: getOrderDetailsProvider,
          name: r'getOrderDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOrderDetailsHash,
          dependencies: GetOrderDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetOrderDetailsFamily._allTransitiveDependencies,
          orderId: orderId,
          isIndividualOrder: isIndividualOrder,
        );

  GetOrderDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
    required this.isIndividualOrder,
  }) : super.internal();

  final String orderId;
  final int isIndividualOrder;

  @override
  Override overrideWith(
    FutureOr<GetOrderDetails> Function(GetOrderDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOrderDetailsProvider._internal(
        (ref) => create(ref as GetOrderDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
        isIndividualOrder: isIndividualOrder,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GetOrderDetails> createElement() {
    return _GetOrderDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrderDetailsProvider &&
        other.orderId == orderId &&
        other.isIndividualOrder == isIndividualOrder;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);
    hash = _SystemHash.combine(hash, isIndividualOrder.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetOrderDetailsRef on AutoDisposeFutureProviderRef<GetOrderDetails> {
  /// The parameter `orderId` of this provider.
  String get orderId;

  /// The parameter `isIndividualOrder` of this provider.
  int get isIndividualOrder;
}

class _GetOrderDetailsProviderElement
    extends AutoDisposeFutureProviderElement<GetOrderDetails>
    with GetOrderDetailsRef {
  _GetOrderDetailsProviderElement(super.provider);

  @override
  String get orderId => (origin as GetOrderDetailsProvider).orderId;
  @override
  int get isIndividualOrder =>
      (origin as GetOrderDetailsProvider).isIndividualOrder;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
