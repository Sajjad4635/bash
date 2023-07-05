import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:baash/core/widgets/text_widget.dart';

import '../../../../core/theme/app_color.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({Key? key, required this.onTap, required this.text, required this.svg}) : super(key: key);

  final Function onTap;
  final String text;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        onTap();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.mainColor2,
            size: 16,
          ),
          const Spacer(),
          TextWidget.regular(
            text: text,
            fontSize: 14,
            color: AppColor.textColor,
          ),
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(
            svg,
            color: AppColor.mainColor2,
            width: 23,
            height: 23,
          ),
        ],
      ),
    );
  }
}
