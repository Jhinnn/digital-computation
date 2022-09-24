class IndirectGrowthRateModel {
  late int _firstYear;
  late int _secondYear;
  late int _currentYear;
  late double _firstGrowthRate;
  late double _secondGrowthRate;
  late double _totalGrowthRate;

  int get firstYear => _firstYear;
  int get secondYear => _secondYear;
  int get currentYear => _currentYear;
  double get firstGrowthRate => _firstGrowthRate;
  double get secondGrowthRate => _secondGrowthRate;
  double get totalGrowthRate => _totalGrowthRate;

  IndirectGrowthRateModel(
    int firstYear,
    int secondYear,
    int currentYear,
    double firstGrowthRate,
    double secondGrowthRate,
    double totalGrowthRate,
  ) {
    _firstYear = firstYear;
    _secondYear = secondYear;
    _currentYear = currentYear;
    _firstGrowthRate = firstGrowthRate;
    _secondGrowthRate = secondGrowthRate;
    _totalGrowthRate = totalGrowthRate;
  }
}
