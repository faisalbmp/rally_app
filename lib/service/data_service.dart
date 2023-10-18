import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:timed_rally_app/model/participantModel.dart';
import 'package:timed_rally_app/model/resultModel.dart';
import 'package:timed_rally_app/model/result_response.dart';

final options = BaseOptions(
  baseUrl: 'https://rally.adhipati.org/api',
  connectTimeout: 5000,
  receiveTimeout: 3000,
  // headers: {"Authorization": "token 467022ae75460d8:78226a100ebe00b"}
);

class DataService {
  // var dio = Dio();

  final Dio _dio = Dio(options);

  Future<ParticipantModel> getParticipant({required String id}) async {
    Response podcastData = await _dio.get('/participant/$id');
    // Prints the raw data returned by the server

    // Parsing the raw JSON data to the Podcast class
    ParticipantModel participant = ParticipantModel.fromJson(podcastData.data);

    return participant;
  }

  Future<ResultModel> getResult({required int id}) async {
    Response res = await _dio.get('/result/$id');
    // Prints the raw data returned by the server

    // Parsing the raw JSON data to the Podcast class
    ResultModel result = ResultModel.fromJson(res.data);

    return result;
  }

  Future<List<ResultModel>> getResults() async {
    try {
      Response res = await _dio.get('/result');
      // Prints the raw data returned by the server
      // Parsing the raw JSON data to the Podcast class
      // print(new ResultListResponse.fromJson(res.data).data.toList());
      // return res.data;
      List<ResultModel> result =
          ResultListResponse.fromJson(res.data).data.toList();

      return result;
    } on DioError catch (e) {
      throw e;
    }
  }

  createResult({required FormData data}) async {
    Response res = await _dio.post('/result', data: data);
    try {
      ResultModel? result = ResultModel.fromJson(res.data);
      return result;
    } on DioError catch (e) {
      throw e;
    }
  }
  // Future<List<PodcastModel>> getPodcasts() async {
  //   Response response = await _dio.get('/Podcast', queryParameters: {
  //     "fields":
  //         '["name","judul","subjudul","image","published","video_source","video_id","publisher","publisher_logo","featured","featured_image","featured_text","deskripsi","rating","5_star","4_star","3_star","2_star","1_star","like_count","favorite_count","member_count","route"]'
  //   });
  //   // Prints the raw data returned by the server
  //   print('Podcast Info: ${response.data}');
  //   List<PodcastModel> podcastData =
  //       PodcastListResponse.fromJson(response.data).data.toList();
  //   return podcastData;
  // }

  // Future<List<RoomModel>> getRooms() async {
  //   Response response = await _dio.get('/Room',
  //       queryParameters: {"fields": '["name","judul","subjudul"]'});
  //   // Prints the raw data returned by the server
  //   print('Room Info: ${response.data}');
  //   List<RoomModel> roomData =
  //       RoomListResponse.fromJson(response.data).data.toList();
  //   return roomData;
  // }
}
