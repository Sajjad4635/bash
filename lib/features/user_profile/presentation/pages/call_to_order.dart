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

class CallToOrder extends StatefulWidget {
  const CallToOrder({Key? key}) : super(key: key);

  @override
  State<CallToOrder> createState() => _CallToOrderState();
}

class _CallToOrderState extends State<CallToOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TopPageWidget(title: 'تهیه ابزار تلفنی'),
              const SizedBox(
                height: 44,
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    TextWidget.medium(
                      text:
                          'از آنجایی که تنوع ابزار‌های صنعتی بسیار بالا هستند و امکان نبود آن در انبار باش وجود دارد، تیم باش جهت رفاه حال صنعتگران محترم این امکان را فراهم نموده که با ثبت سفارش ابزار خاص و دلخواه صنعتگر، تیم باش سریعا جهت تهیه و فراهم نمودن آن اقدام می‌کند.',
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
                    const SizedBox(
                      height: 58,
                    ),
                    InkWell(
                      onTap: () {
                        _launchUrl(url: '09936162477');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          const Icon(
                            Icons.call,
                            size: 28,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextWidget.bold(
                            text: '09936162477',
                            fontSize: 16,
                          )
                        ],
                      ),
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
}
