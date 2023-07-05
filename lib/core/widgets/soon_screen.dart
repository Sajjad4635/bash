import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/top_page_widget.dart';
import 'package:flutter/material.dart';

class SoonScreen extends StatefulWidget {
  String title;

  SoonScreen({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<SoonScreen> createState() => _SoonScreenState();
}

class _SoonScreenState extends State<SoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TopPageWidget(title: widget.title),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Center(child: Image.asset('assets/images/soon_image.png')),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
