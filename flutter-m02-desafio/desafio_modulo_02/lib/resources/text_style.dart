import 'package:flutter/material.dart';

import 'colors.dart';

class CurrencyTextStyles {
  static const textTitlePage = TextStyle(
    fontSize: 24.0,
    color: CurrencyColors.textTitlePage,
    fontWeight: FontWeight.w700,
  );

  static const textPage = TextStyle(
    fontSize: 18.0,
    color: CurrencyColors.textPage,
    fontWeight: FontWeight.w400,
  );

  static const textTrailing = TextStyle(
    fontSize: 20.0,
    color: CurrencyColors.textPage,
    fontWeight: FontWeight.w700,
  );

  static const textListTileNotSelected = TextStyle(
    fontSize: 18.0,
    color: CurrencyColors.textListTile,
    fontWeight: FontWeight.w300,
  );

  static const textListTileSelected = TextStyle(
    fontSize: 18.0,
    color: CurrencyColors.textListTileSelected,
    fontWeight: FontWeight.w600,
  );

  static const textCurrency = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: CurrencyColors.textPage);
}
