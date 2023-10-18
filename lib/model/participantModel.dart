// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'participantModel.g.dart';

@JsonSerializable()
class ParticipantModel {
  /// The generated code assumes these values exist in JSON.
  final String email, nama_lengkap;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  ParticipantModel({required this.email, required this.nama_lengkap});

  /// Connect the generated [_$ParticipantModelFromJson] function to the `fromJson`
  /// factory.
  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantModelFromJson(json);

  /// Connect the generated [_$ParticipantModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ParticipantModelToJson(this);
}
