import 'package:filtro/OLD/controller_systemOLD.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/models/sistema.dart';
import 'package:filtro/providers/sistemas.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSystemList extends StatefulWidget {
  @override
  _ScreenSystemList createState() => _ScreenSystemList();
}

class _ScreenSystemList extends State<ScreenSystemList> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenHeigth = size.height;
    var screenWidth = size.width;

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
                //    color: PaletaCores.red(),
                width: screenWidth,
                height: screenHeigth * .15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Sistemas Cadastrados',
                      style: TextStyle(
                        fontSize: 34,
                        color: PaletaCores.black(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeigth * .85,
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
                                color: PaletaCores.black(),
                              ),
                            ),
                          ),
                          builder: (ctx, sistemas, chil) => sistemas
                                      .sistemasQuantidade ==
                                  0
                              ? chil
                              : ListView.builder(
                                  itemCount: sistemas.sistemasQuantidade,
                                  itemBuilder: (ctx, i) => Container(
                                    height: 82,
                                    child: Card(
                                      color: PaletaCores.gray(),
                                      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth * .79,
                                              margin: EdgeInsets.fromLTRB(
                                                  12, 0, 0, 0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Sistema: ${sistemas.getSistema(i).nome}',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                  Text(
                                                    'Filtro utilizado: ${sistemas.getSistema(i).modeloFiltro}',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                  Text(
                                                    'Bomba utilizada: ${sistemas.getSistema(i).modeloBomba}',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                            //   color: Colors.green,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      /* IconButton(
                                                        icon: Icon(Icons.edit),
                                                        color: PaletaCores
                                                            .orange(),
                                                        onPressed: () {
                                                          
                                                        },
                                                      ), */
                                                      IconButton(
                                                        icon:
                                                            Icon(Icons.delete),
                                                        color:
                                                            PaletaCores.red(),
                                                        onPressed: () {
                                                          deleteSystem(context, sistemas.getSistema(i).id);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
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
      floatingActionButton: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.all(15),
        child: FittedBox(
          child: FloatingActionButton(
            child: const Icon(Icons.add, size: 40, color: Colors.lightBlue),
            backgroundColor: PaletaCores.grafite(),
            elevation: 10,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.NEW_SYSTEM_PAGE);
            },
          ),
        ),
      ),
    );
  }

  /* void _exibeFiltroPage({Sistema filtro}) async {
    await editSystem(context, );
    Provider.of<Sistemas>(context, listen: false).buscaSistemas();
  } */
}
