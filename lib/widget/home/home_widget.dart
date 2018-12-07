import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/widget/home/home_bloc.dart';
import 'package:youtube_clone/widget/shared/card_video_widget.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);

    bloc.query.add("");

    return DefaultTabController(
      length: 5,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Container(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/logo_youtube.jpg',
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "YouTube",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      bloc.query.add("");
                    },
                    child: Icon(
                      Icons.refresh,
                      color: Color(0xff888888),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.videocam,
                    color: Color(0xff888888),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(Icons.search, color: Color(0xff888888)),
                  Spacer(
                    flex: 1,
                  ),
                  Icon(Icons.face, color: Color(0xff888888))
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              new Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: StreamBuilder(
                        stream: bloc.results,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          return Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) => new CardVideoWidget(imagemVideo:snapshot.data[index].imagemVideo,titulo:snapshot.data[index].titulo)                              
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                color: Colors.orange,
              ),
              new Container(
                color: Colors.lightGreen,
              ),
              new Container(
                color: Colors.red,
              ),
              new Container(
                color: Colors.blue,
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            isScrollable: false,
            
            tabs: [
              Tab(icon: tabBarItem(icon: Icons.home, label: "Inicio")),
              Tab(icon: tabBarItem(icon: Icons.whatshot, label: "Em Alta")),
              Tab(
                  icon: tabBarItem(
                      icon: Icons.subscriptions, label: "Inscrições")),
              Tab(icon: tabBarItem(icon: Icons.mail, label: "Caixa Entrada")),
              Tab(icon: tabBarItem(icon: Icons.folder, label: "Caixa Entrada"))
            ],
            labelColor: Colors.red,
            unselectedLabelColor: Color(0xff888888),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.red,
          )),
    );
  }

  Column tabBarItem({IconData icon, String label}) {
    return Column(     
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon),
        Padding(
          padding: EdgeInsets.only(top: 4),
                  child: Text(          
            label,
            style: TextStyle(fontSize: 8),
          ),
        )
      ],
    );
  }
}


