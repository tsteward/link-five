// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_start.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GameStart> _$gameStartSerializer = new _$GameStartSerializer();

class _$GameStartSerializer implements StructuredSerializer<GameStart> {
  @override
  final Iterable<Type> types = const [GameStart, _$GameStart];
  @override
  final String wireName = 'GameStart';

  @override
  Iterable<Object?> serialize(Serializers serializers, GameStart object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'turnOrder',
      serializers.serialize(object.turnOrder,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GameStart deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GameStartBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'turnOrder':
          result.turnOrder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GameStart extends GameStart {
  @override
  final BuiltList<String> turnOrder;

  factory _$GameStart([void Function(GameStartBuilder)? updates]) =>
      (new GameStartBuilder()..update(updates))._build();

  _$GameStart._({required this.turnOrder}) : super._() {
    BuiltValueNullFieldError.checkNotNull(turnOrder, r'GameStart', 'turnOrder');
  }

  @override
  GameStart rebuild(void Function(GameStartBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameStartBuilder toBuilder() => new GameStartBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GameStart && turnOrder == other.turnOrder;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, turnOrder.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GameStart')
          ..add('turnOrder', turnOrder))
        .toString();
  }
}

class GameStartBuilder implements Builder<GameStart, GameStartBuilder> {
  _$GameStart? _$v;

  ListBuilder<String>? _turnOrder;
  ListBuilder<String> get turnOrder =>
      _$this._turnOrder ??= new ListBuilder<String>();
  set turnOrder(ListBuilder<String>? turnOrder) =>
      _$this._turnOrder = turnOrder;

  GameStartBuilder();

  GameStartBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _turnOrder = $v.turnOrder.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GameStart other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GameStart;
  }

  @override
  void update(void Function(GameStartBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GameStart build() => _build();

  _$GameStart _build() {
    _$GameStart _$result;
    try {
      _$result = _$v ?? new _$GameStart._(turnOrder: turnOrder.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'turnOrder';
        turnOrder.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GameStart', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
