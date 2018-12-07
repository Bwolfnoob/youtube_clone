import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class VideoModel {
  final String imagemVideo, titulo, descricao;

  VideoModel(this.imagemVideo, this.titulo, this.descricao);

  VideoModel.fromJson(Map json)
      : imagemVideo = json['ImagemVideo'],
        titulo = json['Titulo'],
        descricao = json['Descricao'];
}

class API {
  final http.Client _client = http.Client();

  static const String _url = 'http://youflix.azurewebsites.net/api/ObterVideos/';

  Future<List<VideoModel>> get(String query) async {
    
    print("cas");

    List<VideoModel> list = [];

    await _client
        .get(Uri.parse(_url))
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json["Videos"])
        .then((videos) =>
            videos.forEach((movie) => list.add(VideoModel.fromJson(movie))));

    return list;
  }
}
