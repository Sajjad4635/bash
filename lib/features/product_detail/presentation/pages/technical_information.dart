import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/product_detail/domain/entities/product_detail_response.dart';
import 'package:flutter/material.dart';

class TechnicalInformation extends StatelessWidget {
  List<ProductFeatureProductDetailResponse> productFeatures;

  TechnicalInformation({required this.productFeatures, Key? key}) : super(key: key);

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
                      text: 'مشخصات فنی',
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
                  text: 'مشخصات',
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productFeatures.length,
                  itemBuilder: (context, index) {
                    return attItem(title: productFeatures[index].name, text: productFeatures[index].value);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget attItem({required String title, required String text}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerRight,
              child: TextWidget.medium(
                text: title,
                fontSize: 14,
                textOverflow: TextOverflow.visible,
                alignment: TextAlign.right,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: TextWidget.regular(
                    text: text,
                    fontSize: 14,
                    textOverflow: TextOverflow.visible,
                    alignment: TextAlign.right,
                  ),
                ),
                const Divider(thickness: 0.8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
