import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_field_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class InputMotorcyclePlateWidget extends StatefulWidget {
  TextEditingController topNumberController, bottomNumberController;

  InputMotorcyclePlateWidget({
    required this.topNumberController,
    required this.bottomNumberController,
    Key? key,
  }) : super(key: key);

  @override
  State<InputMotorcyclePlateWidget> createState() => _InputMotorcyclePlateWidgetState();
}

class _InputMotorcyclePlateWidgetState extends State<InputMotorcyclePlateWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Container(
            width: 35,
            padding: const EdgeInsets.only(
              top: 5,
              left: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.black,
              ),
              color: const Color(0xff032569),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/iran_flag.png',
                  width: 20,
                  height: 14,
                ),
                TextWidget.bold(
                  text: 'I.R.',
                  fontSize: 9,
                ),
                TextWidget.bold(
                  text: 'IRAN',
                  fontSize: 9,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          SizedBox(
            width: 150,
            child: Neumorphic(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              style: NeumorphicStyle(
                intensity: 10,
                depth: -2,
                shadowLightColor: AppColor.lightDepthColor,
                shadowDarkColor: AppColor.darkDepthColor,
                shadowLightColorEmboss: AppColor.lightDepthColor,
                shadowDarkColorEmboss: AppColor.darkDepthColor,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: CarPlateTextFieldWidget(
                      hintText: '- -',
                      textAlign: TextAlign.center,
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      textController: widget.topNumberController,
                      isEmpty: false,
                      onChanged: (v) {},
                    ),
                  ),
                  Expanded(
                    child: CarPlateTextFieldWidget(
                      hintText: '- - -',
                      textAlign: TextAlign.center,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      textController: widget.bottomNumberController,
                      isEmpty: false,
                      onChanged: (v) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
