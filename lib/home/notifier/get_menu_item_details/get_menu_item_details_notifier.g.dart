// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_menu_item_details_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMenuItemsDetailsHash() =>
    r'802b6d2dd0082d8e532e8838f0aa02565aff66fe';

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

/// See also [getMenuItemsDetails].
@ProviderFor(getMenuItemsDetails)
const getMenuItemsDetailsProvider = GetMenuItemsDetailsFamily();

/// See also [getMenuItemsDetails].
class GetMenuItemsDetailsFamily extends Family<AsyncValue<MenuItemDetails?>> {
  /// See also [getMenuItemsDetails].
  const GetMenuItemsDetailsFamily();

  /// See also [getMenuItemsDetails].
  GetMenuItemsDetailsProvider call({
    int? itemId,
  }) {
    return GetMenuItemsDetailsProvider(
      itemId: itemId,
    );
  }

  @override
  GetMenuItemsDetailsProvider getProviderOverride(
    covariant GetMenuItemsDetailsProvider provider,
  ) {
    return call(
      itemId: provider.itemId,
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
  String? get name => r'getMenuItemsDetailsProvider';
}

/// See also [getMenuItemsDetails].
class GetMenuItemsDetailsProvider
    extends AutoDisposeFutureProvider<MenuItemDetails?> {
  /// See also [getMenuItemsDetails].
  GetMenuItemsDetailsProvider({
    int? itemId,
  }) : this._internal(
          (ref) => getMenuItemsDetails(
            ref as GetMenuItemsDetailsRef,
            itemId: itemId,
          ),
          from: getMenuItemsDetailsProvider,
          name: r'getMenuItemsDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMenuItemsDetailsHash,
          dependencies: GetMenuItemsDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetMenuItemsDetailsFamily._allTransitiveDependencies,
          itemId: itemId,
        );

  GetMenuItemsDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemId,
  }) : super.internal();

  final int? itemId;

  @override
  Override overrideWith(
    FutureOr<MenuItemDetails?> Function(GetMenuItemsDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMenuItemsDetailsProvider._internal(
        (ref) => create(ref as GetMenuItemsDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        itemId: itemId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MenuItemDetails?> createElement() {
    return _GetMenuItemsDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMenuItemsDetailsProvider && other.itemId == itemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMenuItemsDetailsRef on AutoDisposeFutureProviderRef<MenuItemDetails?> {
  /// The parameter `itemId` of this provider.
  int? get itemId;
}

class _GetMenuItemsDetailsProviderElement
    extends AutoDisposeFutureProviderElement<MenuItemDetails?>
    with GetMenuItemsDetailsRef {
  _GetMenuItemsDetailsProviderElement(super.provider);

  @override
  int? get itemId => (origin as GetMenuItemsDetailsProvider).itemId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
