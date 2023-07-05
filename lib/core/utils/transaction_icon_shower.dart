class TransactionIcons {
  static String transactionIconShower({required String input}) {
    if (input == 'Withdraw') {
      return 'assets/icons/send_icon.svg';
    } else {
      return 'assets/icons/receive_icon.svg';
    }
  }
}
