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
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'x':
          result.x = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'y':
          result.y = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
      (new TileLocationBuilder()..update(updates))._build();

  _$TileLocation._({required this.x, required this.y}) : super._() {
    BuiltValueNullFieldError.checkNotNull(x, r'TileLocation', 'x');
    BuiltValueNullFieldError.checkNotNull(y, r'TileLocation', 'y');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TileLocation')
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
  TileLocation build() => _build();

  _$TileLocation _build() {
    final _$result = _$v ??
        new _$TileLocation._(
            x: BuiltValueNullFieldError.checkNotNull(x, r'TileLocation', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(y, r'TileLocation', 'y'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
