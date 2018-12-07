import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/widget/home/home_bloc.dart';
import 'package:youtube_clone/widget/home/home_widget.dart';
import 'package:youtube_clone/widget/home/video_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: HomeBloc(API()),
        child: MaterialApp(
          title: 'YouTube Clone',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeWidget(),
        ));
  }
}
