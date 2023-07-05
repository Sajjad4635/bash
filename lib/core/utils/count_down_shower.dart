class CountDownShower {
  static String showNumberInClockFormat(int second) {
    return '${((second / 60) - 1).ceil().toStringAsFixed(0).replaceAll('-1', '0')}:${second % 60}';
  }
}
