import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/bloc_currency.dart';
import '../../../core/models/enum/currency_type_enum.dart';
import '../../../resources/colors.dart';
import '../../../resources/strings.dart';
import '../../../resources/text_style.dart';

class PageCurrenciesTwo extends StatefulWidget {
  final List<String> currencies;
  final PageController pageController;

  const PageCurrenciesTwo({
    Key? key,
    required this.currencies,
    required this.pageController,
  }) : super(key: key);

  @override
  State<PageCurrenciesTwo> createState() => _PageCurrenciesTwoState();
}

class _PageCurrenciesTwoState extends State<PageCurrenciesTwo> {
  final List selectCurrency = [];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CurrencyBloc>();
    bloc.currenciesToTwoPage();
    final theme = Theme.of(context);
    final currencyNameSelected = bloc.state.currencyNameSelected;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Text(
          Strings.titlePageTwo,
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: Strings.descriptionPageTwo,
            style: theme.textTheme.bodyLarge,
            children: [
              TextSpan(
                text: currencyNameSelected,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.currencies.length,
            itemBuilder: (context, index) {
              final currency = CurrencyTypeName.toCurrency(
                widget.currencies[index],
              );
              final currencyName = widget.currencies[index];
              bool isSelected = selectCurrency.contains(currencyName);
              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
                child: ListTile(
                  tileColor: CurrencyColors.backgroundTextTile,
                  title: Text(
                    currency,
                    style: isSelected
                        ? CurrencyTextStyles.textListTileSelected
                        : CurrencyTextStyles.textListTileNotSelected,
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        style: BorderStyle.solid,
                        color: isSelected
                            ? CurrencyColors.iconListTileSelected
                            : CurrencyColors.backgroundTextTile,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      )),
                  leading: Icon(
                    Icons.attach_money_sharp,
                    color: isSelected
                        ? CurrencyColors.textListTileSelected
                        : CurrencyColors.textListTile,
                  ),
                  selectedTileColor: CurrencyColors.backgroundTextTile,
                  selected: isSelected,
                  onTap: () {
                    if (selectCurrency.contains(currencyName)) {
                      selectCurrency.remove(widget.currencies[index]);
                      bloc.state.currenciesSelectedToApi.remove(currencyName);
                    } else {
                      selectCurrency.add(widget.currencies[index]);
                      bloc.getSelectedCurrencies(currencyName);
                    }
                  },
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 52, right: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  fixedSize: const Size.fromWidth(163),
                  primary: CurrencyColors.nextButton,
                  onPrimary: CurrencyColors.textNextButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  bloc.getCurrenciesResult(bloc.state.currencyCodeSelected,
                      bloc.state.currenciesSelectedToApi);
                  Future.delayed(
                    const Duration(milliseconds: 1500),
                    () async {
                      widget.pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.ease);
                    },
                  );
                },
                child: bloc.state.status == Status.loading
                    ? const Text(Strings.loadingButton)
                    : const Text(Strings.nextButton),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
