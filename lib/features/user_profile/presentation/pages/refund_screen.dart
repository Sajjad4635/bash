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

class RefundScreen extends StatefulWidget {
  const RefundScreen({Key? key}) : super(key: key);

  @override
  State<RefundScreen> createState() => _RefundScreenState();
}

class _RefundScreenState extends State<RefundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TopPageWidget(title: 'عودت سفارش'),
              const SizedBox(
                height: 44,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    TextWidget.medium(
                      text:
                          'جهت عودت کالا خریداری شده به شماره ۰۹۹۳۶۱۶۲۴۷۷ در پیام رسان ایتا کد سفارش و نام محصول خریداری شده را در یک پیام ارسال کنید تا کارشناسان ما با شما تماس حاصل فرمایند.\nلارم به ذکر می‌باشد عودت کالا در صورت کاملا سالم و استفاده نشده امکان پذیر است و هرگونه خسارت فیزیکی با کالا شامل عودت نمی‌باشد.\nجهت برسی کارشناس ما در محل حضور پیدا می‌کند و کالا را دریافت می‌کند و وجه تا ۲۴ ساعت بعد به شماره حساب شما واریز خواهد شد.',
                      fontSize: 16,
                      textDirection: TextDirection.rtl,
                      lineHeight: 2,
                      alignment: TextAlign.right,
                      textOverflow: TextOverflow.visible,
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
