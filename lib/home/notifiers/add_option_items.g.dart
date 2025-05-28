// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_option_items.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$optionalItemHash() => r'1606f08c9c16d2786de88b5ff56951ddab9ea58e';

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

/// See also [OptionalItem].
@ProviderFor(OptionalItem)
const optionalItemProvider = OptionalItemFamily();

/// See also [OptionalItem].
class OptionalItemFamily extends Family<AsyncValue<OptionalItems>> {
  /// See also [OptionalItem].
  const OptionalItemFamily();

  /// See also [OptionalItem].
  OptionalItemProvider call(
    int id,
  ) {
    return OptionalItemProvider(
      id,
    );
  }

  @override
  OptionalItemProvider getProviderOverride(
    covariant OptionalItemProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'optionalItemProvider';
}

/// See also [OptionalItem].
class OptionalItemProvider extends AutoDisposeFutureProvider<OptionalItems> {
  /// See also [OptionalItem].
  OptionalItemProvider(
    int id,
  ) : this._internal(
          (ref) => OptionalItem(
            ref as OptionalItemRef,
            id,
          ),
          from: optionalItemProvider,
          name: r'optionalItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$optionalItemHash,
          dependencies: OptionalItemFamily._dependencies,
          allTransitiveDependencies:
              OptionalItemFamily._allTransitiveDependencies,
          id: id,
        );

  OptionalItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<OptionalItems> Function(OptionalItemRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OptionalItemProvider._internal(
        (ref) => create(ref as OptionalItemRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OptionalItems> createElement() {
    return _OptionalItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OptionalItemProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OptionalItemRef on AutoDisposeFutureProviderRef<OptionalItems> {
  /// The parameter `id` of this provider.
  int get id;
}

class _OptionalItemProviderElement
    extends AutoDisposeFutureProviderElement<OptionalItems>
    with OptionalItemRef {
  _OptionalItemProviderElement(super.provider);

  @override
  int get id => (origin as OptionalItemProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
