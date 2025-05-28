// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_addon_item_status.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateAddonItemStatusHash() =>
    r'54420ae00fac1530e1a5faee520bfb8a280cc18a';

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

/// See also [updateAddonItemStatus].
@ProviderFor(updateAddonItemStatus)
const updateAddonItemStatusProvider = UpdateAddonItemStatusFamily();

/// See also [updateAddonItemStatus].
class UpdateAddonItemStatusFamily extends Family<AsyncValue<String>> {
  /// See also [updateAddonItemStatus].
  const UpdateAddonItemStatusFamily();

  /// See also [updateAddonItemStatus].
  UpdateAddonItemStatusProvider call(
    int id,
    int status,
  ) {
    return UpdateAddonItemStatusProvider(
      id,
      status,
    );
  }

  @override
  UpdateAddonItemStatusProvider getProviderOverride(
    covariant UpdateAddonItemStatusProvider provider,
  ) {
    return call(
      provider.id,
      provider.status,
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
  String? get name => r'updateAddonItemStatusProvider';
}

/// See also [updateAddonItemStatus].
class UpdateAddonItemStatusProvider extends AutoDisposeFutureProvider<String> {
  /// See also [updateAddonItemStatus].
  UpdateAddonItemStatusProvider(
    int id,
    int status,
  ) : this._internal(
          (ref) => updateAddonItemStatus(
            ref as UpdateAddonItemStatusRef,
            id,
            status,
          ),
          from: updateAddonItemStatusProvider,
          name: r'updateAddonItemStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateAddonItemStatusHash,
          dependencies: UpdateAddonItemStatusFamily._dependencies,
          allTransitiveDependencies:
              UpdateAddonItemStatusFamily._allTransitiveDependencies,
          id: id,
          status: status,
        );

  UpdateAddonItemStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.status,
  }) : super.internal();

  final int id;
  final int status;

  @override
  Override overrideWith(
    FutureOr<String> Function(UpdateAddonItemStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateAddonItemStatusProvider._internal(
        (ref) => create(ref as UpdateAddonItemStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UpdateAddonItemStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateAddonItemStatusProvider &&
        other.id == id &&
        other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateAddonItemStatusRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `status` of this provider.
  int get status;
}

class _UpdateAddonItemStatusProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with UpdateAddonItemStatusRef {
  _UpdateAddonItemStatusProviderElement(super.provider);

  @override
  int get id => (origin as UpdateAddonItemStatusProvider).id;
  @override
  int get status => (origin as UpdateAddonItemStatusProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
