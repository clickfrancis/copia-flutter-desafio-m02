import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/bloc_currency.dart';
import '../../../core/models/enum/currency_type_enum.dart';
import '../../../resources/colors.dart';
import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';

class PageCurrenciesResult extends StatefulWidget {
  final List currencies;
  final PageController pageController;
  const PageCurrenciesResult({
    Key? key,
    required this.currencies,
    required this.pageController,
  }) : super(key: key);

  @override
  State<PageCurrenciesResult> createState() => _PageCurrenciesResultState();
}

class _PageCurrenciesResultState extends State<PageCurrenciesResult> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CurrencyBloc>();
    bloc.currenciesToTwoPage();
    final currencyNameSelected = bloc.state.currencyNameSelected;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Text(
          Strings.titlePageThree,
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: Strings.descriptionPageThree,
            style: theme.textTheme.bodyLarge,
            children: [
              TextSpan(
                text: currencyNameSelected,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
            child: widget.currencies.isNotEmpty
                ? ListView.builder(
                    itemCount: widget.currencies.length,
                    itemBuilder: (context, index) {
                      final currency = CurrencyCode.toCurrency(
                          widget.currencies[index].code);

                      final double bid =
                          double.parse(bloc.state.currenciesPrice[index].bid);

                      return Padding(
                        padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
                        child: ListTile(
                          tileColor: CurrencyColors.backgroundTextTile,
                          title: Text(
                            currency,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: const Color(0xFFABB0AD)),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          )),
                          leading: const Icon(Icons.attach_money_sharp),
                          selectedTileColor: Colors.blue,
                          selectedColor: Colors.blue,
                          trailing: Text(bid.toStringAsFixed(3),
                              style: bid < 1
                                  ? CurrencyTextStyles.textTrailing.copyWith(
                                      color: CurrencyColors
                                          .trailingTextListTileTypeOn)
                                  : bid >= 5
                                      ? CurrencyTextStyles.textTrailing
                                          .copyWith(
                                              color: CurrencyColors
                                                  .trailingTextListTileTypeTwo)
                                      : CurrencyTextStyles.textTrailing.copyWith(
                                          color: CurrencyColors
                                              .trailingTextListTileTypeThree)),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                        Icon(Icons.warning_amber_rounded,
                            color: CurrencyColors.doneButton, size: 80),
                        Text(Strings.errorMessage)
                      ]))),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 52, right: 12),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    fixedSize: const Size.fromWidth(163),
                    primary: CurrencyColors.doneButton,
                    onPrimary: CurrencyColors.textDoneButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    bloc.clearCurrencyCurrenciesResult();
                    widget.pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.ease);
                  },
                  child: const Text('Concluir')),
            ),
          ],
        )
      ]),
    );
  }
}
