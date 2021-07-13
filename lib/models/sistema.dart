
import 'package:flutter/cupertino.dart';

class Sistema {
  String id;
  String nome;
  String total;
  String idFiltro;
  String idBomba;

  Sistema({
    @required this.id,
    @required this.nome,
    @required this.total,
    @required this.idFiltro,
    @required this.idBomba,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'valorTotal': total,
      'filtro_idFiltro': idFiltro,
      'bomba_idbomba': idBomba,
    };
    return map;
  }

  Sistema.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    total = map['valorTotal'];
    idFiltro = map['filtro_idFiltro'];
    idBomba = map['bomba_idbomba'];
  }
}