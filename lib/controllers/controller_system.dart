import 'package:filtro/controllers/alert_forms.dart';
import 'package:filtro/controllers/list_components.dart';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/providers/filtros.dart';
import 'package:filtro/providers/sistemas.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

saveSystem(BuildContext context) {
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      final _nomeController = TextEditingController();
     // final _totalController = TextEditingController();
      final _filtroController = TextEditingController();
      final _bombaController = TextEditingController();
      var size = MediaQuery.of(context).size;
      bool _validate = false;

      _register() {
        var total = 'TOTAL INVESTIDO';

        var nome = _nomeController.text.toString();
        var filtro = _filtroController.text.toString();
        var bomba = _bombaController.text.toString();

        if (nome.isEmpty || filtro.isEmpty || bomba.isEmpty) {
          return alertFilter(context/* , modelo, performanse, preco */);
        }
        Provider.of<Sistemas>(context, listen: false)
            .novoSistema(nome, total, filtro, bomba);
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.SYSTEM_LIST_PAGE,
            ModalRoute.withName(AppRoutes.HOME_PAGE));
      }

      final camposCad = Container(
        height: size.height * .35,
        width: size.width,
        child: Form(
          autovalidate: _validate,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: PaletaCores.grayDark(),
                    filled: true,
                    hintText: 'Nome do sistema',
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.FILTER_LIST_PAGE);
                  }
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _filtroController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: PaletaCores.grayDark(),
                    filled: true,
                    hintText: 'Filtro a ser utilizado',
                  ),
                  onTap: () {
                   // Navigator.pushNamed(context, AppRoutes.FILTER_LIST_PAGE);
                    searchFilter(context);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _bombaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: PaletaCores.grayDark(),
                    filled: true,
                    hintText: 'Bomba a ser utilizada',
                  ),
                  onTap: () {
                  //  Navigator.pushNamed(context, AppRoutes.BOMBER_LIST_PAGE);
                    searchBomb(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );

      return AlertDialog(
        title: Text(
          'Criar sistema',
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
            child: Text('Cancelar', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.SYSTEM_LIST_PAGE,
                  ModalRoute.withName(AppRoutes.HOME_PAGE));
            },
          ),
          RaisedButton(
            color: PaletaCores.seanGreen(),
            padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
            elevation: 5,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
            ),
            child: Text('Salvar', style: TextStyle(fontSize: 20)),
            onPressed: () {
          //    _register();
            },
          ),
        ],
      );
    },
  );
}

//DELETE
deleteSystem(context, String idSistema) {
  return _deletDialog(context, idSistema);
}

void _deletDialog(BuildContext context, String id) {
  var table = 'sistema';

  Widget okButton = RaisedButton(
        color: PaletaCores.seanGreen(),
        padding: EdgeInsets.fromLTRB(17, 4, 17, 4),
        elevation: 5,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
        child: Text('Não', style: TextStyle(fontSize: 20, color: Colors.white)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      cancelButton = RaisedButton(
        color: PaletaCores.red(),
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        elevation: 5,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
        child: Text('Sim', style: TextStyle(fontSize: 20)),
        onPressed: () {
          Provider.of<Filtros>(context, listen: false).delelarFiltro(table, id);
          Provider.of<Filtros>(context, listen: false).buscaFiltros();
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.SYSTEM_LIST_PAGE,
              ModalRoute.withName(AppRoutes.HOME_PAGE));
        },
      );
  AlertDialog alerta = AlertDialog(
    title: Text('Realmente deseja apagar?',
        style: TextStyle(fontSize: 23), textAlign: TextAlign.center),
    shape:
        new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
    actions: [
      okButton,
      cancelButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

//EDIT
editSystem(context, Filtro filtro) {
  return _editDialog(context, filtro);
}

void _editDialog(BuildContext context, Filtro filtro) {
  Filtro _filtroCTX;
  _filtroCTX = Filtro.fromMap(filtro.toMap());

  var modeloFiltro = filtro.modelo;
  var perforFiltro = filtro.performanse;
  var precoFiltro = filtro.preco;

  final _nomeController = TextEditingController();
  final _filtroController = TextEditingController();
  final _bombaController = TextEditingController();

  /* void initState(){
    super.initState();
    filtroCTX = Filtro.fromMap(widget.filtro.toMap());
  } */

  _nomeController.text = modeloFiltro;
  _filtroController.text = perforFiltro;
  _bombaController.text = precoFiltro;

  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      var size = MediaQuery.of(context).size;
      bool _validate = false;

      final camposCad = Container(
        height: size.height * .30,
        width: size.width,
        child: new Form(
          autovalidate: _validate,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _nomeController,
                  onChanged: (text) {
                    _filtroCTX.modelo = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: PaletaCores.grayDark(),
                    filled: true,
                    hintText: 'Modelo Filtro',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _filtroController,
                  onChanged: (text) {
                    _filtroCTX.performanse = text;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: PaletaCores.grayDark(),
                    filled: true,
                    hintText: 'Filtragem de L/h',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _bombaController,
                  onChanged: (text) {
                    _filtroCTX.preco = text;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: PaletaCores.grayDark(),
                    filled: true,
                    hintText: 'Valor investido',
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      return AlertDialog(
        title: Text(
          'Edição',
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
            child: Text('Cancelar', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.SYSTEM_LIST_PAGE,
                  ModalRoute.withName(AppRoutes.HOME_PAGE));
            },
          ),
          RaisedButton(
            color: PaletaCores.seanGreen(),
            padding: EdgeInsets.fromLTRB(28, 4, 28, 4),
            elevation: 5,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10),
            ),
            child: Text('Salvar', style: TextStyle(fontSize: 20)),
            onPressed: () {
              if(_filtroCTX.modelo.isEmpty || _filtroCTX.performanse.isEmpty || _filtroCTX.preco.isEmpty){
                alertFilter(context);
              } else {
              DbApp.editarFilt('filtro', _filtroCTX);
              Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}
