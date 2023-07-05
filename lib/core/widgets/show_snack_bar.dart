import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowSnackBar {
  ScaffoldMessengerState showError({
    required BuildContext context,
    required String message,
  }) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColor.errorColor,
              ),
              color: AppColor.errorColor.withOpacity(0.2),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SvgPicture.asset(
                  'assets/icons/warning_icon.svg',
                  color: AppColor.errorColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                TextWidget.regular(
                  text: message,
                  color: AppColor.textColor,
                  alignment: TextAlign.right,
                ),
              ],
            ),
          ),
          backgroundColor: AppColor.backgroundColor,
        ),
      );
  }

  ScaffoldMessengerState showSuccessMessage({
    required BuildContext context,
    required String message,
  }) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.green,
              ),
              color: Colors.green.withOpacity(0.2),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 4,
                ),
                TextWidget.regular(
                  text: message,
                  color: AppColor.textColor,
                  alignment: TextAlign.right,
                ),
              ],
            ),
          ),
          backgroundColor: AppColor.backgroundColor,
        ),
      );
  }
}
