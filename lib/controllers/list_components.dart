import 'package:filtro/controllers/alert_forms.dart';
import 'package:filtro/providers/sistemas.dart';
import 'package:filtro/utils/app_routes.dart';
import 'package:filtro/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


searchFilter(BuildContext context) {
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      var size = MediaQuery.of(context).size;
      bool _validate = false;

      _register() {
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.SYSTEM_LIST_PAGE,
            ModalRoute.withName(AppRoutes.HOME_PAGE));
      }

      final camposCad = Container(
        height: size.height * .35,
        width: size.width,
        child: Form(
          autovalidate: _validate,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
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
                    hintText: 'Nome do sistema',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
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
                    hintText: 'Filtro a ser utilizado',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
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
                    hintText: 'Bomba a ser utilizada',
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      return AlertDialog(
        title: Text(
          'Filtros',
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
            child: Text('Voltar', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}




searchBomb(BuildContext context) {
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      var size = MediaQuery.of(context).size;
      bool _validate = false;

      _register() {
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.SYSTEM_LIST_PAGE,
            ModalRoute.withName(AppRoutes.HOME_PAGE));
      }

      final camposCad = Container(
        height: size.height * .35,
        width: size.width,
        child: Form(
          autovalidate: _validate,
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
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
                    hintText: 'Nome do sistema',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
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
                    hintText: 'Filtro a ser utilizado',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
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
                    hintText: 'Bomba a ser utilizada',
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      return AlertDialog(
        title: Text(
          'Bombas',
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
            child: Text('Voltar', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}