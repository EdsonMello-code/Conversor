class CurrencyModel {
  final String name;

  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  CurrencyModel(
      {required this.name,
      required this.real,
      required this.dolar,
      required this.euro,
      required this.bitcoin});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
        name: 'Real',
        real: 1.0,
        dolar: 0.18,
        euro: 0.15,
        bitcoin: 0.000016,
      ),
      CurrencyModel(
        name: 'Dolar',
        real: 5.65,
        dolar: 1.0,
        euro: 0.85,
        bitcoin: 0.000088,
      ),
      CurrencyModel(
        name: 'Euro',
        real: 6.62,
        dolar: 1.17,
        euro: 1.0,
        bitcoin: 0.000010,
      ),
      CurrencyModel(
          name: 'Bitcoin',
          real: 64116.51,
          dolar: 11351.30,
          euro: 9689.54,
          bitcoin: 1.0),
    ];
  }
}
