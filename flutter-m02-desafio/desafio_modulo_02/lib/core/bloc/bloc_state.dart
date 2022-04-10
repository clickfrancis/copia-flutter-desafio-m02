part of 'bloc_currency.dart';

enum Status { initial, loading, complete, success }

class CurrencyState {
  final List<String> currencies;
  final List<String> currenciesSelectedToApi;
  final List<String> currenciesSelected;
  final List currenciesPrice;
  final String currencyNameSelected;
  final String currencyCodeSelected;
  final int currencySelected;
  final Status status;

  CurrencyState(
    this.currencies,
    this.currenciesSelectedToApi,
    this.currenciesSelected,
    this.currenciesPrice,
    this.currencyNameSelected,
    this.currencyCodeSelected,
    this.status,
    this.currencySelected,
  );

  static CurrencyState get empty => CurrencyState(
        [],
        [],
        [],
        [],
        '',
        '',
        Status.initial,
        -1,
      );

  CurrencyState copyWith({
    List<String>? currencies,
    List<String>? currenciesSelectedToApi,
    List<String>? currenciesSelected,
    String? currencyNameSelected,
    List? currenciesPrice,
    String? currencyCodeSelected,
    Status? status,
    int? currencySelected,
  }) {
    return CurrencyState(
      currencies ?? this.currencies,
      currenciesSelectedToApi ?? this.currenciesSelectedToApi,
      currenciesSelected ?? this.currenciesSelected,
      currenciesPrice ?? this.currenciesPrice,
      currencyNameSelected ?? this.currencyNameSelected,
      currencyCodeSelected ?? this.currencyCodeSelected,
      status ?? this.status,
      currencySelected ?? this.currencySelected,
    );
  }
}
