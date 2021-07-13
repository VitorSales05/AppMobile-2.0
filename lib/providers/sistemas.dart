import 'dart:math';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/bomba.dart';
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
              total: item['valorTotal'],
              idFiltro: item['filtro_idFiltro'],
              idBomba: item['bomba_idbomba'],
          ),
        )
        .toList();
    notifyListeners();
  }  

  //Adiciona
  void novoSistema(String nomeSist, String totalSist, String idFiltro, String idBomba) {
    final nomeSistema = Sistema(
        id: Random().nextInt(200).toString(),
        nome: nomeSist,
        total: totalSist,
        idFiltro: idFiltro,
        idBomba: idBomba,
    );
    _itens.add(nomeSistema);

    DbApp.inserir('sistema', {
      'id': nomeSistema.id,
      'nome': nomeSistema.nome,
      'valorTotal': nomeSistema.total,
      'filtro_idFiltro': nomeSistema.idFiltro,
      'bomba_idbomba': nomeSistema.idBomba,
    });
    notifyListeners();
  }

  //Deleta
  void delelarSistema(String table, String idSistema) {
    DbApp.apagar(table, idSistema);
    notifyListeners();
  }
}
