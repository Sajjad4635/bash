import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_field_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class InputCarPlateWidget extends StatefulWidget {
  TextEditingController leftNumberController, rightNumberController, iranNumberController;
  String alphabet;
  ValueChanged<String> onChanged;

  InputCarPlateWidget({
    required this.leftNumberController,
    required this.alphabet,
    required this.rightNumberController,
    required this.iranNumberController,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<InputCarPlateWidget> createState() => _InputCarPlateWidgetState();
}

class _InputCarPlateWidgetState extends State<InputCarPlateWidget> {
  List<String> list = <String>[
    'الف',
    'ب',
    'ز',
    'ی',
    'س',
  ];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.last;
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
          Expanded(
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
              child: Row(
                children: [
                  Expanded(
                    child: CarPlateTextFieldWidget(
                      hintText: '- -',
                      textAlign: TextAlign.center,
                      textController: widget.leftNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      isEmpty: false,
                      onChanged: (v) {},
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      alignment: Alignment.center,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      isExpanded: true,
                      elevation: 0,
                      style: const TextStyle(color: AppColor.textColor),
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      dropdownColor: AppColor.bottomSheetColor,
                      borderRadius: BorderRadius.circular(10),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                          widget.alphabet = value;
                          print(value);
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: TextWidget.medium(
                            text: value,
                            fontSize: 20,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: CarPlateTextFieldWidget(
                      hintText: '- - -',
                      textAlign: TextAlign.center,
                      textController: widget.rightNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      isEmpty: false,
                      onChanged: (v) {},
                    ),
                  ),
                  Expanded(
                    child: CarPlateTextFieldWidget(
                      hintText: '- -',
                      textAlign: TextAlign.center,
                      textController: widget.iranNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      isEmpty: false,
                      onChanged: (v) {},
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: TextWidget.regular(
                      text: 'ایــران',
                      fontSize: 10,
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
