import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OverallInformation extends StatelessWidget {
  String des;

  OverallInformation({required this.des, Key? key}) : super(key: key);

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
                      text: 'نقد و بررسی',
                      fontSize: 16,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextWidget.medium(
                  text: 'معرفی اجمالی',
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    TextWidget.regular(
                      text: des,
                      // text: 'دستگاه مینی فرز شارژی اینکو مدل CAGLI-1151 بدون باتری و شارژر است این دستگاه جهت برش،پولیش کردن، سنباده زدن بسیاری از سطوح و اجسام از جمله چوب،پروفیل های سبک فلزی و مشابه آن ها طراحی وساخته شده است. این دستگاه بدون باتری و شارژر ارائه شده اما با خرید جداگانه باتری و شارژر اینکو می توانید به صورت مشترک برای سایر ابزارهای شارژی اینکو از باتری 20 ولت استفاده نمایید. دستگاه مینی فرز 20 ولتی اینکو قادر است تا با سرعت گردش در حالت بی باری 8500 دور در دقیقه به کار بر روی انواع چوب، سنگ و فلز بپردازد. قطر صفحه ای که بر روی این ابزار شارژی نصب می شود 115 میلی متر است و برای افزایش امنیت مصرف کننده این فرز به محافظ صفحه مجهز شده است. به علاوه، از قفل اسپیندل برای راحتی و سرعت تعویض صفحه برش استفاده شده است. کولت این مینی فرز از نوع M14 است. از ویژگی های دیگر این فرز دارا بودن دسته جانبی با امکان نصب در دو طرف است که خاصیت ضد لرزش دارد. کلید پاور دستگاه هم برای راحتی کاربر در کنار دستگاه تعبیه شده است. دسته این مینی فرز هم دارای روکش آجدار است که به صورت ضد لرزش و ضد تعریق طراحی شده است تا در کاربردهای طولانی مدت، به همراه قفل سوییچ، راحتی کار را به دنبال داشته باشد. از این مینی فرز می توان برای برش زاویه دار استفاده نمود. در بسته بندی این دستگاه به عنوان لوازم جانبی، آچار صفحه، زغال اضافه، کارت و دفترچه راهنما قرار داده شده است. این مینی فرز بدون باتری و شارژر ارائه شده است و این اقلام باید به صورت جداگانه تهیه شود. این مینی فرز 27×7×10 سانتی متری با وزن 1460 کیلوگرمی خود توسط برند اینکو در کشور چین و تحت استاندارد CE اروپا تولید شدهتری با وزن 1460 کیلوگرمی خود توسط برند اینکو در کشور چین و تحت استاندارد CE اروپا تولید شدهتری با وزن 1460 کیلوگرمی خود توسط برند اینکو در کشور چین و تحت استاندارد CE اروپا تولید شدهتری با وزن 1460 کیلوگرمی خود توسط برند اینکو در کشور چین و تحت استاندارد CE اروپا تولید شدهتری با وزن 1460 کیلوگرمی خود توسط برند اینکو در کشور چین و تحت استاندارد CE اروپا تولید شدهتری با وزن 1460 کیلوگرمی خود توسط برند اینکو در کشور چین و تحت استاندارد CE اروپا تولید شدهتری با وزن 1460 کیلوگرمی خود توسط برند اینکو در کشور چین و تحت استاندارد CE اروپا تولید شدهتری با وزن 1460 کیلوگرمی خود توسط برند اینکو در کشور چین و تحت استاندارد CE اروپا تولید شده است',
                      fontSize: 14,
                      lineHeight: 1.8,
                      textOverflow: TextOverflow.visible,
                      alignment: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
