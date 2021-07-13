import 'package:filtro/models/filtro.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


/* class ScreenFilter extends StatefulWidget {
  @override
  _ScreenFilter createState() => _ScreenFilter(Filtro());
} */

class ScreenEditFilterState extends StatefulWidget {
  final Filtro filtro;
  ScreenEditFilterState({this.filtro});

  @override
  _ScreenEditFilterState createState() => _ScreenEditFilterState();
}

class _ScreenEditFilterState extends State<ScreenEditFilterState> {

  final _modeloController = TextEditingController();
  final _performanseController = TextEditingController();

  Filtro _editaFiltro;

  @override
  void initState(){
    super.initState();
    _editaFiltro = Filtro.fromMap(widget.filtro.toMap());

    _modeloController.text = _editaFiltro.modelo;
    _performanseController.text = _editaFiltro.performanse;
  }

  bool _validate = false;

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
                                  'Editar filtro',
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
                                child: TextFormField(
                                 controller: _modeloController,
                                 onChanged: (text){
                                   _editaFiltro.modelo = text;
                                 },
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: const BorderSide(
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    fillColor: PaletaCores.white(),
                                    filled: true,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: TextFormField(
                                controller: _performanseController,
                                onChanged: (text){
                                   _editaFiltro.performanse = text;
                                 },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: const BorderSide(
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    fillColor: PaletaCores.white(),
                                    filled: true,
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
                                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Navigator.pop(context, _editaFiltro);
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
                                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.FILTER_LIST_PAGE,
                                  ModalRoute.withName(AppRoutes.HOME_PAGE));
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