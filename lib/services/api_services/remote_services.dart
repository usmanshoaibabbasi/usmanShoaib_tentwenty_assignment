import 'package:movie_app/controllers/bottom_nav_controller/watch_controller/watch_controller.dart';
import 'package:movie_app/controllers/movie_detail_controller/movie_detail_controller.dart';
import 'package:movie_app/modals/movie_detail_modal/movie_detail_modal.dart';
import 'package:movie_app/modals/movie_modal/movie_modals.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:movie_app/services/constants/constants.dart';
import 'package:get/get.dart' as getx;

class RemoteServices {

  static Future<List<MovieModal>> fetchmovies() async {
    String apiUrl = BaseUrl + 'upcoming';
    var formData = FormData.fromMap({
      'api_key': apiKey,
    });
    Dio dio = Dio();
    Response responce;
    responce = await dio.post(
      apiUrl,
      options: Options(headers: {"Authorization": "Bearer $token"}),
      data: formData,
    );
    if (responce.statusCode == 200) {
      var resp = jsonDecode(jsonEncode(responce.data).toString());
      var resultobj = resp["results"];
      // print(resp);
      // var x = resultobj["id"];
      // print(x.toString());

      for (var a in resultobj) {
        MovieModal movieModal = MovieModal(
          id: a['id'],
          title: a['title'],
          release_date: a['release_date'],
          overview: a['overview'],
          backdrop_path: "$ThemoviedbImageURL${a["poster_path"]}",
        );

        movielist.add(movieModal);
      }
      return movielist;
    } else {
      return [];
    }
  }


  static Future<List<MovieDetailModal>> fetchmoviesDetail({required int movieId}) async {
    // final MovieDetailController movieDetailController = getx.Get.put(MovieDetailController(10,'23-2-3'));
    print(movieId);
    final baseUrl = BaseUrl+movieId.toString()+'?api_key='+apiKey;

    // var formData = FormData.fromMap({
    //   'movie-id': movieId,
    //   'api_key': apiKey,
    // });
    Dio dio = Dio();
    Response responce;
    responce = await dio.get(
      baseUrl,
      options: Options(headers: {"Authorization": "Bearer $token"}),
      // data: formData,
    );
    if (responce.statusCode == 200) {
      var resp = jsonDecode(jsonEncode(responce.data).toString());
      var resultobj = resp["genres"];
      print('resp resp resp resp resp resp resp resp');
      print(resp);
      print('kkkkkkkkkkkkkkkkkkkkkkklllllllllllllllllllljjjjjjj');
      print(resultobj);

      // for (var a in resp) {
        MovieDetailModal movieDetailModal = MovieDetailModal(
          original_title: resp['original_title'],
          backdrop_path: "$ThemoviedbImageURL${resp["poster_path"]}",
        );
        moviedetaillist.add(movieDetailModal);
      return moviedetaillist;
    } else {
      return [];
    }
  }
}
