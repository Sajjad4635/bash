class ChargeType {
  static int byIndex(int input) {
    switch (input) {
      case 0:
        {
          return 1;
          //کد ۱ برای شارژ شگفت انگیز
        }
      case 1:
        {
          return 0;
          //کد ۰ برای شارژ معمولی
        }
      case 2:
        {
          return 2;
          //کد ۲ برای شارژ اختیاری
        }
      default:
        {
          return 1;
        }
    }
  }
}
