import 'package:filtro/controllers/controller_bomber.dart';
import 'package:filtro/controllers/controller_filter.dart';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/bomba.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/providers/bombas.dart';
import 'package:filtro/providers/filtros.dart';
import 'package:filtro/OLD/screen_edit_filterOLD.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenBomberList extends StatefulWidget {
  @override
  _ScreenBomberList createState() => _ScreenBomberList();
}

class _ScreenBomberList extends State<ScreenBomberList> {
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
                      'Bombas Cadastradas',
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
                  future: Provider.of<Bombas>(context, listen: false)
                      .buscaBombas(),
                  builder: (ctx, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Consumer<Bombas>(
                          child: Center(
                            child: Text(
                              'Nenhuma bomba cadastrada',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: PaletaCores.black(),
                              ),
                            ),
                          ),
                          builder: (ctx, bombas, chil) => bombas
                                      .bombasQuantidade ==
                                  0
                              ? chil
                              : ListView.builder(
                                  itemCount: bombas.bombasQuantidade,
                                  itemBuilder: (ctx, i) => Container(
                                    height: 92,
                                    child: Card(
                                      color: PaletaCores.gray(),
                                      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth * .67,
                                              margin: EdgeInsets.fromLTRB(
                                                  12, 0, 0, 0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Modelo: ${bombas.getBomba(i).modelo}',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                  Text(
                                                    'Performanse: ${bombas.getBomba(i).performanse} L/h',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                  Text(
                                                    'Preço: R\$ ${bombas.getBomba(i).preco}',
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
                                             // color: Colors.green,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      IconButton(
                                                        icon: Icon(Icons.edit),
                                                        color: PaletaCores
                                                            .orange(),
                                                        onPressed: () {
                                                          _exibeBombaPage(
                                                            bomba: bombas
                                                                .getBomba(i),
                                                          );
                                                        },
                                                      ),
                                                      IconButton(
                                                        icon:
                                                            Icon(Icons.delete),
                                                        color:
                                                            PaletaCores.red(),
                                                        onPressed: () {
                                                          deleteBomb(
                                                              context,
                                                              bombas
                                                                  .getBomba(i)
                                                                  .id);
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
              saveBomber(context);
            },
          ),
        ),
      ),
    );
  }

  void _exibeBombaPage({Bomba bomba}) async {
    await editBomb(context, bomba);
    Provider.of<Bombas>(context, listen: false).buscaBombas();
  }
}


























































/* import 'package:filtro/controllers/controller_filter.dart';
import 'package:filtro/providers/bombas.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenBomberList extends StatefulWidget {
  @override
  _ScreenBomberList createState() => _ScreenBomberList();
}

class _ScreenBomberList extends State<ScreenBomberList> {
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
            color: PaletaCores.white(),
            /* decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/background.jfif'),
              fit: BoxFit.cover,
            ),
          ), */
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  //    color: PaletaCores.red(),
                  width: size.width,
                  height: screenHeigth * .15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'BombasSSS Cadastrados',
                        style: TextStyle(
                          fontSize: 32,
                          color: PaletaCores.blueHome(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: screenHeigth * .85,
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: FutureBuilder(
                    future: Provider.of<Bombas>(context, listen: false).buscaBombas(),
                    builder: (ctx, snapshot) => snapshot.connectionState ==
                            ConnectionState.waiting
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                          : Consumer<Bombas>(
                            child: Center(
                              child: Text(
                                'Nenhum filtro cadaaaaaaaaaaaaaastrado',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: PaletaCores.black(),
                                ),
                              ),
                            ),
                            builder: (ctx, bombas, chil) => bombas
                                       .bombasQuantidade ==
                                    0
                                ? chil
                                : ListView.builder(
                                    itemCount: bombas.bombasQuantidade,
                                    itemBuilder: (ctx, i) => Card(
                                      color: PaletaCores.gray(),
                                      margin: EdgeInsets.all(5),
                                      child: ListTile(
                                        title: Text(
                                          'Modelo: {bombas.getBomba(i).modelo}',
                                          style: TextStyle(
                                            fontSize: 21,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                        subtitle: Text(
                                          'Performanse: {bombas.getBomba(i).performanse} L/h',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                        trailing: Container(
                                          width: 90,
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: size.width * .1,
                                                child: IconButton(
                                                  icon: Icon(Icons.edit),
                                                  color: PaletaCores.orange(),
                                                  onPressed: () {
                                                   // editBomb(context, filtros.getBomba(i).id);
                                                  /*   _exibeFiltroPage(
                                                      filtro:
                                                          filtros.getFiltro(i), 
                                                    );*/
                                                  },
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.delete),
                                                color: PaletaCores.red(),
                                                onPressed: () {
                                             /*      deleteFilter(context,
                                                      filtros.getFiltro(i).id); */
                                                },
                                              ),
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
                saveFilter(context);
                //  Navigator.pushNamed(context, AppRoutes.REGISTER_FILTER_PAGE);
              },
            ),
          ),
        ),
      );
  }

  /* void _exibeFiltroPage({Filtro filtro}) async {
    var table = 'filtro';
    final filtroRecebido = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScreenEditFilterState(filtro: filtro)));
    await DbApp.editar(table, filtroRecebido);
    Provider.of<Filtros>(context, listen: false).buscaFiltros();
  }*/
}
  */