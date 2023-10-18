// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';
import 'package:timed_rally_app/model/resultModel.dart';

part 'result_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ResultListResponse {
  final List<ResultModel> data;

  ResultListResponse({required this.data});

  /// Connect the generated [_$ResultListResponseFromJson] function to the `fromJson`
  /// factory.
  factory ResultListResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultListResponseFromJson(json);

  /// Connect the generated [_$ResultListResponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResultListResponseToJson(this);
}
