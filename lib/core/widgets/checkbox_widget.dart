import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CheckBoxWidget extends StatelessWidget {
  bool value;
  ValueChanged<bool> onChanged;
  final String text;

  CheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (value) {
                value = false;
                onChanged(value);
              } else {
                value = true;
                onChanged(value);
              }
            });
          },
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  intensity: 10,
                  depth: -1.5,
                  shadowLightColorEmboss: AppColor.lightDepthColor,
                  shadowDarkColorEmboss: AppColor.darkDepthColor,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(3)),
                ),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: value ? AppColor.mainColor : AppColor.backgroundColor),
                  child: value
                      ? const Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextWidget.regular(
                text: text,
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomCheckBoxWidget extends StatelessWidget {
  bool value;
  ValueChanged<bool> onChanged;
  final Widget widgetText;

  CustomCheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.widgetText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (value) {
                value = false;
                onChanged(value);
              } else {
                value = true;
                onChanged(value);
              }
            });
          },
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  intensity: 10,
                  depth: -1.5,
                  shadowLightColorEmboss: AppColor.lightDepthColor,
                  shadowDarkColorEmboss: AppColor.darkDepthColor,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(3)),
                ),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: value ? AppColor.mainColor : AppColor.backgroundColor),
                  child: value
                      ? const Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              widgetText,
            ],
          ),
        );
      },
    );
  }
}
