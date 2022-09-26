class TwoPeriodSpecificGravityDifferenceModel {
  late int _basePeriodYear;
  late int _currentYear;
  late double _totalValue;
  late double _totalValueGrowthRate;
  late double _targetValue;
  late double _targetValueGrowthRate;
  late double _periodRate;
  late double _currentRate;
  late double _specificGravityValue;

  int get basePeriodYear => _basePeriodYear;
  int get currentYear => _currentYear;
  double get totalValue => _totalValue;
  double get totalValueGrowthRate => _totalValueGrowthRate;
  double get targetValue => _targetValue;
  double get targetValueGrowthRate => _targetValueGrowthRate;
  double get periodRate => _periodRate;
  double get currentRate => _currentRate;
  double get specificGravityValue => _specificGravityValue;

  TwoPeriodSpecificGravityDifferenceModel(
    int basePeriodYear,
    int currentYear,
    double totalValue,
    double targetValue,
    double totalValueGrowthRate,
    double targetValueGrowthRate,
    double periodRate,
    double currentRate,
    double specificGravityValue,
  ) {
    _basePeriodYear = basePeriodYear;
    _currentYear = currentYear;
    _totalValue = totalValue;
    _totalValueGrowthRate = totalValueGrowthRate;
    _targetValue = targetValue;
    _targetValueGrowthRate = targetValueGrowthRate;
    _periodRate = periodRate;
    _currentRate = currentRate;
    _specificGravityValue = specificGravityValue;
  }
}
