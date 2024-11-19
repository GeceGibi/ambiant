// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChainImpl _$$ChainImplFromJson(Map<String, dynamic> json) => _$ChainImpl(
      name: json['name'] as String,
      chain: (json['chain'] as List<dynamic>)
          .map((e) => ChainRing.fromJson(e as Map<String, dynamic>))
          .toList(),
      faded: json['faded'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChainImplToJson(_$ChainImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'chain': instance.chain,
      'faded': instance.faded,
    };

_$ChainRingImpl _$$ChainRingImplFromJson(Map<String, dynamic> json) =>
    _$ChainRingImpl(
      Duration(microseconds: (json['duration'] as num).toInt()),
      _colorFromJson((json['color'] as num).toInt()),
    );

Map<String, dynamic> _$$ChainRingImplToJson(_$ChainRingImpl instance) =>
    <String, dynamic>{
      'duration': instance.duration.inMicroseconds,
      'color': _colorToJson(instance.color),
    };
