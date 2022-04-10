import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text_style.dart';

class CurrencyThemes {
  static final dark = ThemeData(
    textTheme: GoogleFonts.interTextTheme(darkTextTheme),
    colorScheme: const ColorScheme.dark(
      background: Color(0xFF292929),
      onSecondary: Color(0xFF292929),
      primary: Color(0xFF292929),
    ),
  );

  static final darkTextTheme = TextTheme(
    headlineMedium: CurrencyTextStyles.textTitlePage.copyWith(
      color: const Color(0xFF2555FF),
    ),
    headlineSmall: CurrencyTextStyles.textTitlePage,
    bodyLarge: CurrencyTextStyles.textPage,
  );
}
