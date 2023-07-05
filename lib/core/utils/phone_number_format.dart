import 'package:persian_number_utility/persian_number_utility.dart';

class PhoneNumberFormat {
  static bool phoneNumberFormatWarning(String input) {
    if (input == '') {
      return false;
    } else if (!input.isValidIranianMobileNumber()) {
      return false;
    } else {
      return true;
    }
  }
}
