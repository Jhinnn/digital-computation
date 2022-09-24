class AmoutOfCurrentModel {
  late int _basePeriodYear;
  late int _currentYear;
  late double _basePeriodValue;
  late double _currentValue;
  late double _growthRate;

  int get basePeriodYear => _basePeriodYear;
  int get currentYear => _currentYear;
  double get basePeriodValue => _basePeriodValue;
  double get currentValue => _currentValue;
  double get growthRate => _growthRate;

  AmoutOfCurrentModel(
    int basePeriodYear,
    int currentYear,
    double basePeriodValue,
    double currentValue,
    double growthRate,
  ) {
    _basePeriodYear = basePeriodYear;
    _currentYear = currentYear;
    _basePeriodValue = basePeriodValue;
    _currentValue = currentValue;
    _growthRate = growthRate;
  }
}
