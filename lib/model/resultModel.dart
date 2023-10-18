// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'resultModel.g.dart';

@JsonSerializable()
class ResultModel {
  /// The generated code assumes these values exist in JSON.
  final String team, nama_lengkap;
  final int id;
  final DateTime? start_time, time_pos1, time_pos2, time_pos3, time_finish;
  final double? tempuh_pos1,
      scorepos1,
      tempuh_pos2,
      scorepos2,
      tempuh_pos3,
      scorepos3,
      tempuh_finish,
      scoretotal,
      total_tempuh,
      scorefinish;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  ResultModel({
    required this.id,
    required this.team,
    required this.nama_lengkap,
    this.start_time,
    this.time_pos1,
    this.time_pos2,
    this.time_pos3,
    this.time_finish,
    this.tempuh_pos1,
    this.scorepos1,
    this.tempuh_pos2,
    this.scorepos2,
    this.tempuh_pos3,
    this.scorepos3,
    this.tempuh_finish,
    this.scorefinish,
    this.scoretotal,
    this.total_tempuh,
  });

  /// Connect the generated [_$ParticipantModelFromJson] function to the `fromJson`
  /// factory.
  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  /// Connect the generated [_$ParticipantModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
