import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/bloc_currency.dart';
import '../../../resources/colors.dart';
import '../page_currencies/page_currencies.dart';
import '../page_currencies_two/page_currencies_two.dart';
import '../page_result/page_result.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  late final CurrencyBloc bloc;

  // int selected;

  @override
  void initState() {
    super.initState();
    bloc = context.read<CurrencyBloc>();
    bloc.currencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        bloc: bloc,
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    PageCurrencies(
                      currencies: state.currencies,
                      pageController: pageController,
                    ),
                    PageCurrenciesTwo(
                        pageController: pageController,
                        currencies: state.currenciesSelected),
                    PageCurrenciesResult(
                        pageController: pageController,
                        currencies: state.currenciesPrice)
                  ],
                  onPageChanged: (int index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 150,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => index == currentPage
                          ? indicatorPage(true)
                          : indicatorPage(false),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

indicatorPage(bool isActive) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      color: isActive
          ? CurrencyColors.pageSelected
          : CurrencyColors.pageNotSelected,
      shape: BoxShape.circle,
    ),
  );
}
