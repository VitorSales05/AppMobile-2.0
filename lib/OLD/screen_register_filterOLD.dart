import 'package:filtro/controllers/alert_forms.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenRegisterFilter extends StatefulWidget {
  @override
  _ScreenRegisterFilter createState() => _ScreenRegisterFilter();
}

class _ScreenRegisterFilter extends State<ScreenRegisterFilter> {
  
  final _modeloController = TextEditingController();
  final _performanseController = TextEditingController();
  bool _validate = false;

 /*  void _register() {
    registerFilter(context, _modeloController.text.toString(),
        _performanseController.text);
  } */

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              //color: Colors.orange,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/background.jfif'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: size.height * .30,
                            width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Cadastrar filtro',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: PaletaCores.white(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: size.height * .40,
                        width: size.width,
                        child: new Form(
                          autovalidate: _validate,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                    controller: _modeloController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        borderSide: const BorderSide(
                                          color: Colors.indigo
                                        ),
                                      ),
                                      fillColor: PaletaCores.white(),
                                      filled: true,
                                      hintText: 'Modelo Filtro',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                    controller: _performanseController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        borderSide: const BorderSide(
                                          color: Colors.indigo
                                        ),
                                      ),
                                      fillColor: PaletaCores.white(),
                                      filled: true,
                                      hintText: 'Filtragem de L/h',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: size.height * .30,
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RaisedButton(
                              textColor: PaletaCores.black(),
                              color: PaletaCores.cyanLight(),
                              elevation: 10,
                              padding: EdgeInsets.fromLTRB(57, 33, 57, 33),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: PaletaCores.blueDark()),
                              ),
                              child: Text('Salvar',
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                          //      _register();
                              },
                            ),
                            RaisedButton(
                              textColor: PaletaCores.black(),
                              color: PaletaCores.cyanLight(),
                              elevation: 15,
                              padding: EdgeInsets.fromLTRB(48, 33, 48, 33),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: PaletaCores.blueDark()),
                              ),
                              child: Text('Cancelar',
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
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
