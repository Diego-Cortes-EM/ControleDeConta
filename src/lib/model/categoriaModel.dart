import 'dart:ffi';

import 'package:flutter/material.dart';

class CategoriaModel {
  int id;
  IconData icone;
  String nome;

  CategoriaModel({
    required this.id,
    required this.icone,
    required this.nome,
  });
}
