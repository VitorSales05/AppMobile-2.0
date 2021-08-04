import 'package:filtro/OLD/screen_edit_filter.dart';
import 'package:filtro/controllers/alert_forms.dart';
import 'package:filtro/controllers/controller_bomber.dart';
import 'package:filtro/controllers/controller_filter.dart';
import 'package:filtro/OLD/controller_systemOLD.dart';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/bomba.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/providers/bombas.dart';
import 'package:filtro/providers/filtros.dart';
import 'package:filtro/providers/sistemas.dart';
import 'package:filtro/screens/screen_newSystem.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


searchFilter(BuildContext context) {
  
  
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      var size = MediaQuery.of(context).size;

/* void _exibeBombaPage({Bomba bomba}) async {
    await editBomb(context, bomba);
    Provider.of<Bombas>(context, listen: false).buscaBombas();
  }
      void _exibeFiltroPage({Filtro filtro}) async {
        Bomba b;
        await editFilter(context, filtro);

    //    Navigator.pop(context, filtro);
      //  Provider.of<Filtros>(context, listen: false).buscaFiltros();
      } */

      void _exibeFiltroPage({Filtro filtro}) async {
   // var table = 'bomba';
    //final bombaRecebido = 
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScreenNewSystem()));
    //await DbApp.editarBomb(table, bombaRecebido);
    
 //   Provider.of<Bombas>(context, listen: false).buscaItens();
  }
      

      final camposCad = Container(
        width: size.width,
        height: size.height * .45,
        child: FutureBuilder(
          future: Provider.of<Filtros>(context, listen: false).buscaFiltros(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<Filtros>(
                  child: Center(
                    child: Text(
                      'Nenhum filtro cadastrado',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: PaletaCores.black(),
                      ),
                    ),
                  ),
                  builder: (ctx, filtros, chil) => filtros.filtrosQuantidade ==
                          0
                      ? chil
                      : ListView.builder(
                          itemCount: filtros.filtrosQuantidade,
                          itemBuilder: (ctx, i) => Container(
                            height: 57,
                            width: size.width,
                            child: Card(
                              color: PaletaCores.gray(),
                              margin: EdgeInsets.fromLTRB(1, 2, 1, 2),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: size.width * .51,
                                      margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Modelo: ${filtros.getFiltro(i).modelo}',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black),
                                            overflow: TextOverflow.fade,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                          Text(
                                            'Performanse: ${filtros.getFiltro(i).performanse} L/h',
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
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(Icons.check),
                                                color: PaletaCores.blue(),
                                                onPressed: () {
                                                  
                                                  _exibeFiltroPage(
                                                            filtro: filtros
                                                                .getFiltro(i),
                                                          );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
        ),
      );

      return AlertDialog(
        title: Text(
          'Lista de filtros',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        content: camposCad,
        actions: <Widget>[
          RaisedButton(
            color: PaletaCores.red(),
            padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
            elevation: 5,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
            ),
            child: Text('Voltar', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

searchBomb(BuildContext context) {
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      var size = MediaQuery.of(context).size;
      bool _validate = false;

      _register() {
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.SYSTEM_LIST_PAGE,
            ModalRoute.withName(AppRoutes.HOME_PAGE));
      }

      
      final camposCad = Container(
        width: size.width,
        height: size.height * .45,
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
                      'Nenhuma bomba cadastrada',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: PaletaCores.black(),
                      ),
                    ),
                  ),
                  builder: (ctx, bombas, chil) => bombas.bombasQuantidade == 0
                      ? chil
                      : ListView.builder(
                          itemCount: bombas.bombasQuantidade,
                          itemBuilder: (ctx, i) => Container(
                            height: 57,
                            width: size.width,
                            child: Card(
                              color: PaletaCores.gray(),
                              margin: EdgeInsets.fromLTRB(1, 2, 1, 2),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: size.width * .51,
                                      margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
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
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(Icons.check),
                                                color: PaletaCores.blue(),
                                                onPressed: () {
                                               
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
        ),
      );

      return AlertDialog(
        title: Text(
          'Lista de bombas',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        content: camposCad,
        actions: <Widget>[
          RaisedButton(
            color: PaletaCores.red(),
            padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
            elevation: 5,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
            ),
            child: Text('Voltar', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

