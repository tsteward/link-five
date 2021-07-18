// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile_location.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TileLocation> _$tileLocationSerializer =
    new _$TileLocationSerializer();

class _$TileLocationSerializer implements StructuredSerializer<TileLocation> {
  @override
  final Iterable<Type> types = const [TileLocation, _$TileLocation];
  @override
  final String wireName = 'TileLocation';

  @override
  Iterable<Object?> serialize(Serializers serializers, TileLocation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'x',
      serializers.serialize(object.x, specifiedType: const FullType(int)),
      'y',
      serializers.serialize(object.y, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  TileLocation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TileLocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'x':
          result.x = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'y':
          result.y = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$TileLocation extends TileLocation {
  @override
  final int x;
  @override
  final int y;

  factory _$TileLocation([void Function(TileLocationBuilder)? updates]) =>
      (new TileLocationBuilder()..update(updates)).build();

  _$TileLocation._({required this.x, required this.y}) : super._() {
    BuiltValueNullFieldError.checkNotNull(x, 'TileLocation', 'x');
    BuiltValueNullFieldError.checkNotNull(y, 'TileLocation', 'y');
  }

  @override
  TileLocation rebuild(void Function(TileLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TileLocationBuilder toBuilder() => new TileLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TileLocation && x == other.x && y == other.y;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, x.hashCode), y.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TileLocation')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class TileLocationBuilder
    implements Builder<TileLocation, TileLocationBuilder> {
  _$TileLocation? _$v;

  int? _x;
  int? get x => _$this._x;
  set x(int? x) => _$this._x = x;

  int? _y;
  int? get y => _$this._y;
  set y(int? y) => _$this._y = y;

  TileLocationBuilder();

  TileLocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _x = $v.x;
      _y = $v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TileLocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TileLocation;
  }

  @override
  void update(void Function(TileLocationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TileLocation build() {
    final _$result = _$v ??
        new _$TileLocation._(
            x: BuiltValueNullFieldError.checkNotNull(x, 'TileLocation', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(y, 'TileLocation', 'y'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
