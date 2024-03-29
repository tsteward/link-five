// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Tile> _$tileSerializer = new _$TileSerializer();

class _$TileSerializer implements StructuredSerializer<Tile> {
  @override
  final Iterable<Type> types = const [Tile, _$Tile];
  @override
  final String wireName = 'Tile';

  @override
  Iterable<Object?> serialize(Serializers serializers, Tile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(TileLocation)),
      'color',
      serializers.serialize(object.color,
          specifiedType: const FullType(PlayerColor)),
    ];

    return result;
  }

  @override
  Tile deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'location':
          result.location.replace(serializers.deserialize(value,
              specifiedType: const FullType(TileLocation))! as TileLocation);
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(PlayerColor))! as PlayerColor;
          break;
      }
    }

    return result.build();
  }
}

class _$Tile extends Tile {
  @override
  final TileLocation location;
  @override
  final PlayerColor color;

  factory _$Tile([void Function(TileBuilder)? updates]) =>
      (new TileBuilder()..update(updates))._build();

  _$Tile._({required this.location, required this.color}) : super._() {
    BuiltValueNullFieldError.checkNotNull(location, r'Tile', 'location');
    BuiltValueNullFieldError.checkNotNull(color, r'Tile', 'color');
  }

  @override
  Tile rebuild(void Function(TileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TileBuilder toBuilder() => new TileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tile && location == other.location && color == other.color;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Tile')
          ..add('location', location)
          ..add('color', color))
        .toString();
  }
}

class TileBuilder implements Builder<Tile, TileBuilder> {
  _$Tile? _$v;

  TileLocationBuilder? _location;
  TileLocationBuilder get location =>
      _$this._location ??= new TileLocationBuilder();
  set location(TileLocationBuilder? location) => _$this._location = location;

  PlayerColor? _color;
  PlayerColor? get color => _$this._color;
  set color(PlayerColor? color) => _$this._color = color;

  TileBuilder();

  TileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location.toBuilder();
      _color = $v.color;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Tile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Tile;
  }

  @override
  void update(void Function(TileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Tile build() => _build();

  _$Tile _build() {
    _$Tile _$result;
    try {
      _$result = _$v ??
          new _$Tile._(
              location: location.build(),
              color: BuiltValueNullFieldError.checkNotNull(
                  color, r'Tile', 'color'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Tile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
