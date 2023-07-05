import 'package:baash/core/theme/app_color.dart';
import 'package:flutter/cupertino.dart';

class AppMainContainer extends StatelessWidget {
  const AppMainContainer({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
    this.depth,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? depth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 28,
        left: 24,
        right: 24,
        bottom: 0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.mainColor,
            width: 1.5,
          )),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
