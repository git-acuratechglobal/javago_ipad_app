// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MenuItemState {
  String? get response => throw _privateConstructorUsedError;
  MenuItemEvent get menuEvent => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemStateCopyWith<MenuItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemStateCopyWith<$Res> {
  factory $MenuItemStateCopyWith(
          MenuItemState value, $Res Function(MenuItemState) then) =
      _$MenuItemStateCopyWithImpl<$Res, MenuItemState>;
  @useResult
  $Res call({String? response, MenuItemEvent menuEvent});
}

/// @nodoc
class _$MenuItemStateCopyWithImpl<$Res, $Val extends MenuItemState>
    implements $MenuItemStateCopyWith<$Res> {
  _$MenuItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? menuEvent = null,
  }) {
    return _then(_value.copyWith(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      menuEvent: null == menuEvent
          ? _value.menuEvent
          : menuEvent // ignore: cast_nullable_to_non_nullable
              as MenuItemEvent,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuItemStateImplCopyWith<$Res>
    implements $MenuItemStateCopyWith<$Res> {
  factory _$$MenuItemStateImplCopyWith(
          _$MenuItemStateImpl value, $Res Function(_$MenuItemStateImpl) then) =
      __$$MenuItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? response, MenuItemEvent menuEvent});
}

/// @nodoc
class __$$MenuItemStateImplCopyWithImpl<$Res>
    extends _$MenuItemStateCopyWithImpl<$Res, _$MenuItemStateImpl>
    implements _$$MenuItemStateImplCopyWith<$Res> {
  __$$MenuItemStateImplCopyWithImpl(
      _$MenuItemStateImpl _value, $Res Function(_$MenuItemStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? menuEvent = null,
  }) {
    return _then(_$MenuItemStateImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      menuEvent: null == menuEvent
          ? _value.menuEvent
          : menuEvent // ignore: cast_nullable_to_non_nullable
              as MenuItemEvent,
    ));
  }
}

/// @nodoc

class _$MenuItemStateImpl implements _MenuItemState {
  const _$MenuItemStateImpl({this.response, required this.menuEvent});

  @override
  final String? response;
  @override
  final MenuItemEvent menuEvent;

  @override
  String toString() {
    return 'MenuItemState(response: $response, menuEvent: $menuEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemStateImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.menuEvent, menuEvent) ||
                other.menuEvent == menuEvent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, menuEvent);

  /// Create a copy of MenuItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemStateImplCopyWith<_$MenuItemStateImpl> get copyWith =>
      __$$MenuItemStateImplCopyWithImpl<_$MenuItemStateImpl>(this, _$identity);
}

abstract class _MenuItemState implements MenuItemState {
  const factory _MenuItemState(
      {final String? response,
      required final MenuItemEvent menuEvent}) = _$MenuItemStateImpl;

  @override
  String? get response;
  @override
  MenuItemEvent get menuEvent;

  /// Create a copy of MenuItemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemStateImplCopyWith<_$MenuItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
