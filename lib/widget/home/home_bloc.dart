import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_clone/widget/home/video_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements BlocBase {
  @override
  BuildContext context;
  
  final API api;

  Stream<List<VideoModel>> _results = Stream.empty();

  ReplaySubject<String> _query = ReplaySubject<String>();

  Stream<List<VideoModel>> get results => _results;
  
  Sink<String> get query => _query;

  HomeBloc(this.api) 
  {

    _results = _query.asyncMap(api.get).asBroadcastStream();

  }

  @override
  void dispose() {
     _query.close();
  }
}