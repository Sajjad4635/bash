class OperatorName {
  static String byOperatorType({required int operatorType}) {
    switch (operatorType) {
      case 1:
        return 'همراه اول';
      case 2:
        return 'رایتل';
      case 3:
        return 'ایرانسل';
      default:
        return '';
    }
  }
}
