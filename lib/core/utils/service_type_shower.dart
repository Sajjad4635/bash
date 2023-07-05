class ServiceTypeShower {
  static String serviceTypeShower({required String input}) {
    switch (input) {
      case 'Withdraw':
        {
          return 'برداشت';
        }
        break;

      case 'Deposit':
        {
          return 'واریز';
        }
        break;

      default:
        {
          return '';
        }
        break;
    }
  }
}
