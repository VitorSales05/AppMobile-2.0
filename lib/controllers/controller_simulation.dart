import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';

startSimulation(context, String modelo, String performanse, String tarifa, String litros) {
  if (tarifa.isEmpty || litros.isEmpty) {
    return _alertDialogVazio(context);
  }

  double litrosUtilizados = double.parse(litros);
  double mtrCubicos = litrosUtilizados / 1000;
  double tarifaEstadual = double.parse(tarifa);

  double retornoFinanceiro = mtrCubicos * tarifaEstadual / 100 * 30;
  double economiaLitros = litrosUtilizados / 100 * 30;
   double performanseFiltro = double.parse(performanse);


  var retorno = double.parse(retornoFinanceiro.toStringAsFixed(2));
  var aguaEco = double.parse(economiaLitros.toStringAsFixed(2));
  double tempo = litrosUtilizados / performanseFiltro / 24;  
  var tmpGasto = tempo.round();
  if(tmpGasto < 1) {tmpGasto = 1;}
    
  return _alertDialogResult(context, retorno, aguaEco, tmpGasto);

/* 
LU =  Litros Utilizados;
TE =  Tarifa Estadual;
EL =  Econimoia Litros;
T$ =  Total R$;
M3 =  Metros 3;
R$ =  Retorno R$;

R$ = M3 * TE / 100 * 30

M3 =  LU / 1000;
EL =  LU / 100 * 30;
T$ =  LU / M3 * TE;
R$ =  T$ / 100 * 30;
*/
}

void _alertDialogResult(BuildContext context, double retorno, double quantidade, int tmpGasto) {
  Widget okButton = RaisedButton(
    color: PaletaCores.seanGreen(),
    padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
    elevation: 5,
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(10),
    ),
    child: Text('CONCLUIR SIMULAÇÃO', style: TextStyle(fontSize: 20)),
    onPressed: () {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.HOME_PAGE,
          ModalRoute.withName(AppRoutes.HOME_PAGE));
    },
  );

  AlertDialog alerta = AlertDialog(
    title: Text(
      'Economias',
      style: TextStyle(fontSize: 25),
      textAlign: TextAlign.center,
    ),
    content: Text(
      'Retorno: R\$ ${retorno}\nEconomia: ${quantidade}L\nTempo estimado: ${tmpGasto} dia(s)',
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

void _alertDialogVazio(BuildContext context) {
  Widget okButton = RaisedButton(
    color: PaletaCores.fireBrick(),
    padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
    elevation: 5,
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(10),
    ),
    child: Text('OK', style: TextStyle(fontSize: 25)),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alerta = AlertDialog(
    title: Text('Preencha todos os campos!', style: TextStyle(fontSize: 25)),
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
