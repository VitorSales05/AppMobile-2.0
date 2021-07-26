import 'package:filtro/data/estate_data.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenEstate extends StatefulWidget {
  @override
  _ScreenEstate createState() => _ScreenEstate();
}

class _ScreenEstate extends State<ScreenEstate> {
  static const estados = {...ESTATE_DATA};

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeigth = size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: PaletaCores.blueHome(),
                width: size.width,
                height: screenHeigth * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Estados',
                      style: TextStyle(
                          fontSize: 38,
                          color: PaletaCores.black(),
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: PaletaCores.blueHome(),
                width: size.width,
                height: screenHeigth * .85,
             //   margin: EdgeInsets.all(4),
                child: ListView.builder(
                  itemCount: estados.length,
                  itemBuilder: (ctx, i) => Card(
                    color: PaletaCores.gray(),
                    margin: EdgeInsets.fromLTRB(9, 2, 9, 2),
                    child: ListTile(
                      leading: Icon(
                        Icons.location_on,
                        size: 33,
                        color: PaletaCores.black(),
                      ),
                      title: Text(
                        'Estado: ${estados.elementAt(i).name}',
                        style: TextStyle(fontSize: 22, color: PaletaCores.black()),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                      subtitle: Text(
                        'Tarifa: R\$ ${estados.elementAt(i).tarifa} /m³ ',
                        style: TextStyle(fontSize: 21, color: PaletaCores.black()),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
