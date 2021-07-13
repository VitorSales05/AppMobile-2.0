import 'dart:math';
import 'package:filtro/models/filtro.dart';
import 'package:filtro/data/db_app.dart';
import 'package:flutter/material.dart';

/*  "ChangeNotifier" => Notifica o provedor de serviços do DB 
  quando ele precisar realizar alguma ação. */
class Filtros with ChangeNotifier {
/*   Lista de filtros privada, para que ela não seja acessada externamente.  */
  List<Filtro> _itens = [];


  //Retorna uma COPIA da lista atraves do comando "...".
  List<Filtro> get itens {
    return [..._itens];
  }

  //Retorna a quantidade de itens da lista
  int get filtrosQuantidade {
    return _itens.length;
  }

  //Retorna o id de um item da lista
  Filtro getFiltro(int index) {
    return _itens[index];
  }

  //Busca os dados do DB e converte eles para uma ArrayList.
  Future<void> buscaItens() async {
    final dataList = await DbApp.buscaDados('filtro');
    _itens = dataList
        .map(
          (item) => Filtro(
              id: item['id'],
              modelo: item['modelo'],
              performanse: item['performanse'],
              preco: item['preco'],
          ),
        )
        .toList();
    notifyListeners();
  }

  //Adiciona filtros no BD.
  void novoFiltro(String modelFiltro, String perforFiltro, String precoFiltro) {
    final novoFiltro = Filtro(
        id: Random().nextDouble().toString(),
        modelo: modelFiltro,
        performanse: perforFiltro,
        preco: precoFiltro,
        );
    _itens.add(novoFiltro);

    DbApp.inserir('filtro', {
      'id': novoFiltro.id,
      'modelo': novoFiltro.modelo,
      'performanse': novoFiltro.performanse,
      'preco': novoFiltro.preco,
    });
    notifyListeners();
  }
}
