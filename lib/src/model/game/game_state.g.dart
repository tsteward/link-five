// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GameState> _$gameStateSerializer = new _$GameStateSerializer();

class _$GameStateSerializer implements StructuredSerializer<GameState> {
  @override
  final Iterable<Type> types = const [GameState, _$GameState];
  @override
  final String wireName = 'GameState';

  @override
  Iterable<Object?> serialize(Serializers serializers, GameState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'gameBoard',
      serializers.serialize(object.gameBoard,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(TileLocation), const FullType(Tile)])),
      'turnOrder',
      serializers.serialize(object.turnOrder,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PlayerColor)])),
      'turnNumber',
      serializers.serialize(object.turnNumber,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.winningTiles;
    if (value != null) {
      result
        ..add('winningTiles')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(Tile)])));
    }
    return result;
  }

  @override
  GameState deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GameStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'gameBoard':
          result.gameBoard.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(TileLocation),
                const FullType(Tile)
              ]))!);
          break;
        case 'turnOrder':
          result.turnOrder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PlayerColor)]))!
              as BuiltList<Object?>);
          break;
        case 'turnNumber':
          result.turnNumber = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'winningTiles':
          result.winningTiles.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(Tile)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GameState extends GameState {
  @override
  final BuiltMap<TileLocation, Tile> gameBoard;
  @override
  final BuiltList<PlayerColor> turnOrder;
  @override
  final int turnNumber;
  @override
  final BuiltSet<Tile>? winningTiles;
  BuiltList<Tile>? __tiles;
  bool? __tilesAvailable;

  factory _$GameState([void Function(GameStateBuilder)? updates]) =>
      (new GameStateBuilder()..update(updates))._build();

  _$GameState._(
      {required this.gameBoard,
      required this.turnOrder,
      required this.turnNumber,
      this.winningTiles})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(gameBoard, r'GameState', 'gameBoard');
    BuiltValueNullFieldError.checkNotNull(turnOrder, r'GameState', 'turnOrder');
    BuiltValueNullFieldError.checkNotNull(
        turnNumber, r'GameState', 'turnNumber');
  }

  @override
  BuiltList<Tile> get tiles => __tiles ??= super.tiles;

  @override
  bool get tilesAvailable => __tilesAvailable ??= super.tilesAvailable;

  @override
  GameState rebuild(void Function(GameStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameStateBuilder toBuilder() => new GameStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameState &&
        gameBoard == other.gameBoard &&
        turnOrder == other.turnOrder &&
        turnNumber == other.turnNumber &&
        winningTiles == other.winningTiles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, gameBoard.hashCode);
    _$hash = $jc(_$hash, turnOrder.hashCode);
    _$hash = $jc(_$hash, turnNumber.hashCode);
    _$hash = $jc(_$hash, winningTiles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GameState')
          ..add('gameBoard', gameBoard)
          ..add('turnOrder', turnOrder)
          ..add('turnNumber', turnNumber)
          ..add('winningTiles', winningTiles))
        .toString();
  }
}

class GameStateBuilder implements Builder<GameState, GameStateBuilder> {
  _$GameState? _$v;

  MapBuilder<TileLocation, Tile>? _gameBoard;
  MapBuilder<TileLocation, Tile> get gameBoard =>
      _$this._gameBoard ??= new MapBuilder<TileLocation, Tile>();
  set gameBoard(MapBuilder<TileLocation, Tile>? gameBoard) =>
      _$this._gameBoard = gameBoard;

  ListBuilder<PlayerColor>? _turnOrder;
  ListBuilder<PlayerColor> get turnOrder =>
      _$this._turnOrder ??= new ListBuilder<PlayerColor>();
  set turnOrder(ListBuilder<PlayerColor>? turnOrder) =>
      _$this._turnOrder = turnOrder;

  int? _turnNumber;
  int? get turnNumber => _$this._turnNumber;
  set turnNumber(int? turnNumber) => _$this._turnNumber = turnNumber;

  SetBuilder<Tile>? _winningTiles;
  SetBuilder<Tile> get winningTiles =>
      _$this._winningTiles ??= new SetBuilder<Tile>();
  set winningTiles(SetBuilder<Tile>? winningTiles) =>
      _$this._winningTiles = winningTiles;

  GameStateBuilder();

  GameStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gameBoard = $v.gameBoard.toBuilder();
      _turnOrder = $v.turnOrder.toBuilder();
      _turnNumber = $v.turnNumber;
      _winningTiles = $v.winningTiles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameState;
  }

  @override
  void update(void Function(GameStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GameState build() => _build();

  _$GameState _build() {
    _$GameState _$result;
    try {
      _$result = _$v ??
          new _$GameState._(
              gameBoard: gameBoard.build(),
              turnOrder: turnOrder.build(),
              turnNumber: BuiltValueNullFieldError.checkNotNull(
                  turnNumber, r'GameState', 'turnNumber'),
              winningTiles: _winningTiles?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'gameBoard';
        gameBoard.build();
        _$failedField = 'turnOrder';
        turnOrder.build();

        _$failedField = 'winningTiles';
        _winningTiles?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GameState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
