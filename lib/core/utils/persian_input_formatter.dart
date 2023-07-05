import 'package:flutter/services.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class DigitPersianFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (!isNumeric(newValue.text.toEnglishDigit()) || newValue.text.toEnglishDigit().contains(' ')) {
      return oldValue;
    }
    String persianInput = newValue.text.toPersianDigit();
    int selectionIndex = newValue.selection.end;
    return newValue.copyWith(
      text: persianInput.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    if (s == '') {
      return true;
    }
    return int.tryParse(s) != null;
  }
}
