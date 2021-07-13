import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';

class ScreenAbout extends StatefulWidget {
  _ScreenAbout createState() => _ScreenAbout();
}

class _ScreenAbout extends State<ScreenAbout> {
  @override
  Widget build(BuildContext context) {

  var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: PaletaCores.blueHome(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: size.height * .9,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                    'UniCatólica',
                    style: TextStyle(fontSize: 42, color: PaletaCores.black(), fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * .1,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Aplicação Desenvolvida Por \nVitor Sales', style: TextStyle(fontSize: 21, color: PaletaCores.black()), textAlign: TextAlign.center),
                    ],
                  ) 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
