import 'package:flutter/material.dart';
import 'package:src/model/categoriaModel.dart';
import 'package:src/Entidade/conta.dart';
import 'package:src/Enumerador/tiposDeTrasacao.dart';

class TransacaoModel {
  late IconData icone;
  late String nome;
  late double valorTranzacao;
  late EnumTransacao? enumTransacao;
  late DateTime datatransacao;
  late CategoriaModel categoria;
  late Conta contaSaida;
  late Conta contaEntrada;

  TransacaoModel({
    required this.nome,
    required this.valorTranzacao,
    required this.enumTransacao,
    required this.datatransacao,
    required this.categoria,
    required this.contaSaida,
    required this.contaEntrada,
  }) {
    if (enumTransacao != null) {
      switch (enumTransacao) {
        case EnumTransacao.entrada:
          icone = Icons.arrow_downward;
          break;
        case EnumTransacao.saida:
          icone = Icons.arrow_upward;
          break;
        case EnumTransacao.transferencia:
          icone = Icons.compare_arrows;
          break;
        default:
          icone = Icons.error;
      }
    }
  }
}
