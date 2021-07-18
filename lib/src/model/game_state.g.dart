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
      'turnIndex',
      serializers.serialize(object.turnIndex,
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
      final key = iterator.current as String;
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
        case 'turnIndex':
          result.turnIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  final int turnIndex;
  @override
  final BuiltSet<Tile>? winningTiles;
  BuiltList<Tile>? __tiles;

  factory _$GameState([void Function(GameStateBuilder)? updates]) =>
      (new GameStateBuilder()..update(updates)).build();

  _$GameState._(
      {required this.gameBoard,
      required this.turnOrder,
      required this.turnIndex,
      this.winningTiles})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(gameBoard, 'GameState', 'gameBoard');
    BuiltValueNullFieldError.checkNotNull(turnOrder, 'GameState', 'turnOrder');
    BuiltValueNullFieldError.checkNotNull(turnIndex, 'GameState', 'turnIndex');
  }

  @override
  BuiltList<Tile> get tiles => __tiles ??= super.tiles;

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
        turnIndex == other.turnIndex &&
        winningTiles == other.winningTiles;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, gameBoard.hashCode), turnOrder.hashCode),
            turnIndex.hashCode),
        winningTiles.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GameState')
          ..add('gameBoard', gameBoard)
          ..add('turnOrder', turnOrder)
          ..add('turnIndex', turnIndex)
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

  int? _turnIndex;
  int? get turnIndex => _$this._turnIndex;
  set turnIndex(int? turnIndex) => _$this._turnIndex = turnIndex;

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
      _turnIndex = $v.turnIndex;
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
  _$GameState build() {
    _$GameState _$result;
    try {
      _$result = _$v ??
          new _$GameState._(
              gameBoard: gameBoard.build(),
              turnOrder: turnOrder.build(),
              turnIndex: BuiltValueNullFieldError.checkNotNull(
                  turnIndex, 'GameState', 'turnIndex'),
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
            'GameState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
