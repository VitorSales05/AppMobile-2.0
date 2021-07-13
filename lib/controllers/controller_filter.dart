import 'package:filtro/controllers/alert_forms.dart';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/providers/filtros.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

saveFilter(BuildContext context) {
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      final _modeloController = TextEditingController();
      final _performanseController = TextEditingController();
      final _precoController = TextEditingController();
      var size = MediaQuery.of(context).size;
      bool _validate = false;

      _register() {
        var modelo = _modeloController.text.toString();
        var performanse = _performanseController.text.toString();
        var preco = _precoController.text.toString();

        if (modelo.isEmpty || performanse.isEmpty || preco.isEmpty) {
          return alertFilter(context/* , modelo, performanse, preco */);
        }
        Provider.of<Filtros>(context, listen: false)
            .novoFiltro(modelo, performanse, preco);
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.FILTER_LIST_PAGE,
            ModalRoute.withName(AppRoutes.HOME_PAGE));
      }

      final camposCad = Container(
        height: size.height * .35,
        width: size.width,
        child: new Form(
          autovalidate: _validate,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _modeloController,
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
                  controller: _performanseController,
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
                  controller: _precoController,
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
          'Cadastrar filtro',
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
                  AppRoutes.FILTER_LIST_PAGE,
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
            child: Text('Cadastrar', style: TextStyle(fontSize: 20)),
            onPressed: () {
              _register();
            },
          ),
        ],
      );
    },
  );
}

//DELETE
deleteFilter(context, String idFiltro) {
  return _deletDialog(context, idFiltro);
}

void _deletDialog(BuildContext context, String id) {
  var table = 'filtro';

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
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.FILTER_LIST_PAGE,
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
editFilter(context, Filtro filtro) {
  return _editDialog(context, filtro);
}

void _editDialog(BuildContext context, Filtro filtro) {
  Filtro _filtroCTX;
  _filtroCTX = Filtro.fromMap(filtro.toMap());

  var modeloFiltro = filtro.modelo;
  var perforFiltro = filtro.performanse;
  var precoFiltro = filtro.preco;

  final _modeloController = TextEditingController();
  final _performanseController = TextEditingController();
  final _precoController = TextEditingController();

  /* void initState(){
    super.initState();
    filtroCTX = Filtro.fromMap(widget.filtro.toMap());
  } */

  _modeloController.text = modeloFiltro;
  _performanseController.text = perforFiltro;
  _precoController.text = precoFiltro;

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
                  controller: _modeloController,
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
                  controller: _performanseController,
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
                  controller: _precoController,
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
                  AppRoutes.FILTER_LIST_PAGE,
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
