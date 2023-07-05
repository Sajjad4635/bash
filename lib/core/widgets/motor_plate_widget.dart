// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:persian_number_utility/persian_number_utility.dart';
// import 'package:baash/core/g_entities/all_plate_response.dart';
// import 'package:baash/core/theme/app_color.dart';
// import 'package:baash/core/widgets/text_widget.dart';
//
// class MotorPlateWidget extends StatefulWidget {
//   String top;
//   String bottom;
//
//   MotorPlateWidget({required this.top, required this.bottom, Key? key}) : super(key: key);
//
//   @override
//   State<MotorPlateWidget> createState() => _MotorPlateWidgetState();
// }
//
// class _MotorPlateWidgetState extends State<MotorPlateWidget> {
//   final CarouselController cController = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Neumorphic(
//           style: NeumorphicStyle(
//             intensity: 10,
//             depth: 2,
//             shadowLightColor: AppColor.lightDepthColor,
//             shadowDarkColor: AppColor.darkDepthColor,
//             boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(6)),
//           ),
//           child: SizedBox(
//             height: 60,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   width: 33,
//                   padding: const EdgeInsets.only(left: 5),
//                   color: const Color(0xff032569),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.asset(
//                         'assets/images/iran_flag.png',
//                         width: 20,
//                         height: 14,
//                       ),
//                       TextWidget.bold(
//                         text: 'I.R.',
//                         fontSize: 9,
//                       ),
//                       TextWidget.bold(
//                         text: 'IRAN',
//                         fontSize: 9,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 4, bottom: 4, left: 28, right: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       TextWidget.medium(
//                         text: widget.top.toString().toPersianDigit(),
//                         fontSize: 15,
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       TextWidget.medium(
//                         text: widget.bottom.toString().toPersianDigit(),
//                         fontSize: 15,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
