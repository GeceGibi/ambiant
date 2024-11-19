// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chain _$ChainFromJson(Map<String, dynamic> json) {
  return _Chain.fromJson(json);
}

/// @nodoc
mixin _$Chain {
  String get name => throw _privateConstructorUsedError;
  List<ChainRing> get chain => throw _privateConstructorUsedError;
  bool get faded => throw _privateConstructorUsedError;

  /// Serializes this Chain to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChainCopyWith<Chain> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainCopyWith<$Res> {
  factory $ChainCopyWith(Chain value, $Res Function(Chain) then) =
      _$ChainCopyWithImpl<$Res, Chain>;
  @useResult
  $Res call({String name, List<ChainRing> chain, bool faded});
}

/// @nodoc
class _$ChainCopyWithImpl<$Res, $Val extends Chain>
    implements $ChainCopyWith<$Res> {
  _$ChainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? chain = null,
    Object? faded = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chain: null == chain
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as List<ChainRing>,
      faded: null == faded
          ? _value.faded
          : faded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChainImplCopyWith<$Res> implements $ChainCopyWith<$Res> {
  factory _$$ChainImplCopyWith(
          _$ChainImpl value, $Res Function(_$ChainImpl) then) =
      __$$ChainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<ChainRing> chain, bool faded});
}

/// @nodoc
class __$$ChainImplCopyWithImpl<$Res>
    extends _$ChainCopyWithImpl<$Res, _$ChainImpl>
    implements _$$ChainImplCopyWith<$Res> {
  __$$ChainImplCopyWithImpl(
      _$ChainImpl _value, $Res Function(_$ChainImpl) _then)
      : super(_value, _then);

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? chain = null,
    Object? faded = null,
  }) {
    return _then(_$ChainImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chain: null == chain
          ? _value._chain
          : chain // ignore: cast_nullable_to_non_nullable
              as List<ChainRing>,
      faded: null == faded
          ? _value.faded
          : faded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChainImpl extends _Chain {
  const _$ChainImpl(
      {required this.name,
      required final List<ChainRing> chain,
      this.faded = false})
      : _chain = chain,
        super._();

  factory _$ChainImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChainImplFromJson(json);

  @override
  final String name;
  final List<ChainRing> _chain;
  @override
  List<ChainRing> get chain {
    if (_chain is EqualUnmodifiableListView) return _chain;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chain);
  }

  @override
  @JsonKey()
  final bool faded;

  @override
  String toString() {
    return 'Chain(name: $name, chain: $chain, faded: $faded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._chain, _chain) &&
            (identical(other.faded, faded) || other.faded == faded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_chain), faded);

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainImplCopyWith<_$ChainImpl> get copyWith =>
      __$$ChainImplCopyWithImpl<_$ChainImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChainImplToJson(
      this,
    );
  }
}

abstract class _Chain extends Chain {
  const factory _Chain(
      {required final String name,
      required final List<ChainRing> chain,
      final bool faded}) = _$ChainImpl;
  const _Chain._() : super._();

  factory _Chain.fromJson(Map<String, dynamic> json) = _$ChainImpl.fromJson;

  @override
  String get name;
  @override
  List<ChainRing> get chain;
  @override
  bool get faded;

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChainImplCopyWith<_$ChainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChainRing _$ChainRingFromJson(Map<String, dynamic> json) {
  return _ChainRing.fromJson(json);
}

/// @nodoc
mixin _$ChainRing {
  Duration get duration => throw _privateConstructorUsedError;
  @JsonKey(toJson: _colorToJson, fromJson: _colorFromJson)
  Color get color => throw _privateConstructorUsedError;

  /// Serializes this ChainRing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChainRing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChainRingCopyWith<ChainRing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainRingCopyWith<$Res> {
  factory $ChainRingCopyWith(ChainRing value, $Res Function(ChainRing) then) =
      _$ChainRingCopyWithImpl<$Res, ChainRing>;
  @useResult
  $Res call(
      {Duration duration,
      @JsonKey(toJson: _colorToJson, fromJson: _colorFromJson) Color color});
}

/// @nodoc
class _$ChainRingCopyWithImpl<$Res, $Val extends ChainRing>
    implements $ChainRingCopyWith<$Res> {
  _$ChainRingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChainRing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChainRingImplCopyWith<$Res>
    implements $ChainRingCopyWith<$Res> {
  factory _$$ChainRingImplCopyWith(
          _$ChainRingImpl value, $Res Function(_$ChainRingImpl) then) =
      __$$ChainRingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration duration,
      @JsonKey(toJson: _colorToJson, fromJson: _colorFromJson) Color color});
}

/// @nodoc
class __$$ChainRingImplCopyWithImpl<$Res>
    extends _$ChainRingCopyWithImpl<$Res, _$ChainRingImpl>
    implements _$$ChainRingImplCopyWith<$Res> {
  __$$ChainRingImplCopyWithImpl(
      _$ChainRingImpl _value, $Res Function(_$ChainRingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChainRing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? color = null,
  }) {
    return _then(_$ChainRingImpl(
      null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChainRingImpl implements _ChainRing {
  const _$ChainRingImpl(this.duration,
      @JsonKey(toJson: _colorToJson, fromJson: _colorFromJson) this.color);

  factory _$ChainRingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChainRingImplFromJson(json);

  @override
  final Duration duration;
  @override
  @JsonKey(toJson: _colorToJson, fromJson: _colorFromJson)
  final Color color;

  @override
  String toString() {
    return 'ChainRing(duration: $duration, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainRingImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, duration, color);

  /// Create a copy of ChainRing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainRingImplCopyWith<_$ChainRingImpl> get copyWith =>
      __$$ChainRingImplCopyWithImpl<_$ChainRingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChainRingImplToJson(
      this,
    );
  }
}

abstract class _ChainRing implements ChainRing {
  const factory _ChainRing(
      final Duration duration,
      @JsonKey(toJson: _colorToJson, fromJson: _colorFromJson)
      final Color color) = _$ChainRingImpl;

  factory _ChainRing.fromJson(Map<String, dynamic> json) =
      _$ChainRingImpl.fromJson;

  @override
  Duration get duration;
  @override
  @JsonKey(toJson: _colorToJson, fromJson: _colorFromJson)
  Color get color;

  /// Create a copy of ChainRing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChainRingImplCopyWith<_$ChainRingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
