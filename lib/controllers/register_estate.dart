import 'package:filtro/providers/filtros.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


registerEstate(context, String modelo, String performanse, String preco) {

  if(modelo.isEmpty || performanse.isEmpty || preco.isEmpty){
    return _alertDialog(context);
  }

  Provider.of<Filtros>(context, listen: false).
    novoFiltro(modelo , performanse, preco);
  Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
}


void _alertDialog(BuildContext context){
  Widget okButton = FlatButton(
    child: Text('OK', style: TextStyle(fontSize: 20)),
    onPressed: () { 
      Navigator.pop(context); 
    }, 
  );

  AlertDialog alerta = AlertDialog(
    title: Text('Preencha todos os campos.'),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context){
      return alerta;
    },  
  );
}