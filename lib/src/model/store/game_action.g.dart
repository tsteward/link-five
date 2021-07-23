// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_action.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GameActionType _$placeTileAction =
    const GameActionType._('placeTileAction');

GameActionType _$stValueOf(String name) {
  switch (name) {
    case 'placeTileAction':
      return _$placeTileAction;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GameActionType> _$stValues =
    new BuiltSet<GameActionType>(const <GameActionType>[
  _$placeTileAction,
]);

Serializer<GameAction> _$gameActionSerializer = new _$GameActionSerializer();
Serializer<GameActionType> _$gameActionTypeSerializer =
    new _$GameActionTypeSerializer();
Serializer<PlaceTileAction> _$placeTileActionSerializer =
    new _$PlaceTileActionSerializer();

class _$GameActionSerializer implements StructuredSerializer<GameAction> {
  @override
  final Iterable<Type> types = const [GameAction, _$GameAction];
  @override
  final String wireName = 'GameAction';

  @override
  Iterable<Object?> serialize(Serializers serializers, GameAction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'basedOn',
      serializers.serialize(object.basedOn,
          specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(GameActionType)),
    ];
    Object? value;
    value = object.placeTileAction;
    if (value != null) {
      result
        ..add('placeTileAction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PlaceTileAction)));
    }
    return result;
  }

  @override
  GameAction deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GameActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'basedOn':
          result.basedOn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(GameActionType)) as GameActionType;
          break;
        case 'placeTileAction':
          result.placeTileAction.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PlaceTileAction))!
              as PlaceTileAction);
          break;
      }
    }

    return result.build();
  }
}

class _$GameActionTypeSerializer
    implements PrimitiveSerializer<GameActionType> {
  @override
  final Iterable<Type> types = const <Type>[GameActionType];
  @override
  final String wireName = 'GameActionType';

  @override
  Object serialize(Serializers serializers, GameActionType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GameActionType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GameActionType.valueOf(serialized as String);
}

class _$PlaceTileActionSerializer
    implements StructuredSerializer<PlaceTileAction> {
  @override
  final Iterable<Type> types = const [PlaceTileAction, _$PlaceTileAction];
  @override
  final String wireName = 'PlaceTileAction';

  @override
  Iterable<Object?> serialize(Serializers serializers, PlaceTileAction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(TileLocation)),
    ];

    return result;
  }

  @override
  PlaceTileAction deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlaceTileActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'location':
          result.location.replace(serializers.deserialize(value,
              specifiedType: const FullType(TileLocation))! as TileLocation);
          break;
      }
    }

    return result.build();
  }
}

class _$GameAction extends GameAction {
  @override
  final String basedOn;
  @override
  final String userId;
  @override
  final GameActionType type;
  @override
  final PlaceTileAction? placeTileAction;

  factory _$GameAction([void Function(GameActionBuilder)? updates]) =>
      (new GameActionBuilder()..update(updates)).build();

  _$GameAction._(
      {required this.basedOn,
      required this.userId,
      required this.type,
      this.placeTileAction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(basedOn, 'GameAction', 'basedOn');
    BuiltValueNullFieldError.checkNotNull(userId, 'GameAction', 'userId');
    BuiltValueNullFieldError.checkNotNull(type, 'GameAction', 'type');
  }

  @override
  GameAction rebuild(void Function(GameActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameActionBuilder toBuilder() => new GameActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameAction &&
        basedOn == other.basedOn &&
        userId == other.userId &&
        type == other.type &&
        placeTileAction == other.placeTileAction;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, basedOn.hashCode), userId.hashCode), type.hashCode),
        placeTileAction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameAction')
          ..add('basedOn', basedOn)
          ..add('userId', userId)
          ..add('type', type)
          ..add('placeTileAction', placeTileAction))
        .toString();
  }
}

class GameActionBuilder implements Builder<GameAction, GameActionBuilder> {
  _$GameAction? _$v;

  String? _basedOn;
  String? get basedOn => _$this._basedOn;
  set basedOn(String? basedOn) => _$this._basedOn = basedOn;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  GameActionType? _type;
  GameActionType? get type => _$this._type;
  set type(GameActionType? type) => _$this._type = type;

  PlaceTileActionBuilder? _placeTileAction;
  PlaceTileActionBuilder get placeTileAction =>
      _$this._placeTileAction ??= new PlaceTileActionBuilder();
  set placeTileAction(PlaceTileActionBuilder? placeTileAction) =>
      _$this._placeTileAction = placeTileAction;

  GameActionBuilder();

  GameActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _basedOn = $v.basedOn;
      _userId = $v.userId;
      _type = $v.type;
      _placeTileAction = $v.placeTileAction?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameAction;
  }

  @override
  void update(void Function(GameActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GameAction build() {
    _$GameAction _$result;
    try {
      _$result = _$v ??
          new _$GameAction._(
              basedOn: BuiltValueNullFieldError.checkNotNull(
                  basedOn, 'GameAction', 'basedOn'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, 'GameAction', 'userId'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, 'GameAction', 'type'),
              placeTileAction: _placeTileAction?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'placeTileAction';
        _placeTileAction?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GameAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PlaceTileAction extends PlaceTileAction {
  @override
  final TileLocation location;

  factory _$PlaceTileAction([void Function(PlaceTileActionBuilder)? updates]) =>
      (new PlaceTileActionBuilder()..update(updates)).build();

  _$PlaceTileAction._({required this.location}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        location, 'PlaceTileAction', 'location');
  }

  @override
  PlaceTileAction rebuild(void Function(PlaceTileActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlaceTileActionBuilder toBuilder() =>
      new PlaceTileActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlaceTileAction && location == other.location;
  }

  @override
  int get hashCode {
    return $jf($jc(0, location.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PlaceTileAction')
          ..add('location', location))
        .toString();
  }
}

class PlaceTileActionBuilder
    implements Builder<PlaceTileAction, PlaceTileActionBuilder> {
  _$PlaceTileAction? _$v;

  TileLocationBuilder? _location;
  TileLocationBuilder get location =>
      _$this._location ??= new TileLocationBuilder();
  set location(TileLocationBuilder? location) => _$this._location = location;

  PlaceTileActionBuilder();

  PlaceTileActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlaceTileAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlaceTileAction;
  }

  @override
  void update(void Function(PlaceTileActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PlaceTileAction build() {
    _$PlaceTileAction _$result;
    try {
      _$result = _$v ?? new _$PlaceTileAction._(location: location.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PlaceTileAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
