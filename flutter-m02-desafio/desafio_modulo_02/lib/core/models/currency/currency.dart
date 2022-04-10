class Currency {
  final String code;
  final String bid;
  Currency({
    required this.code,
    required this.bid,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] ?? '',
      bid: json['bid'] ?? '',
    );
  }
}
