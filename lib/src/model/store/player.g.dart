// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Player> _$playerSerializer = new _$PlayerSerializer();

class _$PlayerSerializer implements StructuredSerializer<Player> {
  @override
  final Iterable<Type> types = const [Player, _$Player];
  @override
  final String wireName = 'Player';

  @override
  Iterable<Object?> serialize(Serializers serializers, Player object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color,
          specifiedType: const FullType(PlayerColor)),
      'isReady',
      serializers.serialize(object.isReady,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Player deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlayerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(PlayerColor))! as PlayerColor;
          break;
        case 'isReady':
          result.isReady = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Player extends Player {
  @override
  final String name;
  @override
  final PlayerColor color;
  @override
  final bool isReady;

  factory _$Player([void Function(PlayerBuilder)? updates]) =>
      (new PlayerBuilder()..update(updates))._build();

  _$Player._({required this.name, required this.color, required this.isReady})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Player', 'name');
    BuiltValueNullFieldError.checkNotNull(color, r'Player', 'color');
    BuiltValueNullFieldError.checkNotNull(isReady, r'Player', 'isReady');
  }

  @override
  Player rebuild(void Function(PlayerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlayerBuilder toBuilder() => new PlayerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Player &&
        name == other.name &&
        color == other.color &&
        isReady == other.isReady;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, isReady.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Player')
          ..add('name', name)
          ..add('color', color)
          ..add('isReady', isReady))
        .toString();
  }
}

class PlayerBuilder implements Builder<Player, PlayerBuilder> {
  _$Player? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  PlayerColor? _color;
  PlayerColor? get color => _$this._color;
  set color(PlayerColor? color) => _$this._color = color;

  bool? _isReady;
  bool? get isReady => _$this._isReady;
  set isReady(bool? isReady) => _$this._isReady = isReady;

  PlayerBuilder();

  PlayerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _color = $v.color;
      _isReady = $v.isReady;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Player other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Player;
  }

  @override
  void update(void Function(PlayerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Player build() => _build();

  _$Player _build() {
    final _$result = _$v ??
        new _$Player._(
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'Player', 'name'),
            color: BuiltValueNullFieldError.checkNotNull(
                color, r'Player', 'color'),
            isReady: BuiltValueNullFieldError.checkNotNull(
                isReady, r'Player', 'isReady'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
