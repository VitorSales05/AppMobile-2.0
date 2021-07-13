import 'package:filtro/controllers/controller_filter.dart';
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
  final _precoController = TextEditingController();

  Filtro _editaFiltro;

  @override
  void initState() {
    super.initState();
    _editaFiltro = Filtro.fromMap(widget.filtro.toMap());

    _modeloController.text = _editaFiltro.modelo;
    _performanseController.text = _editaFiltro.performanse;
    _precoController.text = _editaFiltro.preco;
  }

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          
          var size = MediaQuery.of(context).size;

          final camposCad = Container(
            height: size.height * .30,
            width: size.width,
            child: new Form(
              autovalidate: _validate,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _modeloController,
                      onChanged: (text){
                        _editaFiltro.modelo = text;
                      },
                      autofocus: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        fillColor: PaletaCores.grayDark(),
                        filled: true,
                        hintText: 'Modelo Filtro',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _performanseController,
                      onChanged: (text){
                        _editaFiltro.performanse = text;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        fillColor: PaletaCores.grayDark(),
                        filled: true,
                        hintText: 'Filtragem de L/h',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _precoController,
                      onChanged: (text){
                        _editaFiltro.performanse = text;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        fillColor: PaletaCores.grayDark(),
                        filled: true,
                        hintText: 'Filtragem de L/h',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

          return AlertDialog(
            title: Text(
              'Edição',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            content: camposCad,
            actions: <Widget>[
              RaisedButton(
                color: PaletaCores.red(),
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                elevation: 5,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                ),
                child: Text('Cancelar', style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.FILTER_LIST_PAGE,
                      ModalRoute.withName(AppRoutes.HOME_PAGE));
                },
              ),
              RaisedButton(
                color: PaletaCores.seanGreen(),
                padding: EdgeInsets.fromLTRB(28, 4, 28, 4),
                elevation: 5,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                ),
                child: Text('Salvar', style: TextStyle(fontSize: 20)),
                onPressed: () {
                  //  _register();
                  saveFilter(context);
                },
              ),
            ],
          );
        },
      );
  }
}
