import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';

alertFilter(context /* , String modelo, String performanse, String preco */) {
  // if(modelo.isEmpty || performanse.isEmpty || preco.isEmpty){
  return _alertFilter(context);
  // }
}

void _alertFilter(BuildContext context) {
  Widget okButton = RaisedButton(
    color: PaletaCores.cyan(),
    elevation: 5,
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(10),
    ),
    child: Text('OK', style: TextStyle(fontSize: 20)),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alerta = AlertDialog(
    title: Text(
      'Preencha todos os campos!',
      style: TextStyle(fontSize: 22),
    ),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}

alertBomb(context) {
  return _alertBomb(context);
}

void _alertBomb(BuildContext context) {
  Widget okButton = RaisedButton(
    color: PaletaCores.cyan(),
    elevation: 5,
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(10),
    ),
    child: Text('OK', style: TextStyle(fontSize: 20)),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alerta = AlertDialog(
    title: Text(
      'Preencha todos os campos!',
      style: TextStyle(fontSize: 22),
    ),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
