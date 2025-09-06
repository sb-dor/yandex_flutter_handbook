class ReusableGlobalFunctions {
  ReusableGlobalFunctions._();

  static ReusableGlobalFunctions get _instance => ReusableGlobalFunctions._();

  factory ReusableGlobalFunctions() => _instance;

  void numParse() {
    final number = int.tryParse("10t");
    number!;
  }
}
