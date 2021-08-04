import 'dart:math';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/bomba.dart';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/models/sistema.dart';
import 'package:flutter/material.dart';

/*  "ChangeNotifier" => Notifica o provedor de serviços do DB 
  quando ele precisar realizar alguma ação. */
class Sistemas with ChangeNotifier {
/*   Lista de filtros privada, para que ela não seja acessada externamente.  */
  List<Sistema> _itens = [];

  //Retorna uma COPIA da lista atraves do comando "...".
  List<Sistema> get itens {
    return [..._itens];
  }

  //Retorna a quantidade de itens da lista
  int get sistemasQuantidade {
    return _itens.length;
  }

  //Retorna o id de um item da lista
  Sistema getSistema(int index) {
    return _itens[index];
  }

  //Busca e converte em ArrayList.
  Future<void> buscaSistemas() async {
    final dataList = await DbApp.buscaDados('sistema');
    _itens = dataList
        .map(
          (item) => Sistema(
              id: item['id'],
              nome: item['nome'],
              modeloFiltro: item['modeloFiltro'],
              perfFiltro: item['performanseFiltro'],
              precoFiltro: item['precoFiltro'],
              modeloBomba: item['modeloBomba'],
              perfBomba: item['performanseBomba'],
              precoBomba: item['precoBomba'],
          ),
        )
        .toList();
    notifyListeners();
  }  

  //Adiciona
  void novoSistema(String nome, String modFiltro, String perfFiltro,  String precoFiltro, String modBomba, String perfBomba, String precoBomba) {
    final novoSistema = Sistema(
        id: Random().nextInt(200).toString(),
        nome: nome,
        modeloFiltro: modFiltro,
        perfFiltro: perfFiltro,
        precoFiltro: precoFiltro,
        modeloBomba: modBomba,
        perfBomba: perfBomba,
        precoBomba: precoBomba,
    );
    _itens.add(novoSistema);

    DbApp.inserir('sistema', {
      'id': novoSistema.id,
      'nome': novoSistema.nome,
      'modeloFiltro': novoSistema.modeloFiltro,
      'performanseFiltro': novoSistema.perfFiltro,
      'precoFiltro': novoSistema.precoFiltro,
      'modeloBomba': novoSistema.modeloBomba,
      'performanseBomba': novoSistema.perfBomba,
      'precoBomba': novoSistema.precoBomba,
    });
    notifyListeners();
  }

  //Deleta
  void delelarSistema(String table, String idSistema) {
    DbApp.apagar(table, idSistema);
    notifyListeners();
  }
}
