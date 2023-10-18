// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      id: json['id'] as int,
      team: json['team'] as String,
      nama_lengkap: json['nama_lengkap'] as String,
      start_time: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      time_pos1: json['time_pos1'] == null
          ? null
          : DateTime.parse(json['time_pos1'] as String),
      time_pos2: json['time_pos2'] == null
          ? null
          : DateTime.parse(json['time_pos2'] as String),
      time_pos3: json['time_pos3'] == null
          ? null
          : DateTime.parse(json['time_pos3'] as String),
      time_finish: json['time_finish'] == null
          ? null
          : DateTime.parse(json['time_finish'] as String),
      tempuh_pos1: (json['tempuh_pos1'] as num?)?.toDouble(),
      scorepos1: (json['scorepos1'] as num?)?.toDouble(),
      tempuh_pos2: (json['tempuh_pos2'] as num?)?.toDouble(),
      scorepos2: (json['scorepos2'] as num?)?.toDouble(),
      tempuh_pos3: (json['tempuh_pos3'] as num?)?.toDouble(),
      scorepos3: (json['scorepos3'] as num?)?.toDouble(),
      tempuh_finish: (json['tempuh_finish'] as num?)?.toDouble(),
      scorefinish: (json['scorefinish'] as num?)?.toDouble(),
      scoretotal: (json['scoretotal'] as num?)?.toDouble(),
      total_tempuh: (json['total_tempuh'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'team': instance.team,
      'nama_lengkap': instance.nama_lengkap,
      'id': instance.id,
      'start_time': instance.start_time?.toIso8601String(),
      'time_pos1': instance.time_pos1?.toIso8601String(),
      'time_pos2': instance.time_pos2?.toIso8601String(),
      'time_pos3': instance.time_pos3?.toIso8601String(),
      'time_finish': instance.time_finish?.toIso8601String(),
      'tempuh_pos1': instance.tempuh_pos1,
      'scorepos1': instance.scorepos1,
      'tempuh_pos2': instance.tempuh_pos2,
      'scorepos2': instance.scorepos2,
      'tempuh_pos3': instance.tempuh_pos3,
      'scorepos3': instance.scorepos3,
      'tempuh_finish': instance.tempuh_finish,
      'scoretotal': instance.scoretotal,
      'total_tempuh': instance.total_tempuh,
      'scorefinish': instance.scorefinish,
    };
