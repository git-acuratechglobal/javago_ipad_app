// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_item.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deleteItemHash() => r'69fa56cada5467f11d4e9cbc235e565e281db736';

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

/// See also [deleteItem].
@ProviderFor(deleteItem)
const deleteItemProvider = DeleteItemFamily();

/// See also [deleteItem].
class DeleteItemFamily extends Family<AsyncValue<String>> {
  /// See also [deleteItem].
  const DeleteItemFamily();

  /// See also [deleteItem].
  DeleteItemProvider call(
    int id,
  ) {
    return DeleteItemProvider(
      id,
    );
  }

  @override
  DeleteItemProvider getProviderOverride(
    covariant DeleteItemProvider provider,
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
  String? get name => r'deleteItemProvider';
}

/// See also [deleteItem].
class DeleteItemProvider extends AutoDisposeFutureProvider<String> {
  /// See also [deleteItem].
  DeleteItemProvider(
    int id,
  ) : this._internal(
          (ref) => deleteItem(
            ref as DeleteItemRef,
            id,
          ),
          from: deleteItemProvider,
          name: r'deleteItemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteItemHash,
          dependencies: DeleteItemFamily._dependencies,
          allTransitiveDependencies:
              DeleteItemFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteItemProvider._internal(
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
    FutureOr<String> Function(DeleteItemRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteItemProvider._internal(
        (ref) => create(ref as DeleteItemRef),
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
  AutoDisposeFutureProviderElement<String> createElement() {
    return _DeleteItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteItemProvider && other.id == id;
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
mixin DeleteItemRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteItemProviderElement
    extends AutoDisposeFutureProviderElement<String> with DeleteItemRef {
  _DeleteItemProviderElement(super.provider);

  @override
  int get id => (origin as DeleteItemProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
