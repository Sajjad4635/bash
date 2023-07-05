import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/utils/persian_input_formatter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextAlign textAlign;
  final Color? backgroundColor;
  final TextEditingController textController;

  // final FocusNode? focusNode;
  final bool? isEmpty;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onValidator;
  final TextInputType keyboardType;
  final Color cursorColor;
  final bool isEnabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;

  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.textAlign = TextAlign.end,
    this.backgroundColor,
    required this.textController,
    // this.focusNode,
    this.isEmpty,
    this.onChanged,
    this.onSubmitted,
    this.onValidator,
    this.keyboardType = TextInputType.text,
    this.cursorColor = AppColor.mainColor,
    this.isEnabled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      enabled: isEnabled,
      controller: textController,
      // focusNode: focusNode,
      cursorColor: cursorColor,
      onChanged: (text) {
        if (onChanged != null) {
          onChanged!(text);
        }
      },
      onFieldSubmitted: (text) {
        if (onSubmitted != null) {
          onSubmitted!(text);
        }
      },
      validator: (value) {
        if (onValidator != null) {
          return onValidator!();
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      inputFormatters: keyboardType == TextInputType.text
          ? <TextInputFormatter>[
              LengthLimitingTextInputFormatter(maxLength),
            ]
          : <TextInputFormatter>[
              DigitPersianFormatter(),
              LengthLimitingTextInputFormatter(maxLength),
            ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        counterText: '',
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.hintColorTextField,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.mainColor2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.mainColor),
        ), // border: InputBorder.noBorder.none,
      ),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: AppColor.textColor,
          ),
    );
  }
}

class PhoneNumberTextField extends StatelessWidget {
  final String? hintText;
  final TextAlign textAlign;
  final Color? backgroundColor;
  final TextEditingController textController;
  final FocusNode? focusNode;
  final bool isEmpty;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final Function()? onValidator;
  final TextInputType keyboardType;
  final Color cursorColor;
  final bool isEnabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const PhoneNumberTextField({
    Key? key,
    required this.hintText,
    this.textAlign = TextAlign.right,
    this.backgroundColor,
    required this.textController,
    required this.focusNode,
    required this.isEmpty,
    required this.onChanged,
    this.onSubmitted,
    this.onValidator,
    this.keyboardType = TextInputType.number,
    this.cursorColor = AppColor.mainColor,
    this.isEnabled = true,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          textAlign: textAlign,
          enabled: isEnabled,
          controller: textController,
          focusNode: focusNode,
          keyboardType: keyboardType,
          cursorColor: cursorColor,
          onChanged: (text) {
            onChanged(text);
          },
          onFieldSubmitted: (text) {
            if (onSubmitted != null) {
              onSubmitted!(text);
            }
          },
          validator: (value) {
            if (onValidator != null) {
              return onValidator!();
            } else {
              return null;
            }
          },
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(11),
            DigitPersianFormatter(),
          ],
          decoration: InputDecoration(
            errorStyle: const TextStyle(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            counterText: '',
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColor.hintColorTextField,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.mainColor2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.mainColor),
            ), // border: InputBorder.none,
          ),
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColor.textColor,
              ),
        ),
      ),
    );
  }
}

class CarPlateTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextAlign textAlign;
  final Color? backgroundColor;
  final TextEditingController textController;
  final bool isEmpty;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final Function()? onValidator;
  final TextInputType keyboardType;
  final Color cursorColor;
  final bool isEnabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;

  const CarPlateTextFieldWidget({
    Key? key,
    required this.hintText,
    this.textAlign = TextAlign.end,
    this.backgroundColor,
    required this.textController,
    required this.isEmpty,
    required this.onChanged,
    this.onSubmitted,
    this.onValidator,
    this.keyboardType = TextInputType.name,
    this.cursorColor = AppColor.mainColor,
    this.isEnabled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 48,
          width: double.infinity,
        ),
        TextFormField(
          textAlign: textAlign,
          enabled: isEnabled,
          controller: textController,
          cursorColor: cursorColor,
          onChanged: (text) {
            onChanged(text);
          },
          onFieldSubmitted: (text) {
            if (onSubmitted != null) {
              onSubmitted!(text);
            }
          },
          validator: (value) {
            if (onValidator != null) {
              return onValidator!();
            } else {
              return null;
            }
          },
          keyboardType: keyboardType,
          inputFormatters: <TextInputFormatter>[
            DigitPersianFormatter(),
            LengthLimitingTextInputFormatter(maxLength),
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            counterText: '',
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColor.hintColor,
              fontSize: 20,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ), // border: InputBorder.noBorder.none,
          ),
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: AppColor.textColor,
              ),
        ),
      ],
    );
  }
}
