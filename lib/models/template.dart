import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template.g.dart';
part 'template.freezed.dart';

int _colorToJson(Color color) {
  return color.value;
}

Color _colorFromJson(int value) {
  return Color(value);
}

@freezed
class Chain with _$Chain {
  const factory Chain({
    required String name,
    required List<ChainRing> chain,
    @Default(false) bool faded,
  }) = _Chain;

  factory Chain.fromJson(Map<String, dynamic> json) => _$ChainFromJson(json);

  const Chain._();

  Chain reverse() {
    return Chain(
      name: name,
      chain: chain.reversed.toList(),
      faded: faded,
    );
  }

  Stream<Color> run() async* {
    var index = 0;

    while (true) {
      final ring = chain[index];

      if (faded) {
        var nextIndex = index + 1;
        if (nextIndex > chain.length - 1) {
          nextIndex = 0;
        }

        final next = chain[nextIndex];
        final totalDuration = ring.duration + next.duration;

        for (var i = 0; i <= totalDuration.inMilliseconds; i += 25) {
          await Future<void>.delayed(const Duration(milliseconds: 25));

          yield Color.lerp(
            ring.color,
            next.color,
            i / totalDuration.inMilliseconds,
          )!;
        }

        index++;
        if (index > chain.length - 1) {
          index = 0;
        }
      }

      ///
      else {
        yield ring.color;

        index++;
        if (index > chain.length - 1) {
          index = 0;
        }

        ///
        await Future<void>.delayed(ring.duration);
      }
    }
  }
}

@freezed
class ChainRing with _$ChainRing {
  const factory ChainRing(
    Duration duration,
    @JsonKey(toJson: _colorToJson, fromJson: _colorFromJson) Color color,
  ) = _ChainRing;

  factory ChainRing.fromJson(Map<String, dynamic> json) =>
      _$ChainRingFromJson(json);
}
