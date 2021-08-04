import 'package:filtro/controllers/alert_forms.dart';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/providers/filtros.dart';
import 'package:filtro/providers/sistemas.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


saveSystem(context, String nomeS, String modeloF, String perforF, String precoF, 
  String modeloB, String perforB, String precoB) {

  if(nomeS.isEmpty || modeloF.isEmpty || perforF.isEmpty || precoF.isEmpty || modeloB.isEmpty || perforB.isEmpty || precoB.isEmpty){
    return alertCampNull(context);
  }
  Provider.of<Sistemas>(context, listen: false).
    novoSistema(nomeS, modeloF, perforF, precoF, modeloB, perforB, precoB);
  Navigator.pushNamedAndRemoveUntil(context, AppRoutes.SYSTEM_LIST_PAGE,
            ModalRoute.withName(AppRoutes.HOME_PAGE));
}


//DELETE
deleteFilter(context, String idFiltro) {
  return _deletDialog(context, idFiltro);
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
          Provider.of<Sistemas>(context, listen: false).delelarSistema(table, id);
          Provider.of<Sistemas>(context, listen: false).buscaSistemas();
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
  _modeloController.text = modeloFiltro;
  _performanseController.text = perforFiltro;
  _precoController.text = precoFiltro;

  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      var size = MediaQuery.of(context).size;
      bool _validate = false;

      final camposCad = Container(
        height: size.height * .28,
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
                    hintText: 'Modelo do Filtro',
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
                alertCampNull(context);
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
