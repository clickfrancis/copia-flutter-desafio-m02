import 'package:desafio_modulo_02/core/bloc/bloc_currency.dart';
import 'package:desafio_modulo_02/features/pages/home/onboarding_home_page.dart';
import 'package:flutter/material.dart';
import '../../../core/repositories/api_currency.dart';
import '../../../resources/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCurrency extends StatefulWidget {
  const HomeCurrency({Key? key}) : super(key: key);

  @override
  State<HomeCurrency> createState() => _HomeCurrencyState();
}

class _HomeCurrencyState extends State<HomeCurrency> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: CurrencyThemes.dark,
      home: BlocProvider(
        create: ((context) => CurrencyBloc(ApiCurrency())),
        child: const OnBoardingPage(),
      ),
    );
  }
}
