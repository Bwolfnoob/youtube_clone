import 'package:flutter/material.dart';

class CardVideoWidget extends StatelessWidget {
  final imagemVideo;
  final titulo;

  
  const CardVideoWidget( {this.imagemVideo, this.titulo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
          child: Column(
            children: <Widget>[
              Image.network(imagemVideo,fit: BoxFit.fill),
              Row(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: ClipRRect(
                        child: Image.network(imagemVideo,
                          fit: BoxFit.fitHeight,
                        ),
                        borderRadius:
                            new BorderRadius
                                .circular(25.0),
                      ),
                      radius: 25.0,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: <Widget>[
                          Text(titulo,
                            style: TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "Canal da Haru - 121 mil visualizações",
                            style: TextStyle(
                                fontSize: 13),
                          ),
                          Text(
                            "3 horas atrás",
                            style: TextStyle(
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
  }
}