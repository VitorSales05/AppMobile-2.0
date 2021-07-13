import 'package:filtro/controllers/start_simulation.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';

class ScreenSimulation extends StatelessWidget {
  final Filtro filtro;
  ScreenSimulation(this.filtro);
  final _litrosController = TextEditingController();
  final _estadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    _simulation() {
      startSimulation(
        context,
        filtro.modelo,
        filtro.performanse,
        _estadoController.text.toString(),
        _litrosController.text.toString(),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: PaletaCores.blueHome(),
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: size.height * .20,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Simulação',
                          style: TextStyle(
                              fontSize: 37,
                              color: PaletaCores.black(),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .55,
                    width: size.width,
                    child: new Form(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Sistema: ${filtro.modelo}',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w500,
                                color: PaletaCores.white(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Filtro: ${filtro.modelo}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: PaletaCores.white(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Bomba: ${filtro.modelo}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: PaletaCores.white(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Total invertido: R\$ ${filtro.preco}',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: PaletaCores.white(),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: _estadoController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          fillColor: PaletaCores.gray(),
                                          filled: true,
                                          labelText: 'Tarifa estadual',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: _litrosController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                          fillColor: PaletaCores.gray(),
                                          filled: true,
                                          labelText: 'Litros a serem tratados',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .25,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                         // textColor: PaletaCores.white(),
                          color: PaletaCores.white(),
                          elevation: 15,
                          padding: const EdgeInsets.fromLTRB(48, 33, 48, 33),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: PaletaCores.blueDark()),
                          ),
                          child: Text('Cancelar',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold, color: PaletaCores.black())),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        RaisedButton(
                        //  textColor: PaletaCores.black(),
                          color: PaletaCores.cyanLight(),
                          elevation: 15,
                          padding: const EdgeInsets.fromLTRB(43, 22, 43, 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: PaletaCores.blueDark()),
                          ),
                          child: Text('Realizar\nsimulação',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold, color: PaletaCores.white())),
                          onPressed: () {
                            _simulation();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* 
              padding: new EdgeInsets.all(32.0),
              child: ListTile(
                title: Text("Modelo: {filtro.modelo}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center),
                subtitle: Text("Performanse: {filtro.performanse} L/h",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    textAlign: TextAlign.center),
              ),
            ),
            TextFormField(
              controller: _litrosControler,
              decoration: const InputDecoration(
                icon: const Icon(Icons.spellcheck),
                hintText: 'Quantidade Para filtragem',
                labelText: 'Litros de água a serem tratada',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text(
                'Realizar Simulação',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              elevation: 2,
              color: PaletaCores.blueSecundario(),
              padding: const EdgeInsets.fromLTRB(40, 18, 40, 18),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                //Variáveis para calcular o tempo
                String litrosTratar = _litrosControler.text;
           //     String perforFiltro = filtro.performanse;

                //Calculo do tempo de tratamento
                //Conversão de litros em INT
                var litros = int.parse('$litrosTratar');
                //Capacidade de filtragem em INT
       /////////////////////////////////         var filtragem = int.parse('$perforFiltro');
                //Conversão de litros para o calculo
                var tempLitros = litros * 60;
                //Calculando o tempo de filtragem (em segundos)
      ///////////////////////          var convertSegundos = tempLitros / filtragem;
                //Convertendo o tempo para horas
      //////////////////////////          var result = convertSegundos / 60;


                //Ação do botão da caixa com o resultado
                Widget okButton = FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
                //Caixa com resultado
                AlertDialog resultPerf = AlertDialog(
                  title: Text('Estimativa',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center),
                  content: Text(
                      'Tempo estimado: {result.toStringAsPrecision(2)} hora(s)',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center),
                  actions: [
                    okButton,
                  ],
                );
                // Ativa o formulário de cadastro
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return resultPerf;
                  },
                );
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
          ],
        
      ), */
