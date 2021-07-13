import 'dart:math';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/estado.dart';
import 'package:flutter/material.dart';

/*  "ChangeNotifier" => Notifica o provedor de serviços do DB 
  quando ele precisar realizar alguma ação. */
class Estados with ChangeNotifier {
/*   Lista de estados privada, para que ela não seja acessada externamente.  */
  List<Estado> _itens = [];


  //Retorna uma COPIA da lista atraves do comando "...".
  List<Estado> get itens {
    return [..._itens];
  }

  //Retorna a quantidade de itens da lista
  int get estadosQuantidade {
    return _itens.length;
  }

  //Retorna o id de um item da lista
  Estado getEstado(int index) {
    return _itens[index];
  }

  //Busca os dados do DB e converte eles para uma ArrayList.
  Future<void> buscaItens() async {
    final dataList = await DbApp.buscaDados('Estado');
    _itens = dataList
        .map(
          (item) => Estado(
              id: item['id'],
              name: item['name'],
              tarifa: item['tarifa'],
          ),
        )
        .toList();
    notifyListeners();
  }

  //Adiciona estados no BD.
  void novoEstado(String name, double tarifa) {
    final novoEstado = Estado(
        id: Random().nextDouble().toString(),
        name: name,
        tarifa: tarifa);
    _itens.add(novoEstado);

    DbApp.inserir('Estado', {
      'id': novoEstado.id,
      'name': novoEstado.name,
      'tarifa': novoEstado.tarifa
    });
    notifyListeners();
  }
}
