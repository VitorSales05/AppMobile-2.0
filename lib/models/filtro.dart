import 'package:flutter/material.dart';


class Filtro {
  String id;
  String modelo;
  String performanse;
  String preco;

  Filtro({
    @required this.id,
    @required this.modelo,
    @required this.performanse,
    @required this.preco,
  }); 


  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'modelo': modelo,
      'performanse': performanse,
      'preco': preco,
    };
    return map;
  }

  Filtro.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    modelo = map['modelo'];
    performanse = map['performanse'];
    preco = map['preco'];
  }
}