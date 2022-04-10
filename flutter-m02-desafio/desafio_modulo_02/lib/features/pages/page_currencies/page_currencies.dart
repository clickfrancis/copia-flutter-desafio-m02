import 'package:flutter/material.dart';
import '../../../resources/strings.dart';
import '../../components/listview_page.dart';

class PageCurrencies extends StatefulWidget {
  final List<String> currencies;
  final PageController pageController;

  const PageCurrencies({
    Key? key,
    required this.currencies,
    required this.pageController,
  }) : super(key: key);

  @override
  State<PageCurrencies> createState() => _PageCurrenciesState();
}

class _PageCurrenciesState extends State<PageCurrencies> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Text(
          Strings.titlePageOne,
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        Text(
          Strings.descriptionPageOne,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        ListViewPage(
            currencies: widget.currencies,
            pageController: widget.pageController),
      ]),
    );
  }
}
