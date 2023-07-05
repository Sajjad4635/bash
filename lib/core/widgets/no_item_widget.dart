import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NoItemWidget extends StatefulWidget {
  String? text;
  double? height;

  NoItemWidget({
    Key? key,
    this.text,
    this.height,
  }) : super(key: key);

  @override
  State<NoItemWidget> createState() => _NoItemWidgetState();
}

class _NoItemWidgetState extends State<NoItemWidget> {
  bool noImageItem = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          noImageItem = !noImageItem;
        });
      },
      child: SizedBox(
        width: double.infinity,
        height: widget.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 95,
                child: TextWidget.bold(
                  text: '!',
                  fontSize: 80,
                  color: AppColor.mainColor,
                )),
            const SizedBox(
              height: 32,
            ),
            TextWidget.medium(
              text: widget.text ?? 'موردی یافت نشد',
              color: AppColor.bottomSheetColor,
              fontSize: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget showNoItemWidget(bool noImageItem) {
    return noImageItem ? Image.asset('assets/images/no_item_image_1.png') : Image.asset('assets/images/no_item_image_2.png');
  }
}

class CustomNoItemWidget extends StatefulWidget {
  Widget? textWidget;
  double? height;

  CustomNoItemWidget({
    Key? key,
    this.textWidget,
    this.height,
  }) : super(key: key);

  @override
  State<CustomNoItemWidget> createState() => _CustomNoItemWidgetState();
}

class _CustomNoItemWidgetState extends State<CustomNoItemWidget> {
  bool noImageItem = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          noImageItem = !noImageItem;
        });
      },
      child: Neumorphic(
        style: NeumorphicStyle(
          shadowLightColor: AppColor.lightDepthColor,
          shadowDarkColor: AppColor.darkDepthColor,
          depth: 2,
        ),
        child: SizedBox(
          width: double.infinity,
          height: widget.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 95,
                child: showNoItemWidget(noImageItem),
              ),
              const SizedBox(
                height: 32,
              ),
              widget.textWidget!,
            ],
          ),
        ),
      ),
    );
  }

  Widget showNoItemWidget(bool noImageItem) {
    return noImageItem ? Image.asset('assets/images/no_item_image_1.png') : Image.asset('assets/images/no_item_image_2.png');
  }
}
