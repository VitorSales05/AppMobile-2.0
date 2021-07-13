import 'package:filtro/utils/color_palette.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenHome extends StatefulWidget {
  @override
  _ScreenHome createState() => _ScreenHome();
}

class _ScreenHome extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    // referencia ao metodo responsável por bloquear a rotação da tela
    _portraitModeOnly();
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: PaletaCores.blueHome(),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                  //    color: PaletaCores.red(),
                      height: size.height * .25,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                                'Água Melhor',
                                style: TextStyle(
                                  fontSize: 39,
                                  fontWeight: FontWeight.bold,
                                  color: PaletaCores.black(),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Simulação de sistemas para tratamento e reutilização de água cinza',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: PaletaCores.black(),
                                ),
                              ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: size.height * .75,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            elevation: 10.0,
                            color: PaletaCores.white(),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              side: BorderSide(
                                width: 1,
                                color: PaletaCores.black(),
                              ),
                            ),
                            padding: EdgeInsets.all(30),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.SIMULATE_PAGE);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('lib/images/simular3.png',
                                        scale: 1),
                                    Text(
                                      ' Simulação ',
                                      style: TextStyle(fontSize: 21, color: PaletaCores.black()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          RaisedButton(
                            elevation: 5.0,
                            color: PaletaCores.white(),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              side: BorderSide(
                                width: 1,
                                color: PaletaCores.black(),
                              ),
                            ),
                            padding: EdgeInsets.all(30),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.SYSTEM_LIST_PAGE);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('lib/images/sistema.jpg',
                                        scale: 1),
                                    Text(
                                      '   Sistemas   ',
                                      style: TextStyle(fontSize: 21, color: PaletaCores.black()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            elevation: 10.0,
                            color: PaletaCores.white(),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              side: BorderSide(
                                width: 1,
                                color: PaletaCores.black(),
                              ),
                            ),
                            padding: EdgeInsets.all(30),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.FILTER_LIST_PAGE);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('lib/images/filtro2.png',
                                        scale: 1),
                                    Text(
                                      '     Filtros     ',
                                      style: TextStyle(fontSize: 21, color: PaletaCores.black()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          RaisedButton(
                            elevation: 5.0,
                            color: PaletaCores.white(),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              side: BorderSide(
                                width: 1,
                                color: PaletaCores.black(),
                              ),
                            ),
                            padding: EdgeInsets.all(29),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.BOMBER_LIST_PAGE);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('lib/images/bomba3.jpg',
                                        scale: 1),
                                    Text(
                                      '    Bombas    ',
                                      style: TextStyle(fontSize: 21, color: PaletaCores.black()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            elevation: 5.0,
                            color: PaletaCores.white(),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              side: BorderSide(
                                width: 1,
                                color: PaletaCores.blueDark(),
                              ),
                            ),
                            padding: EdgeInsets.all(30),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.ESTATE_PAGE);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('lib/images/local.png',
                                        scale: 1),
                                    Text(
                                      '   Estados   ',
                                      style: TextStyle(fontSize: 21, color: PaletaCores.black()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 30),
                          RaisedButton(
                            elevation: 5.0,
                            color: PaletaCores.white(),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              side: BorderSide(
                                width: 1,
                                color: PaletaCores.blueDark(),
                              ),
                            ),
                            padding: EdgeInsets.all(30),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.ABOUT_PAGE);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('lib/images/info2.png',
                                        scale: 1),
                                    Text(
                                      '      Sobre     ',
                                      style: TextStyle(fontSize: 21, color: PaletaCores.black()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Bloquear o rotação da tela para o modo horizontal
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
