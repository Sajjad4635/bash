// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:persian_number_utility/persian_number_utility.dart';
// import 'package:baash/core/g_entities/all_plate_response.dart';
// import 'package:baash/core/theme/app_color.dart';
// import 'package:baash/core/widgets/text_widget.dart';
//
// class CarPlateWidget extends StatefulWidget {
//   CarToolsAllPlateDataResponse carPlateList;
//
//   CarPlateWidget({required this.carPlateList, Key? key}) : super(key: key);
//
//   @override
//   State<CarPlateWidget> createState() => _CarPlateWidgetState();
// }
//
// class _CarPlateWidgetState extends State<CarPlateWidget> {
//   final CarouselController cController = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 153,
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: AppColor.mainYellow.withOpacity(0.3)),
//       ),
//       child: Column(
//         children: [
//           Container(
//             alignment: Alignment.centerRight,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: TextWidget.regular(
//               text: widget.carPlateList.title ?? '',
//               fontSize: 13,
//             ),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5),
//             child: Neumorphic(
//               style: NeumorphicStyle(
//                 intensity: 10,
//                 depth: 2,
//                 shadowLightColor: AppColor.lightDepthColor,
//                 shadowDarkColor: AppColor.darkDepthColor,
//                 boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(6)),
//               ),
//               child: SizedBox(
//                 height: 60,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       width: 33,
//                       padding: const EdgeInsets.only(left: 5),
//                       color: const Color(0xff032569),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.asset(
//                             'assets/images/iran_flag.png',
//                             width: 20,
//                             height: 14,
//                           ),
//                           TextWidget.bold(
//                             text: 'I.R.',
//                             fontSize: 9,
//                           ),
//                           TextWidget.bold(
//                             text: 'IRAN',
//                             fontSize: 9,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 16,
//                     ),
//                     TextWidget.medium(
//                       text: widget.carPlateList.left.toString().toPersianDigit(),
//                       fontSize: 18,
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     TextWidget.medium(
//                       text: widget.carPlateList.alphabet.toString(),
//                       fontSize: 18,
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     TextWidget.medium(
//                       text: widget.carPlateList.mid.toString().toPersianDigit(),
//                       fontSize: 18,
//                     ),
//                     const SizedBox(
//                       width: 16,
//                     ),
//                     Container(
//                       width: 0.7,
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       color: Colors.white.withOpacity(0.3),
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const SizedBox(
//                           height: 3,
//                         ),
//                         TextWidget.regular(
//                           text: 'ایران',
//                           fontSize: 11,
//                         ),
//                         const SizedBox(
//                           height: 0,
//                         ),
//                         TextWidget.medium(
//                           text: widget.carPlateList.right.toString().toPersianDigit(),
//                           fontSize: 18,
//                         ),
//                         const SizedBox(),
//                       ],
//                     ),
//                     const SizedBox(
//                       width: 12,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//         ],
//       )
//     );
//   }
// }
