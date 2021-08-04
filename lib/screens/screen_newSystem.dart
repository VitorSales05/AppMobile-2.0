import 'package:filtro/controllers/controller_system.dart';
import 'package:filtro/controllers/controller_searchComponent.dart';
import 'package:filtro/controllers/controller_simulation.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';

class ScreenNewSystem extends StatefulWidget {
  @override
  _ScreenNewSystem createState() => _ScreenNewSystem();
}

class _ScreenNewSystem extends State<ScreenNewSystem> {
  final _nomeSistema = TextEditingController();
  final _modeloFiltroController = TextEditingController();
  final _performanseFiltroController = TextEditingController();
  final _precoFiltroController = TextEditingController();
  final _modeloBombaController = TextEditingController();
  final _performanseBombaController = TextEditingController();
  final _precoBombaController = TextEditingController();

  void _register() {
    saveSystem(
      context,
      _nomeSistema.text.toString(),
      _modeloFiltroController.text.toString(),
      _performanseFiltroController.text.toString(),
      _precoFiltroController.text.toString(),
      _modeloBombaController.text.toString(),
      _performanseBombaController.text.toString(),
      _precoBombaController.text.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                 //   color: Colors.brown,
                    height: size.height * .13,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Cadastrar sistema',
                          style: TextStyle(
                              fontSize: 37,
                              color: PaletaCores.black(),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .7,
                    width: size.width,
                    child: new Form(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextField(
                                      controller: _nomeSistema,
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
                                        labelText: 'Nome do sistema',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextField(
                                      controller: _modeloFiltroController,
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
                                        labelText: 'Modelo do filtro',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: _performanseFiltroController,
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
                                        labelText: 'Litros filtrados por hora',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: _precoFiltroController,
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
                                        labelText: 'Preço do filtro',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextField(
                                      controller: _modeloBombaController,
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
                                        labelText: 'Modelo da bomba',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: _performanseBombaController,
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
                                        labelText: 'Litros bombeados por hora',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: _precoBombaController,
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
                                        labelText: 'Preço da bomba',
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
                    height: size.height * .12,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          color: PaletaCores.grafite(),
                          elevation: 15,
                          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: PaletaCores.lightBlue()),
                          ),
                          child: Text('Cancelar',
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: PaletaCores.lightBlue())),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        RaisedButton(
                          color: PaletaCores.grafite(),
                          elevation: 15,
                          padding: const EdgeInsets.fromLTRB(38, 15, 38, 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: PaletaCores.lightBlue()),
                          ),
                          child: Text('Salvar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: PaletaCores.lightBlue())),
                          onPressed: () {
                            _register();
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
