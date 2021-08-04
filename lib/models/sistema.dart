import 'package:flutter/material.dart';

class Sistema {
  String id;
  String nome;
  String modeloFiltro;
  String perfFiltro;
  String precoFiltro;
  String modeloBomba;
  String perfBomba;
  String precoBomba;

  Sistema({
    @required this.id,
    @required this.nome,
    @required this.modeloFiltro,
    @required this.perfFiltro,
    @required this.precoFiltro,
    @required this.modeloBomba,
    @required this.perfBomba,
    @required this.precoBomba,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'modeloFiltro': modeloFiltro,
      'performanseFiltro': perfFiltro,
      'precoFiltro': precoFiltro,
      'modeloBomba': modeloBomba,
      'performanseBomba': perfBomba,
      'precoBomba': precoBomba,
    };
    return map;
  }

  Sistema.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    modeloFiltro = map['modeloFiltro'];
    perfFiltro = map['performanseFiltro'];
    precoFiltro = map['precoFiltro'];
    modeloBomba = map['modeloBomba'];
    perfBomba = map['performanseBomba'];
    precoBomba = map['precoBomba'];
  }
}