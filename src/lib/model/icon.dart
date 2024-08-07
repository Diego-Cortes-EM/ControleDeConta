import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
IconData ObterIconFixo(int codigo) {
  switch (codigo) {
    case 0:
      return Icons.home;
    case 1:
      return Icons.pivot_table_chart_outlined;

    case 2:
      return Icons.app_registration_outlined;

    case 3:
      return Icons.account_balance_wallet_sharp;

    case 4:
      return Icons.category_rounded;

    default:
      return Icons.error;
  }
}
