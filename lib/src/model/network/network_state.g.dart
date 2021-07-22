// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NetworkState> _$networkStateSerializer =
    new _$NetworkStateSerializer();

class _$NetworkStateSerializer implements StructuredSerializer<NetworkState> {
  @override
  final Iterable<Type> types = const [NetworkState, _$NetworkState];
  @override
  final String wireName = 'NetworkState';

  @override
  Iterable<Object?> serialize(Serializers serializers, NetworkState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gameCode;
    if (value != null) {
      result
        ..add('gameCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.players;
    if (value != null) {
      result
        ..add('players')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Player)])));
    }
    value = object.turnOrderByUserId;
    if (value != null) {
      result
        ..add('turnOrderByUserId')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  NetworkState deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NetworkStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gameCode':
          result.gameCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'players':
          result.players.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Player)]))!);
          break;
        case 'turnOrderByUserId':
          result.turnOrderByUserId.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$NetworkState extends NetworkState {
  @override
  final String? userId;
  @override
  final String? gameCode;
  @override
  final BuiltMap<String, Player>? players;
  @override
  final BuiltList<String>? turnOrderByUserId;
  BuiltList<PlayerColor>? __turnOrderByColor;
  bool ___turnOrderByColor = false;
  bool? __hasGameStarted;

  factory _$NetworkState([void Function(NetworkStateBuilder)? updates]) =>
      (new NetworkStateBuilder()..update(updates)).build();

  _$NetworkState._(
      {this.userId, this.gameCode, this.players, this.turnOrderByUserId})
      : super._();

  @override
  BuiltList<PlayerColor>? get turnOrderByColor {
    if (!___turnOrderByColor) {
      __turnOrderByColor = super.turnOrderByColor;
      ___turnOrderByColor = true;
    }
    return __turnOrderByColor;
  }

  @override
  bool get hasGameStarted => __hasGameStarted ??= super.hasGameStarted;

  @override
  NetworkState rebuild(void Function(NetworkStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NetworkStateBuilder toBuilder() => new NetworkStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NetworkState &&
        userId == other.userId &&
        gameCode == other.gameCode &&
        players == other.players &&
        turnOrderByUserId == other.turnOrderByUserId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userId.hashCode), gameCode.hashCode), players.hashCode),
        turnOrderByUserId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NetworkState')
          ..add('userId', userId)
          ..add('gameCode', gameCode)
          ..add('players', players)
          ..add('turnOrderByUserId', turnOrderByUserId))
        .toString();
  }
}

class NetworkStateBuilder
    implements Builder<NetworkState, NetworkStateBuilder> {
  _$NetworkState? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _gameCode;
  String? get gameCode => _$this._gameCode;
  set gameCode(String? gameCode) => _$this._gameCode = gameCode;

  MapBuilder<String, Player>? _players;
  MapBuilder<String, Player> get players =>
      _$this._players ??= new MapBuilder<String, Player>();
  set players(MapBuilder<String, Player>? players) => _$this._players = players;

  ListBuilder<String>? _turnOrderByUserId;
  ListBuilder<String> get turnOrderByUserId =>
      _$this._turnOrderByUserId ??= new ListBuilder<String>();
  set turnOrderByUserId(ListBuilder<String>? turnOrderByUserId) =>
      _$this._turnOrderByUserId = turnOrderByUserId;

  NetworkStateBuilder();

  NetworkStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _gameCode = $v.gameCode;
      _players = $v.players?.toBuilder();
      _turnOrderByUserId = $v.turnOrderByUserId?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NetworkState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NetworkState;
  }

  @override
  void update(void Function(NetworkStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NetworkState build() {
    _$NetworkState _$result;
    try {
      _$result = _$v ??
          new _$NetworkState._(
              userId: userId,
              gameCode: gameCode,
              players: _players?.build(),
              turnOrderByUserId: _turnOrderByUserId?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'players';
        _players?.build();
        _$failedField = 'turnOrderByUserId';
        _turnOrderByUserId?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NetworkState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
