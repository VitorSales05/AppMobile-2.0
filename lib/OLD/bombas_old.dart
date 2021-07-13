import 'dart:math';
import 'package:filtro/data/db_app.dart';
import 'package:filtro/models/bomba.dart';
import 'package:flutter/material.dart';

/*  "ChangeNotifier" => Notifica o provedor de serviços do DB 
  quando ele precisar realizar alguma ação. */
class Bombas1 with ChangeNotifier {
/*   Lista de Bombas privada, para que ela não seja acessada externamente.  */
  List<Bomba> _itens = [];

  //Retorna uma COPIA da lista atraves do comando "...".
  List<Bomba> get itens {
    return [..._itens];
  }

  //Retorna a quantidade de itens da lista
  int get bombasQuantidade {
    return _itens.length;
  }

  //Retorna o id de um item da lista
  Bomba getBomba(int index) {
    return _itens[index];
  }

  //Busca e converte em ArrayList.
 /*  Future<void> buscaBombas() async {
    final dataList = await DbApp.buscaDados('bomba');
    _itens = dataList
        .map(
          (item) => Bomba(
              id: item['id'],
              modelo: item['modelo'],
              performanse: item['performanse'],
          ),
        )
        .toList();
    notifyListeners();
  }
  

  //Adiciona
  void novaBomba(String modelo, String perforBomba) {
    final novaBomba = Bomba(
        id: Random().nextInt(200).toString(),
        modelo: modelo,
        performanse: perforBomba,
    );
    _itens.add(novaBomba);

    DbApp.inserir('bomba', {
      'id': novaBomba.id,
      'modelo': novaBomba.modelo,
      'performanse': novaBomba.performanse
    });
    notifyListeners();
  } */

  //Deleta
  void delelarBomba(String tabela, String idBomba) {
    DbApp.apagar(tabela, idBomba);
    notifyListeners();
  }
}
