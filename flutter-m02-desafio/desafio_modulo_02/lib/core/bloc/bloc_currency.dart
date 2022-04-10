import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';

import '../models/enum/currency_type_enum.dart';
import '../repositories/api_currency.dart';

part 'bloc_state.dart';

class CurrencyBloc extends Cubit<CurrencyState> {
  final ApiCurrency repository;

  CurrencyBloc(this.repository) : super(CurrencyState.empty);

  // Listando as moedas apresentadas na primeira página.

  void currencies() {
    final List<String> currenciesList =
        EnumToString.toList(CurrencyType.values);
    emit(state.copyWith(currencies: currenciesList));
  }

  // Selecionando a moeda da primeira página pelo index.

  void getSelectedCurrency(int currency) {
    emit(state.copyWith(currencySelected: currency));
  }

  // Listando as moedas que serão apresentadas na segunda página.

  void currenciesToTwoPage() {
    final List<String> currencyList = EnumToString.toList(CurrencyType.values);

    if (state.currencySelected != -1) {
      currencyList.removeAt(state.currencySelected);
      return emit(state.copyWith(currenciesSelected: currencyList));
    } else {
      return emit(state.copyWith(currenciesSelected: currencyList));
    }
  }

  // selecionando a moeda na primeira página para colocar na descrição da página

  void getSelectedNameCurrency(String currency) {
    emit(state.copyWith(currencyNameSelected: currency));
  }

  // selecionando as moeda na primeira página.

  void getCurrencyNameSelected(String currencyName) {
    emit(state.copyWith(currencyCodeSelected: currencyName));
  }

  // selecionando as moedas a ser cotada da segunda página.

  void getSelectedCurrencies(String currencies) {
    state.currenciesSelectedToApi.add(currencies);
  }

  // Realiza a chamada na api com as moedas selecionadas e adiciona a lista de resultado da cotação.

  void getCurrenciesResult(String currency, List<String> currencies) async {
    emit(state.copyWith(status: Status.loading));
    final List listCurrency =
        await repository.getCurrencies(currency, currencies);

    if (listCurrency.isEmpty) {
      return emit(state.copyWith(
        currenciesPrice: listCurrency,
      ));
    }
    emit(state.copyWith(currenciesPrice: listCurrency));
  }

  // Limpando a lista do resultados da cotação e resetando o estado do botão da segunda página

  void clearCurrencyCurrenciesResult() {
    emit(state.copyWith(status: Status.initial));
    state.currenciesSelectedToApi.clear();
    final List<String> newState = state.currenciesSelectedToApi;
    emit(state.copyWith(currenciesSelectedToApi: newState));
  }
}
