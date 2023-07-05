import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopPageWidget extends StatefulWidget {
  String title;

  TopPageWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<TopPageWidget> createState() => _TopPageWidgetState();
}

class _TopPageWidgetState extends State<TopPageWidget> {
  bool noImageItem = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 26,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/back_icon.svg',
                color: AppColor.textColor,
              ),
            ),
            TextWidget.regular(
              text: widget.title,
              fontSize: 15,
              color: AppColor.textColor,
            ),
            const SizedBox(),
          ],
        ),
      ],
    );
  }
}
