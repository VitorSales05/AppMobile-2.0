import 'package:flutter/material.dart';


class Bomba {
  String id;
  String modelo;
  String performanse;
  String preco;

  Bomba({
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

  Bomba.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    modelo = map['modelo'];
    performanse = map['performanse'];
    preco = map['preco'];
  }
}