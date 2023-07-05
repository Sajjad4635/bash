import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWidget extends StatelessWidget {
  final bool isEnabled;
  final double depth;
  final double borderRadius;
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? textFontSize;
  final Color? btnColor;
  final Function() onPressed;
  final TextStyle? textStyle;
  final double height;
  final double width;
  final TextAlign textAlign;
  final String? svg;
  final NeumorphicBorder border;

  const ButtonWidget({
    Key? key,
    required this.isEnabled,
    this.depth = 2.5,
    this.borderRadius = 10.0,
    required this.onPressed,
    this.text = 'تایید',
    this.textColor,
    this.fontWeight,
    this.textFontSize = 14,
    this.btnColor,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w700,
    ),
    this.height = 48,
    this.width = double.infinity,
    this.textAlign = TextAlign.center,
    this.svg,
    this.border = const NeumorphicBorder.none(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: NeumorphicButton(
          onPressed: () {
            if (isEnabled) {
              onPressed();
            }
          },
          style: NeumorphicStyle(
            color: isEnabled ? (border == const NeumorphicBorder.none() ? btnColor ?? AppColor.mainColor : Colors.transparent) : AppColor.disableGrey,
            shape: NeumorphicShape.flat,
            depth: 0,
            shadowLightColor: AppColor.lightDepthBColor,
            shadowDarkColor: AppColor.darkDepthColor,
            border: border,
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(borderRadius),
            ),
          ),
          child: Center(
            child: svg != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget.bold(
                        text: text,
                        fontSize: textFontSize,
                        color: AppColor.textColor2,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      SvgPicture.asset(svg!),
                    ],
                  )
                : Text(
                    text,
                    style: isEnabled
                        ? textStyle!.copyWith(
                            fontWeight: fontWeight ?? FontWeight.bold,
                            color: textColor ?? AppColor.textColor2,
                          )
                        : textStyle!.copyWith(
                            fontWeight: fontWeight ?? FontWeight.bold,
                            color: textColor ?? AppColor.textColor,
                          ),
                    textAlign: textAlign,
                  ),
          )),
    );
  }
}
