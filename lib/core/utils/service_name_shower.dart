class ServiceNameShower {
  static String serviceNameShower({required String input}) {
    switch (input) {
      case 'withdraw_wallet':
        {
          return 'انتقال وجه از کیف پول';
        }
        break;

      case 'deposit_wallet':
        {
          return 'واریز به کیف پول';
        }
        break;

      case 'wallet_payment':
        {
          return 'پرداخت از کیف پول';
        }
        break;

      case 'bill':
        {
          return 'قبض';
        }
        break;

      case 'charge':
        {
          return 'شارژ';
        }
        break;

      case 'internet':
        {
          return 'خرید بسته اینترنت';
        }
        break;

      case 'car_tools':
        {
          return 'خودرو';
        }
        break;

      case 'my_tehran':
        {
          return 'تهران من';
        }
        break;

      case 'insurance':
        {
          return 'بیمه';
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
