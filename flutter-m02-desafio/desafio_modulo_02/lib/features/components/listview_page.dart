import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/bloc_currency.dart';
import '../../core/models/enum/currency_type_enum.dart';
import '../../resources/colors.dart';

class ListViewPage extends StatefulWidget {
  final List<String> currencies;
  final PageController pageController;

  const ListViewPage(
      {Key? key, required this.currencies, required this.pageController})
      : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CurrencyBloc>();
    final theme = Theme.of(context);
    return Expanded(
      child: ListView.builder(
        itemCount: widget.currencies.length,
        itemBuilder: (context, index) {
          context.read<CurrencyBloc>().currencies();
          final currency = CurrencyTypeName.toCurrency(
            widget.currencies[index],
          );
          bool isSelected = _selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
            child: ListTile(
              tileColor: CurrencyColors.backgroundTextTile,
              title: Text(
                currency,
                style: isSelected
                    ? theme.textTheme.bodyLarge!
                        .copyWith(color: const Color(0xFF2555FF))
                    : theme.textTheme.bodyLarge!
                        .copyWith(color: const Color(0xFFABB0AD)),
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
                _selectedIndex = index;
                bloc.getSelectedCurrency(index);
                bloc.getSelectedNameCurrency(currency);
                bloc.getCurrencyNameSelected(widget.currencies[index]);
                widget.pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.ease);
              },
            ),
          );
        },
      ),
    );
  }
}

void onTapOne() {}
