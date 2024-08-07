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

IconData obterIcon(int codigo) {
  return iconMap.keys
      .firstWhere((key) => iconMap[key] == codigo, orElse: () => Icons.error);
}

int obterCodigo(IconData icone) {
  return iconMap[icone] ?? -1;
}

final Map<IconData, int> iconMap = {
  Icons.star: 0,
  Icons.favorite: 1,
  Icons.thumb_up: 2,
  Icons.thumb_down: 3,
  Icons.home: 4,
  Icons.settings: 5,
  Icons.person: 6,
  Icons.shopping_cart: 7,
  Icons.star_border: 8,
  Icons.ac_unit: 9,
  Icons.access_alarm: 10,
  Icons.airplanemode_active: 11,
  Icons.cake: 12,
  Icons.camera_alt: 13,
};
