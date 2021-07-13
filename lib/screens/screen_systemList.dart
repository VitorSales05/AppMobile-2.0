import 'package:filtro/controllers/controller_filter.dart';
import 'package:filtro/controllers/controller_system.dart';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/providers/bombas.dart';
import 'package:filtro/providers/filtros.dart';
import 'package:filtro/OLD/screen_edit_filterOLD.dart';
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
                  future: Provider.of<Filtros>(context, listen: false)
                      .buscaFiltros(),
                  builder: (ctx, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Consumer<Filtros>(
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
                          builder: (ctx, filtros, chil) => filtros
                                      .filtrosQuantidade ==
                                  0
                              ? chil
                              : ListView.builder(
                                  itemCount: filtros.filtrosQuantidade,
                                  itemBuilder: (ctx, i) => Container(
                                    height: 75,
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
                                                    'Nome: ${filtros.getFiltro(i).modelo}',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                  Text(
                                                    'Investimento: R\$ ${filtros.getFiltro(i).preco}',
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
                                                          /* _exibeFiltroPage(
                                                            filtro: filtros
                                                                .getFiltro(i),
                                                          ); */
                                                        },
                                                      ),
                                                      IconButton(
                                                        icon:
                                                            Icon(Icons.delete),
                                                        color:
                                                            PaletaCores.red(),
                                                        onPressed: () {
                                                          /* deleteFilter(
                                                              context,
                                                              filtros
                                                                  .getFiltro(i)
                                                                  .id); */
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
             saveSystem(context);
            },
          ),
        ),
      ),
    );
  }

  /* void _exibeFiltroPage({Filtro filtro}) async {
    await editFilter(context, filtro);
    Provider.of<Filtros>(context, listen: false).buscaFiltros();
  } */
}
