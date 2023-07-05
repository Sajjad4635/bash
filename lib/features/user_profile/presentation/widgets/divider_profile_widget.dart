import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';

class DividerProfileWidget extends StatelessWidget {
  const DividerProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColor.mainColor, height: 1.5, margin: const EdgeInsets.symmetric(vertical: 14));
  }
}
