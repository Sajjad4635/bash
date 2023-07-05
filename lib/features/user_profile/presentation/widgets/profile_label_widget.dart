import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/app_main_container.dart';
import 'package:baash/core/widgets/text_widget.dart';

class ProfileLabelWidget extends StatelessWidget {
  const ProfileLabelWidget({Key? key, required this.text, required this.svg}) : super(key: key);
  final String text;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        AppMainContainer(
            depth: 0.5,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                TextWidget.regular(
                  text: text,
                  fontSize: 16,
                  color: AppColor.mainColor2,
                ),
                const SizedBox(
                  width: 8,
                ),
                SvgPicture.asset(
                  svg,
                  width: 20,
                  height: 20,
                  color: AppColor.mainColor2,
                ),
              ],
            ))
      ],
    );
  }
}

class ProfileEditLabelWidget extends StatelessWidget {
  const ProfileEditLabelWidget({Key? key, required this.text, required this.svg}) : super(key: key);
  final String text;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        AppMainContainer(
            depth: 0.5,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                TextWidget.regular(
                  text: text,
                  fontSize: 16,
                  color: AppColor.mainColor2,
                ),
                const SizedBox(
                  width: 8,
                ),
                Stack(
                  children: [
                    SvgPicture.asset(
                      svg,
                      width: 20,
                      height: 20,
                      color: AppColor.mainColor2,
                    ),
                    const Icon(
                      Icons.edit,
                    ),
                  ],
                )
              ],
            ))
      ],
    );
  }
}
