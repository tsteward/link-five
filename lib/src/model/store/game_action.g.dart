// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_action.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GameActionType _$placeTileAction =
    const GameActionType._('placeTileAction');
const GameActionType _$moveTileAction =
    const GameActionType._('moveTileAction');

GameActionType _$stValueOf(String name) {
  switch (name) {
    case 'placeTileAction':
      return _$placeTileAction;
    case 'moveTileAction':
      return _$moveTileAction;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GameActionType> _$stValues =
    new BuiltSet<GameActionType>(const <GameActionType>[
  _$placeTileAction,
  _$moveTileAction,
]);

Serializer<GameAction> _$gameActionSerializer = new _$GameActionSerializer();
Serializer<GameActionType> _$gameActionTypeSerializer =
    new _$GameActionTypeSerializer();
Serializer<PlaceTileAction> _$placeTileActionSerializer =
    new _$PlaceTileActionSerializer();
Serializer<MoveTileAction> _$moveTileActionSerializer =
    new _$MoveTileActionSerializer();

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
    value = object.moveTileAction;
    if (value != null) {
      result
        ..add('moveTileAction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(MoveTileAction)));
    }
    return result;
  }

  @override
  GameAction deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GameActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'basedOn':
          result.basedOn = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(GameActionType))! as GameActionType;
          break;
        case 'placeTileAction':
          result.placeTileAction.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PlaceTileAction))!
              as PlaceTileAction);
          break;
        case 'moveTileAction':
          result.moveTileAction.replace(serializers.deserialize(value,
                  specifiedType: const FullType(MoveTileAction))!
              as MoveTileAction);
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
      final key = iterator.current! as String;
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

class _$MoveTileActionSerializer
    implements StructuredSerializer<MoveTileAction> {
  @override
  final Iterable<Type> types = const [MoveTileAction, _$MoveTileAction];
  @override
  final String wireName = 'MoveTileAction';

  @override
  Iterable<Object?> serialize(Serializers serializers, MoveTileAction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'sourceLocation',
      serializers.serialize(object.sourceLocation,
          specifiedType: const FullType(TileLocation)),
      'destinationLocation',
      serializers.serialize(object.destinationLocation,
          specifiedType: const FullType(TileLocation)),
    ];

    return result;
  }

  @override
  MoveTileAction deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoveTileActionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sourceLocation':
          result.sourceLocation.replace(serializers.deserialize(value,
              specifiedType: const FullType(TileLocation))! as TileLocation);
          break;
        case 'destinationLocation':
          result.destinationLocation.replace(serializers.deserialize(value,
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
  @override
  final MoveTileAction? moveTileAction;

  factory _$GameAction([void Function(GameActionBuilder)? updates]) =>
      (new GameActionBuilder()..update(updates))._build();

  _$GameAction._(
      {required this.basedOn,
      required this.userId,
      required this.type,
      this.placeTileAction,
      this.moveTileAction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(basedOn, r'GameAction', 'basedOn');
    BuiltValueNullFieldError.checkNotNull(userId, r'GameAction', 'userId');
    BuiltValueNullFieldError.checkNotNull(type, r'GameAction', 'type');
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
        placeTileAction == other.placeTileAction &&
        moveTileAction == other.moveTileAction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, basedOn.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, placeTileAction.hashCode);
    _$hash = $jc(_$hash, moveTileAction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GameAction')
          ..add('basedOn', basedOn)
          ..add('userId', userId)
          ..add('type', type)
          ..add('placeTileAction', placeTileAction)
          ..add('moveTileAction', moveTileAction))
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

  MoveTileActionBuilder? _moveTileAction;
  MoveTileActionBuilder get moveTileAction =>
      _$this._moveTileAction ??= new MoveTileActionBuilder();
  set moveTileAction(MoveTileActionBuilder? moveTileAction) =>
      _$this._moveTileAction = moveTileAction;

  GameActionBuilder();

  GameActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _basedOn = $v.basedOn;
      _userId = $v.userId;
      _type = $v.type;
      _placeTileAction = $v.placeTileAction?.toBuilder();
      _moveTileAction = $v.moveTileAction?.toBuilder();
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
  GameAction build() => _build();

  _$GameAction _build() {
    _$GameAction _$result;
    try {
      _$result = _$v ??
          new _$GameAction._(
              basedOn: BuiltValueNullFieldError.checkNotNull(
                  basedOn, r'GameAction', 'basedOn'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'GameAction', 'userId'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'GameAction', 'type'),
              placeTileAction: _placeTileAction?.build(),
              moveTileAction: _moveTileAction?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'placeTileAction';
        _placeTileAction?.build();
        _$failedField = 'moveTileAction';
        _moveTileAction?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GameAction', _$failedField, e.toString());
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
      (new PlaceTileActionBuilder()..update(updates))._build();

  _$PlaceTileAction._({required this.location}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        location, r'PlaceTileAction', 'location');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlaceTileAction')
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
  PlaceTileAction build() => _build();

  _$PlaceTileAction _build() {
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
            r'PlaceTileAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MoveTileAction extends MoveTileAction {
  @override
  final TileLocation sourceLocation;
  @override
  final TileLocation destinationLocation;

  factory _$MoveTileAction([void Function(MoveTileActionBuilder)? updates]) =>
      (new MoveTileActionBuilder()..update(updates))._build();

  _$MoveTileAction._(
      {required this.sourceLocation, required this.destinationLocation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        sourceLocation, r'MoveTileAction', 'sourceLocation');
    BuiltValueNullFieldError.checkNotNull(
        destinationLocation, r'MoveTileAction', 'destinationLocation');
  }

  @override
  MoveTileAction rebuild(void Function(MoveTileActionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoveTileActionBuilder toBuilder() =>
      new MoveTileActionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MoveTileAction &&
        sourceLocation == other.sourceLocation &&
        destinationLocation == other.destinationLocation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sourceLocation.hashCode);
    _$hash = $jc(_$hash, destinationLocation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MoveTileAction')
          ..add('sourceLocation', sourceLocation)
          ..add('destinationLocation', destinationLocation))
        .toString();
  }
}

class MoveTileActionBuilder
    implements Builder<MoveTileAction, MoveTileActionBuilder> {
  _$MoveTileAction? _$v;

  TileLocationBuilder? _sourceLocation;
  TileLocationBuilder get sourceLocation =>
      _$this._sourceLocation ??= new TileLocationBuilder();
  set sourceLocation(TileLocationBuilder? sourceLocation) =>
      _$this._sourceLocation = sourceLocation;

  TileLocationBuilder? _destinationLocation;
  TileLocationBuilder get destinationLocation =>
      _$this._destinationLocation ??= new TileLocationBuilder();
  set destinationLocation(TileLocationBuilder? destinationLocation) =>
      _$this._destinationLocation = destinationLocation;

  MoveTileActionBuilder();

  MoveTileActionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sourceLocation = $v.sourceLocation.toBuilder();
      _destinationLocation = $v.destinationLocation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MoveTileAction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MoveTileAction;
  }

  @override
  void update(void Function(MoveTileActionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MoveTileAction build() => _build();

  _$MoveTileAction _build() {
    _$MoveTileAction _$result;
    try {
      _$result = _$v ??
          new _$MoveTileAction._(
              sourceLocation: sourceLocation.build(),
              destinationLocation: destinationLocation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sourceLocation';
        sourceLocation.build();
        _$failedField = 'destinationLocation';
        destinationLocation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MoveTileAction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
