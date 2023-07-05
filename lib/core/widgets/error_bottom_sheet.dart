import 'package:baash/core/constants/string_consts.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowError {
  static void noInternet({
    required BuildContext context,
    required Function? onTap,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 229,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 44,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: AppColor.bottomSheetColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 51,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffBABECC),
                  ),
                ),
                SvgPicture.asset('assets/icons/internet_error_icon.svg'),
                TextWidget.regular(text: NO_INTERNET),
                NeumorphicButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (onTap != null) {
                        onTap();
                      }
                    },
                    style: NeumorphicStyle(
                      color: AppColor.mainColor,
                      shape: NeumorphicShape.flat,
                      depth: 2,
                      shadowLightColor: AppColor.lightDepthColor,
                      shadowDarkColor: AppColor.darkDepthColor,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    ),
                    child: SizedBox(
                      width: 100,
                      height: 28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget.regular(
                            text: TRY_AGAIN_TEXT,
                            color: AppColor.textColor2,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset('assets/icons/refresh_icon.svg'),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  static void serverError({
    required BuildContext context,
    required Function? onTap,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 229,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 44,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: AppColor.bottomSheetColor,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 51,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffBABECC),
                  ),
                ),
                SvgPicture.asset('assets/icons/server_error_icon.svg'),
                TextWidget.regular(text: SERVER_ERROR),
                NeumorphicButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (onTap != null) {
                        onTap();
                      }
                    },
                    style: NeumorphicStyle(
                      color: AppColor.mainColor,
                      shape: NeumorphicShape.flat,
                      depth: 2,
                      shadowLightColor: AppColor.lightDepthColor,
                      shadowDarkColor: AppColor.darkDepthColor,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    ),
                    child: SizedBox(
                      width: 100,
                      height: 28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget.regular(
                            text: TRY_AGAIN_TEXT,
                            color: AppColor.textColor2,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset('assets/icons/refresh_icon.svg'),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
