import 'package:baash/core/constants/string_consts.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/app_main_container.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/core/widgets/top_page_widget.dart';
import 'package:baash/features/user_profile/presentation/manager/profile_bloc.dart';
import 'package:baash/features/user_profile/presentation/pages/edit_profile_detail_screen.dart';
import 'package:baash/features/user_profile/presentation/widgets/profile_appbar_widget.dart';
import 'package:baash/features/user_profile/presentation/widgets/profile_label_widget.dart';
import 'package:baash/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TopPageWidget(title: 'درباره ما'),
              const SizedBox(
                height: 44,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    TextWidget.medium(
                      text:
                          'تیم باش در حوزه ی فروش انواع ابزارالات صنعتی CNC کارگاهی فعالیت می کند طی تجربه چندین ساله در زمینه صنعت نیاز‌های صنعت‌گر را به خوبی شناسایی کرده و در صدد رفع این نیاز‌‌ها و خدمت به صنعتگران زحمت‌کش و پر‌تلاش ایده های متفاوتی در دست اجرا دارد.\n همواره یکی از دغدغه های صنعتگر تهیه ابزار مناسب، باکیفیت و از همه مهمتر با قیمت مناسب می‌باشد و با توجه به آنکه زمان و وقت یک صنعتگر بسیار حائز اهمیت است، تیم باش به صورت شبانه روزی جهت خدمت به صنعتگران تلاش می‌کند. \n صنعتگر با استفاده از اپلیکیشن فروشگاهی باش، ابزار خود را تهیه کرده و صرفه‌جویی فوق‌العاده ای از نظر هزینه و وقت می‌نماید، تیم باش در کمتر از یک ساعت در طول شبانه روز آنرا به دست صنعتگر می‌رساند.\n لازم به ذکر است به زودی شاهد خدمت‌های متفاوت و کاربردی دیگری از تیم باش به صنعتگران محترم و زحمتکش خواهیم بود.\nکلیه سفارشات از ساعت ۶ صبح لغایت ۱۹ عصر نهایتا ظرف مدت یک ساعت در شهر اصفهان ارسال و بدست مشتری خواهد رسید و سفارشات خارج از این محدوده ساعت به روز بعد موکول خواهد شد و در اولین ارسال های روز بعد قرار خواهد گرفت پس از ثبت سفارش و آماده سازی پیک با شما جهت تحویل تماس می‌گیرد و هماهنگی های لازم انجام می‌شود.\nلصفا از حضور خود در محل جهت دریافت سفارش اطمینان حاصل فرمایید.\nپس از دریافت محصول رسید حاوی صحت سلامت و تحویل کالا از شما دریافت می‌گردد. \n  باتشکر گروه صنعتی باش',
                      fontSize: 16,
                      textDirection: TextDirection.rtl,
                      alignment: TextAlign.right,
                      textOverflow: TextOverflow.visible,
                      lineHeight: 2,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Image.asset(
                      'assets/images/app-icon.png',
                      width: 120,
                      height: 120,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse("tel://$url"))) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchInstagram({required String url}) async {
    if (!await launchUrl(Uri.parse("https://www.instagram.com/$url/"))) {
      throw Exception('Could not launch $url');
    }
  }
}
