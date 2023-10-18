// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultListResponse _$ResultListResponseFromJson(Map<String, dynamic> json) =>
    ResultListResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultListResponseToJson(ResultListResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
