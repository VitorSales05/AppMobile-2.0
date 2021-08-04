import 'package:filtro/providers/sistemas.dart';
import 'package:filtro/screens/screen_simulation.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSimulate extends StatefulWidget {
  @override
  _ScreenSimulate createState() => _ScreenSimulate();
}

class _ScreenSimulate extends State<ScreenSimulate> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenRading = size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: PaletaCores.blueHome(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: size.width,
                height: screenRading * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Sistemas',
                      style: TextStyle(
                          fontSize: 32,
                          color: PaletaCores.black(),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: screenRading * .85,
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: FutureBuilder(
                  future: Provider.of<Sistemas>(context, listen: false)
                      .buscaSistemas(),
                  builder: (ctx, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Consumer<Sistemas>(
                          child: Center(
                            child: Text(
                              'Nenhum sistema cadastrado',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: PaletaCores.black()),
                            ),
                          ),
                          builder: (ctx, sistemas, chil) =>
                              sistemas.sistemasQuantidade == 0
                                  ? chil
                                  : ListView.builder(
                                      itemCount: sistemas.sistemasQuantidade,
                                      itemBuilder: (ctx, i) => Container(
                                        child: Card(
                                          color: PaletaCores.gray(),
                                          margin:
                                              EdgeInsets.fromLTRB(5, 2, 5, 2),
                                          child: ListTile(
                                            /* leading: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.brightness_1,
                                                  size: 9,
                                                  color: PaletaCores.black(),
                                                ),
                                              ],
                                            ), */
                                            title: Text(
                                              ' Sistema:  ${sistemas.getSistema(i).nome}',
                                              style: TextStyle(
                                                fontSize: 23,
                                                color: PaletaCores.black(),
                                              ),
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                  builder: (context) =>
                                                      ScreenSimulation(
                                                          sistemas.getSistema(i)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
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
