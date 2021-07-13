import 'dart:math';
import 'package:filtro/models/bomba.dart';
import 'package:filtro/data/db_app.dart';
import 'package:flutter/material.dart';

/*  "ChangeNotifier" => Notifica o provedor de serviços do DB 
  quando ele precisar realizar alguma ação. */
class Bombas with ChangeNotifier {
/*   Lista de filtros privada, para que ela não seja acessada externamente.  */
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
  Future<void> buscaBombas() async {
    final dataList = await DbApp.buscaDados('bomba');
    _itens = dataList
        .map(
          (item) => Bomba(
              id: item['id'],
              modelo: item['modelo'],
              performanse: item['performanse'],
              preco: item['preco']
          ),
        )
        .toList();
    notifyListeners();
  }
  

  //Adiciona
  void novaBomba(String modelBomba, String perforBomba, String precoBomba) {
    final novaBomba = Bomba(
        id: Random().nextInt(200).toString(),
        modelo: modelBomba,
        performanse: perforBomba,
        preco: precoBomba,
    );
    _itens.add(novaBomba);

    DbApp.inserir('filtro', {
      'id': novaBomba.id,
      'modelo': novaBomba.modelo,
      'performanse': novaBomba.performanse,
      'preco': novaBomba.preco,
    });
    notifyListeners();
  }

  //Deleta
  void delelarBomba(String table, String idBomba) {
    DbApp.apagar(table, idBomba);
    notifyListeners();
  }
}
