import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/core/widgets/top_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TopPageWidget(title: 'پشتیبانی'),
              const SizedBox(
                height: 44,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _launchUrl(url: '09936162477');
                    },
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        const Icon(
                          Icons.call,
                          size: 32,
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
                  const SizedBox(
                    height: 13,
                  ),
                  InkWell(
                    onTap: () {
                      // _launchUrl(url: '03133876616');
                    },
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Image.asset('assets/images/05.png', width:35,),
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
                  const SizedBox(
                    height: 13,
                  ),
                  InkWell(
                    onTap: () {
                      // _launchInstagram(url: '@bash_app2023');
                    },
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Instagram-Logo.wine.svg',
                          width: 45,
                          height: 45,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        TextWidget.bold(
                          text: 'Bash_app2023@',
                          fontSize: 16,
                        )
                      ],
                    ),
                  )
                ],
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
