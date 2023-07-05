import 'dart:async';

import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/Image_shower.dart';
import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/show_snack_bar.dart';
import 'package:baash/core/widgets/text_field_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/core/widgets/top_page_widget.dart';
import 'package:baash/features/shopping_cart/domain/entities/get_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/params/payment_params.dart';
import 'package:baash/features/shopping_cart/presentation/manager/cart_bloc.dart';
import 'package:baash/injection.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class ReceiptScreen extends StatefulWidget {
  String amount;
  int paymentId;
  String name;
  String lastName;
  String shopName;
  String address;
  String mobile;
  List<CartItemGetCartResponsea> cartItems;

  ReceiptScreen({
    required this.amount,
    required this.paymentId,
    required this.name,
    required this.lastName,
    required this.shopName,
    required this.address,
    required this.mobile,
    required this.cartItems,
    Key? key,
  }) : super(key: key);

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    nameController.text = '${widget.name} ${widget.lastName}'.replaceAll('null', '');
    mobileController.text = widget.mobile.replaceAll('null', '');
    addressController.text = widget.address.replaceAll('null', '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => serviceLocator<CartBloc>()..add(GetCartEvent()),
          child: BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              //print(':::::::::::::::::::::$state');
              if (state is PaymentCreated) {
                ShowSnackBar().showSuccessMessage(context: context, message: 'شما به درگاه پرداخت منتقل می شوید.');
                _launchUrl(url: state.payment.message.message);
                context.read<CartBloc>().add(GetCartEvent());
              }
            },
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(45),
                              bottomLeft: Radius.circular(45),
                            ),
                            color: AppColor.mainColor2.withOpacity(0.7)),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TopPageWidget(title: 'مشخصات خرید'),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 2 / 3,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColor.mainColor2,
                            ),
                            color: AppColor.backgroundColor),
                        child: Column(
                          children: [
                            Image.asset('assets/icons/successful.png'),
                            const SizedBox(
                              height: 12,
                            ),
                            TextWidget.medium(
                              text: 'مشخصات سفارش',
                              fontSize: 18,
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Expanded(
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  dataItem('مبلغ:', '${widget.amount.toString().toPersianDigit().seRagham()} ریال'),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: TextWidget.regular(text: 'نام و نام خانوادگی'),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFieldWidget(hintText: '', textController: nameController),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: TextWidget.regular(text: 'شماره همراه:'),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFieldWidget(hintText: '', textController: mobileController),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: TextWidget.regular(text: 'آدرس'),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFieldWidget(hintText: '', textController: addressController),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: TextWidget.medium(
                                      text: 'کالاهای سفارش',
                                      color: AppColor.mainColor2,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    height: 196,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      reverse: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: widget.cartItems.length,
                                      separatorBuilder: (contextS, indexS) {
                                        return Container(
                                          width: 0.8,
                                          margin: const EdgeInsets.symmetric(horizontal: 12),
                                          color: AppColor.mainColor,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 67,
                                              child: Center(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: ImageNetwork(url: widget.cartItems[index].product.img,)
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            SizedBox(
                                              height: 89,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    textDirection: TextDirection.rtl,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      TextWidget.regular(
                                                        text: widget.cartItems[index].product.name,
                                                        fontSize: 11,
                                                      ),
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      TextWidget.regular(
                                                        text: ' ${widget.cartItems[index].product.price.toString().toPersianDigit().seRagham()} ریال',
                                                        fontSize: 11,
                                                      ),
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      TextWidget.regular(
                                                        text: 'x ${widget.cartItems[index].quantity}',
                                                        fontSize: 11,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (blocContext, state) {
                          if (state is CreatePaymentLoading) {
                            return Container(
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.backgroundColor,
                                  border: Border.all(
                                    color: AppColor.mainColor,
                                    width: 1.5,
                                  )),
                              child: const Center(
                                child: LoadingWidget(),
                              ),
                            );
                          } else {
                            return ButtonWidget(
                              isEnabled: true,
                              text: 'تایید',
                              onPressed: () {
                                blocContext.read<CartBloc>().add(
                                      CreatePaymentEvent(
                                        params: CreatePaymentParams(
                                            cart: widget.paymentId,
                                            firstName: nameController.text,
                                            lastName: nameController.text,
                                            phoneNumber: mobileController.text.toEnglishDigit(),
                                            email: '',
                                            address: addressController.text,
                                            mobile: mobileController.text.toEnglishDigit(),
                                            amount: widget.amount.toEnglishDigit()),
                                      ),
                                    );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dataItem(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          TextWidget.regular(
            text: title,
            fontSize: 12,
            color: AppColor.textColor,
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: AppColor.textColor.withOpacity(0.4),
              dashRadius: 2.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          TextWidget.regular(
            text: value,
            fontSize: 14,
            color: AppColor.textColor,
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
