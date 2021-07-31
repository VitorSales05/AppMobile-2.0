import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';

alertCampNull(context) {
  return _alertCampNull(context);
}
void _alertCampNull(BuildContext context) {
  Widget okButton = RaisedButton(
    color: PaletaCores.fireBrick(),
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
