import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) return newValue;
    StringBuffer buff = StringBuffer();
    for (int i = 0; i < newValue.text.length; ++i) {
      buff.write(newValue.text[i]);
      if ((i + 1) % 4 == 0 && i != newValue.text.length - 1) buff.write(" ");
    }
    final s = buff.toString();
    return TextEditingValue(
      text: s,
      selection: TextSelection.collapsed(offset: s.length),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) return newValue;
    StringBuffer buff = StringBuffer();
    for (int i = 0; i < newValue.text.length; ++i) {
      buff.write(newValue.text[i]);
      if ((i + 1) % 2 == 0 && i != newValue.text.length - 1) buff.write('/');
    }
    final s = buff.toString();
    return newValue.copyWith(
      text: s,
      selection: TextSelection.collapsed(offset: s.length),
    );
  }
}

class CardMonthFilteringText extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) return newValue;
    StringBuffer buff = StringBuffer();
    if (newValue.text.length >= 2) {
      if (int.parse(newValue.text.substring(0, 2)) > 12) {
        buff.write("12");
      } else {
        buff.write(newValue.text.substring(0, 2));
      }
      if (newValue.text.length > 2) {
        buff.write(newValue.text.substring(2, newValue.text.length));
      }
    } else {
      if (int.parse(newValue.text) > 2) {
        buff.write("0${newValue.text}");
      } else {
        buff.write(newValue.text);
      }
    }
    final s = buff.toString();
    return newValue.copyWith(
      text: s,
      selection: TextSelection.collapsed(offset: s.length),
    );
  }
}
