import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/Image_shower.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/product_detail/domain/entities/product_detail_response.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ShowImages extends StatefulWidget {
  List<SupplementaryImageProductDetailResponse> imageList;

  ShowImages({required this.imageList, Key? key}) : super(key: key);

  @override
  State<ShowImages> createState() => _ShowImagesState();
}

class _ShowImagesState extends State<ShowImages> {
  List<Widget> sliderItems = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    for (final element in widget.imageList) {
      sliderItems.add(
          ImageNetwork(url: element.img.toString(),)
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.chevron_right_outlined,
                        color: AppColor.mainColor2,
                        size: 28,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    TextWidget.bold(
                      text: 'تصاویر محصول',
                      fontSize: 16,
                    )
                  ],
                ),
              ),
              CarouselSlider(
                items: sliderItems,
                carouselController: _controller,
                options: CarouselOptions(
                  aspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height - 100),
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(hours: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  pageSnapping: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  textDirection: TextDirection.rtl,
                  children: sliderItems.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: _current == entry.key
                              ? Neumorphic(
                                  style: NeumorphicStyle(
                                    shadowDarkColorEmboss: AppColor.darkDepthColor,
                                    shadowLightColorEmboss: AppColor.lightDepthColor,
                                    depth: -2,
                                  ),
                                  child: Container(
                                    width: 11.14,
                                    height: 11.14,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.mainGrey,
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 8.41,
                                        height: 8.41,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Neumorphic(
                                  style: NeumorphicStyle(
                                    depth: -2,
                                    shadowDarkColorEmboss: AppColor.darkDepthColor,
                                    shadowLightColorEmboss: Colors.white.withOpacity(0.75),
                                  ),
                                  child: Container(
                                      width: 9.18,
                                      height: 9.18,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      )),
                                )),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
