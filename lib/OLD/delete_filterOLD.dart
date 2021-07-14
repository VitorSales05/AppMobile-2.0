import 'package:filtro/providers/filtros.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

__deleteFilter(context, String idFiltro) {
  return _showDialog(context, idFiltro);
}

void _showDialog(BuildContext context, String id) {
  var table = 'filtro';

  Widget okButton = RaisedButton(
        color: PaletaCores.cyan(),
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
        color: PaletaCores.fireBrick(),
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        elevation: 5,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10),
        ),
        child: Text('Sim', style: TextStyle(fontSize: 20)),
        onPressed: () {
          Provider.of<Filtros>(context, listen: false).delelarFiltro(table, id);
        //  Provider.of<Filtros>(context, listen: false).buscaItens();
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
