import 'package:filtro/controllers/alert_forms.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';

startSimulation(context, String nomeSistema, String modeloFiltro, String perforFiltro, String precoFiltro, 
  String modeloBomba, String perforBomba, String precoBomba, String tarifa, String litros,
 ) {
  if (tarifa.isEmpty || litros.isEmpty) {
    return alertCampNull(context);
  }

  /// variaveis  ///
  double ltsUtilizados = double.parse(litros);
  double tarifaEstadual = double.parse(tarifa);
  double valorFiltro = double.parse(precoFiltro);
  double valorBomba = double.parse(precoBomba);
  double perfFiltro = double.parse(perforFiltro);
  

  /// formulas ///
  double ltsEconomizados = ltsUtilizados / 100 * 70; 
  double mtrCubicos = ltsEconomizados / 1000; 
  double retornoFinanceiro = mtrCubicos * tarifaEstadual; ///// retorno

//  double perfDiariaFiltro = perfFiltro * 24;    //////// tempo filtragem
//  double tempoFiltragem = ltsUtilizados / perfDiariaFiltro;
   
  double valorTotalSistema = valorFiltro + valorBomba;
  
  double tem = valorTotalSistema / retornoFinanceiro;
 // double temmm = tem * retornoFinanceiro;


  
  

 // double retornoFinanceiro = mtrCubicos * tarifaEstadual / 100 * 30;
 // double economiaLitros = ltsUtilizados / 100 * 30;
 // double performanseFiltro = double.parse(performanse);


  
  var aguaEco = double.parse(ltsEconomizados.toStringAsFixed(2));
  var retornoQtd = double.parse(retornoFinanceiro.toStringAsFixed(2));
  double tempo = tem;  
  var tmpGasto = tempo.round();
  if(tmpGasto < 1) {tmpGasto = 1;}

  return _alertDialogResult(context, aguaEco, retornoQtd, tmpGasto);
}

void _alertDialogResult(BuildContext context, double agua, double retornoInfo, int tmpGasto) {
  Widget okButton = RaisedButton(
    color: PaletaCores.seanGreen(),
    padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
    elevation: 5,
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(10),
    ),
    child: Text('CONCLUIR SIMULAÇÃO', style: TextStyle(fontSize: 18)),
    onPressed: () {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.HOME_PAGE,
          ModalRoute.withName(AppRoutes.HOME_PAGE));
    },
  );

  AlertDialog alerta = AlertDialog(
    title: Text(
      'Economias',
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
    ),
    content: Text(
      'Litros economizados: ${agua}L\n\nRetorno em relação ao informado: R\$${retornoInfo}\n\nTempo para retorno do valor investido: ${tmpGasto} dias',
      style: TextStyle(fontSize: 23),
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
