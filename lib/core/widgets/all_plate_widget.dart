// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:persian_number_utility/persian_number_utility.dart';
// import 'package:baash/core/theme/app_color.dart';
// import 'package:baash/core/widgets/button_widget.dart';
// import 'package:baash/core/widgets/text_widget.dart';
// import 'package:baash/features/car_tools/presentation/manager/car_tools_bloc.dart';
//
// class AllPlateWidget extends StatefulWidget {
//   BuildContext mContext;
//   List<CarToolsAllPlateDataResponse> carPlateList;
//   int current;
//   ValueChanged<int> onChanged;
//
//   AllPlateWidget({required this.mContext, required this.carPlateList, required this.current, required this.onChanged, Key? key}) : super(key: key);
//
//   @override
//   State<AllPlateWidget> createState() => _AllPlateWidgetState();
// }
//
// class _AllPlateWidgetState extends State<AllPlateWidget> {
//   final CarouselController cController = CarouselController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Neumorphic(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
//         style: NeumorphicStyle(
//           intensity: 10,
//           depth: 2,
//           shadowLightColor: AppColor.lightDepthColor,
//           shadowDarkColor: AppColor.darkDepthColor,
//           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 textDirection: TextDirection.rtl,
//                 children: [
//                   SvgPicture.asset('assets/icons/car_icon.svg'),
//                   const SizedBox(
//                     width: 6,
//                   ),
//                   TextWidget.medium(
//                     text: 'پلاک‌های ‌من',
//                     fontSize: 14,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Container(
//               height: 0.7,
//               color: Colors.white.withOpacity(0.3),
//             ),
//             const SizedBox(
//               height: 13,
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: TextWidget.regular(
//                 text: widget.carPlateList[widget.current].title ?? '',
//                 fontSize: 13,
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             CarouselSlider(
//               items: widget.carPlateList
//                   .map(
//                     (item) => item.type == 'Motor'
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 5),
//                             child: Row(
//                               textDirection: TextDirection.rtl,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/icons/more_item.svg',
//                                   color: Colors.transparent,
//                                 ),
//                                 Neumorphic(
//                                     style: NeumorphicStyle(
//                                       intensity: 10,
//                                       depth: 2,
//                                       shadowLightColor: AppColor.lightDepthColor,
//                                       shadowDarkColor: AppColor.darkDepthColor,
//                                       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(6)),
//                                     ),
//                                     child: SizedBox(
//                                       height: 60,
//                                       child: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           Container(
//                                             width: 33,
//                                             padding: const EdgeInsets.only(left: 5),
//                                             color: const Color(0xff032569),
//                                             child: Column(
//                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 Image.asset(
//                                                   'assets/images/iran_flag.png',
//                                                   width: 20,
//                                                   height: 14,
//                                                 ),
//                                                 TextWidget.bold(
//                                                   text: 'I.R.',
//                                                   fontSize: 9,
//                                                 ),
//                                                 TextWidget.bold(
//                                                   text: 'IRAN',
//                                                   fontSize: 9,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(top: 4, bottom: 4, left: 28, right: 30),
//                                             child: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.center,
//                                               children: [
//                                                 TextWidget.medium(
//                                                   text: item.left.toString().toPersianDigit(),
//                                                   fontSize: 15,
//                                                 ),
//                                                 const SizedBox(
//                                                   width: 20,
//                                                 ),
//                                                 TextWidget.medium(
//                                                   text: item.right.toString().toPersianDigit(),
//                                                   fontSize: 15,
//                                                 ),
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )),
//                                 const SizedBox(
//                                   width: 9,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     deleteOrEditPlate(
//                                       mContext: widget.mContext,
//                                       plate: widget.carPlateList[widget.current],
//                                     );
//                                   },
//                                   child: SvgPicture.asset('assets/icons/more_item.svg'),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : item.type == 'Municipality'
//                             ? Row(
//                                 textDirection: TextDirection.rtl,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/icons/more_item.svg',
//                                     color: Colors.transparent,
//                                   ),
//                                   const SizedBox(
//                                     width: 9,
//                                   ),
//                                   Neumorphic(
//                                     style: NeumorphicStyle(
//                                       intensity: 10,
//                                       depth: 2,
//                                       shadowLightColor: AppColor.lightDepthColor,
//                                       shadowDarkColor: AppColor.darkDepthColor,
//                                       boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(6)),
//                                     ),
//                                     child: Container(
//                                       height: 44,
//                                       padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 5),
//                                       child: Center(
//                                         child: TextWidget.regular(
//                                           text: widget.carPlateList[widget.current].identificationCode.toString().toPersianDigit(),
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 9,
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       deleteOrEditPlate(
//                                         mContext: widget.mContext,
//                                         plate: widget.carPlateList[widget.current],
//                                       );
//                                     },
//                                     child: SvgPicture.asset('assets/icons/more_item.svg'),
//                                   ),
//                                 ],
//                               )
//                             : Row(
//                                 textDirection: TextDirection.rtl,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/icons/more_item.svg',
//                                     color: Colors.transparent,
//                                   ),
//                                   const SizedBox(
//                                     width: 9,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(vertical: 5),
//                                     child: Neumorphic(
//                                       style: NeumorphicStyle(
//                                         intensity: 10,
//                                         depth: 2,
//                                         shadowLightColor: AppColor.lightDepthColor,
//                                         shadowDarkColor: AppColor.darkDepthColor,
//                                         boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(6)),
//                                       ),
//                                       child: SizedBox(
//                                         height: 72,
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           children: [
//                                             Container(
//                                               width: 33,
//                                               padding: const EdgeInsets.only(left: 5),
//                                               color: const Color(0xff032569),
//                                               child: Column(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Image.asset(
//                                                     'assets/images/iran_flag.png',
//                                                     width: 20,
//                                                     height: 14,
//                                                   ),
//                                                   TextWidget.bold(
//                                                     text: 'I.R.',
//                                                     fontSize: 9,
//                                                   ),
//                                                   TextWidget.bold(
//                                                     text: 'IRAN',
//                                                     fontSize: 9,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 16,
//                                             ),
//                                             TextWidget.medium(
//                                               text: item.left.toString().toPersianDigit(),
//                                               fontSize: 18,
//                                             ),
//                                             const SizedBox(
//                                               width: 20,
//                                             ),
//                                             TextWidget.medium(
//                                               text: item.alphabet.toString(),
//                                               fontSize: 18,
//                                             ),
//                                             const SizedBox(
//                                               width: 20,
//                                             ),
//                                             TextWidget.medium(
//                                               text: item.mid.toString().toPersianDigit(),
//                                               fontSize: 18,
//                                             ),
//                                             const SizedBox(
//                                               width: 16,
//                                             ),
//                                             Container(
//                                               width: 0.7,
//                                               margin: const EdgeInsets.symmetric(vertical: 10),
//                                               color: Colors.white.withOpacity(0.3),
//                                             ),
//                                             const SizedBox(
//                                               width: 15,
//                                             ),
//                                             Column(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 const SizedBox(
//                                                   height: 3,
//                                                 ),
//                                                 TextWidget.regular(
//                                                   text: 'ایران',
//                                                   fontSize: 11,
//                                                 ),
//                                                 const SizedBox(
//                                                   height: 4,
//                                                 ),
//                                                 TextWidget.medium(
//                                                   text: item.right.toString().toPersianDigit(),
//                                                   fontSize: 18,
//                                                 ),
//                                                 const SizedBox(),
//                                               ],
//                                             ),
//                                             const SizedBox(
//                                               width: 12,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 9,
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       deleteOrEditPlate(
//                                         mContext: widget.mContext,
//                                         plate: widget.carPlateList[widget.current],
//                                       );
//                                     },
//                                     child: SvgPicture.asset('assets/icons/more_item.svg'),
//                                   ),
//                                 ],
//                               ),
//                   )
//                   .toList(),
//               carouselController: cController,
//               options: CarouselOptions(
//                 aspectRatio: 318 / 60,
//                 viewportFraction: 1,
//                 initialPage: 0,
//                 enableInfiniteScroll: true,
//                 reverse: true,
//                 autoPlay: false,
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enlargeCenterPage: true,
//                 enlargeFactor: 0.3,
//                 pageSnapping: true,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     widget.current = index;
//                     widget.onChanged(index);
//                   });
//                 },
//                 scrollDirection: Axis.horizontal,
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.min,
//               textDirection: TextDirection.rtl,
//               children: widget.carPlateList.asMap().entries.map((entry) {
//                 return GestureDetector(
//                   onTap: () {
//                     cController.animateToPage(entry.key);
//                   },
//                   child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 4),
//                       child: widget.current == entry.key
//                           ? Neumorphic(
//                               style: NeumorphicStyle(
//                                 shadowDarkColorEmboss: AppColor.darkDepthColor,
//                                 shadowLightColorEmboss: AppColor.lightDepthColor,
//                                 depth: -2,
//                               ),
//                               child: Container(
//                                 width: 11.14,
//                                 height: 11.14,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: AppColor.mainGrey,
//                                 ),
//                                 child: Center(
//                                   child: Container(
//                                     width: 8.41,
//                                     height: 8.41,
//                                     decoration: const BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: AppColor.mainYellow,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : Neumorphic(
//                               style: NeumorphicStyle(
//                                 depth: -2,
//                                 shadowDarkColorEmboss: AppColor.darkDepthColor,
//                                 shadowLightColorEmboss: Colors.white.withOpacity(0.75),
//                               ),
//                               child: Container(
//                                   width: 9.18,
//                                   height: 9.18,
//                                   decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.black,
//                                   )),
//                             )),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void deleteOrEditPlate({
//     required BuildContext mContext,
//     required CarToolsAllPlateDataResponse plate,
//   }) {
//     showModalBottomSheet<void>(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return Container(
//           height: 238,
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(24),
//               topRight: Radius.circular(24),
//             ),
//             color: AppColor.bottomSheetColor,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 33),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   width: 51,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: const Color(0xffBABECC),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       alignment: Alignment.centerRight,
//                       child: TextWidget.regular(
//                         text: plate.title.toString(),
//                         fontSize: 15,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 23,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           highlightColor: Colors.transparent,
//                           splashColor: Colors.transparent,
//                           onTap: () {
//                             Navigator.pop(context);
//                             updatePlate(mContext: mContext, plate: plate);
//                           },
//                           child: Neumorphic(
//                             style: NeumorphicStyle(
//                               intensity: 10,
//                               depth: 2,
//                               shadowLightColor: AppColor.lightDepthColor,
//                               shadowDarkColor: AppColor.darkDepthColor,
//                               boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
//                             ),
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16),
//                               height: 40,
//                               child: Row(
//                                 textDirection: TextDirection.rtl,
//                                 children: [
//                                   SvgPicture.asset('assets/icons/edit_icon.svg'),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   TextWidget.regular(
//                                     text: 'ویرایش',
//                                     fontSize: 14,
//                                   ),
//                                   const Spacer(),
//                                   SvgPicture.asset('assets/icons/back_icon.svg'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         InkWell(
//                           highlightColor: Colors.transparent,
//                           splashColor: Colors.transparent,
//                           onTap: () {
//                             Navigator.pop(context);
//                             deletePlate(mContext: mContext, id: plate.id.toString());
//                           },
//                           child: Neumorphic(
//                             style: NeumorphicStyle(
//                               intensity: 10,
//                               depth: 2,
//                               shadowLightColor: AppColor.lightDepthColor,
//                               shadowDarkColor: AppColor.darkDepthColor,
//                               boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
//                             ),
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16),
//                               height: 40,
//                               child: Row(
//                                 textDirection: TextDirection.rtl,
//                                 children: [
//                                   SvgPicture.asset('assets/icons/trash_icon.svg'),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   TextWidget.regular(
//                                     text: 'حذف',
//                                     fontSize: 14,
//                                   ),
//                                   const Spacer(),
//                                   SvgPicture.asset('assets/icons/back_icon.svg'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 35,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void updatePlate({
//     required BuildContext mContext,
//     required CarToolsAllPlateDataResponse plate,
//   }) {
//     showModalBottomSheet<void>(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return Container(
//           height: 238,
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(24),
//               topRight: Radius.circular(24),
//             ),
//             color: AppColor.bottomSheetColor,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 33),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   width: 51,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: const Color(0xffBABECC),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Column(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         InkWell(
//                           highlightColor: Colors.transparent,
//                           splashColor: Colors.transparent,
//                           onTap: () {
//                             Navigator.pop(context);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => UpdatePlateScreen(
//                                   plateType: 'Motor',
//                                   title: plate.title,
//                                   alphabet: plate.alphabet,
//                                   right: plate.right,
//                                   mid: plate.mid,
//                                   left: plate.left,
//                                   engineNumber: plate.engineNumber,
//                                   identificationCode: plate.identificationCode,
//                                   nationalID: plate.nationalID,
//                                   vin: plate.vin,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Neumorphic(
//                             style: NeumorphicStyle(
//                               intensity: 10,
//                               depth: 2,
//                               shadowLightColor: AppColor.lightDepthColor,
//                               shadowDarkColor: AppColor.darkDepthColor,
//                               boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
//                             ),
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16),
//                               height: 40,
//                               child: Row(
//                                 textDirection: TextDirection.rtl,
//                                 children: [
//                                   SvgPicture.asset('assets/icons/mini_motor_icon.svg'),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   TextWidget.regular(
//                                     text: 'موتور',
//                                     fontSize: 14,
//                                   ),
//                                   const Spacer(),
//                                   SvgPicture.asset('assets/icons/back_icon.svg'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         InkWell(
//                           highlightColor: Colors.transparent,
//                           splashColor: Colors.transparent,
//                           onTap: () {
//                             Navigator.pop(context);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => UpdatePlateScreen(
//                                   plateType: 'Motor',
//                                   title: plate.title,
//                                   alphabet: plate.alphabet,
//                                   right: plate.right,
//                                   mid: plate.mid,
//                                   left: plate.left,
//                                   engineNumber: plate.engineNumber,
//                                   identificationCode: plate.identificationCode,
//                                   nationalID: plate.nationalID,
//                                   vin: plate.vin,
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Neumorphic(
//                             style: NeumorphicStyle(
//                               intensity: 10,
//                               depth: 2,
//                               shadowLightColor: AppColor.lightDepthColor,
//                               shadowDarkColor: AppColor.darkDepthColor,
//                               boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
//                             ),
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(horizontal: 16),
//                               height: 40,
//                               child: Row(
//                                 textDirection: TextDirection.rtl,
//                                 children: [
//                                   SvgPicture.asset('assets/icons/mini_car_icon.svg'),
//                                   const SizedBox(
//                                     width: 8,
//                                   ),
//                                   TextWidget.regular(
//                                     text: 'خودرو',
//                                     fontSize: 14,
//                                   ),
//                                   const Spacer(),
//                                   SvgPicture.asset('assets/icons/back_icon.svg'),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 35,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void deletePlate({required BuildContext mContext, required String id}) {
//     showModalBottomSheet<void>(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (BuildContext context) {
//         return Container(
//           height: 177,
//           padding: const EdgeInsets.only(
//             top: 12,
//           ),
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(24),
//               topRight: Radius.circular(24),
//             ),
//             color: AppColor.bottomSheetColor,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 33),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   width: 51,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: const Color(0xffBABECC),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Column(
//                   children: [
//                     TextWidget.medium(
//                       text: 'آیا از حذف پلاک خود اطمینان دارید؟',
//                       fontSize: 15,
//                     ),
//                     const SizedBox(
//                       height: 23,
//                     ),
//                     Row(
//                       textDirection: TextDirection.rtl,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: NeumorphicButtonWidget(
//                             isEnabled: true,
//                             height: 40,
//                             btnColor: AppColor.errorColor,
//                             text: 'حذف',
//                             textColor: Colors.white,
//                             fontWeight: FontWeight.normal,
//                             onPressed: () {
//                               Navigator.pop(context);
//                               mContext.read<CarToolsBloc>().add(CarToolsDeletePlate(id: id));
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 18,
//                         ),
//                         Expanded(
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               child: Center(
//                                 child: TextWidget.medium(
//                                   text: 'انصراف',
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 35,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
