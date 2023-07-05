import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/Image_shower.dart';
import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/no_item_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/core/widgets/top_page_widget.dart';
import 'package:baash/features/user_profile/presentation/manager/profile_bloc.dart';
import 'package:baash/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CartStatusScreen extends StatefulWidget {
  const CartStatusScreen({Key? key}) : super(key: key);

  @override
  State<CartStatusScreen> createState() => _CartStatusScreenState();
}

class _CartStatusScreenState extends State<CartStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => serviceLocator<ProfileBloc>()..add(PaymentLogEvent()),
          child: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {},
            child: Column(
              children: [
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (blocContext, state) {
                    if (state is PaymentLogLoading) {
                      return const Expanded(
                        child: Center(
                          child: LoadingWidget(),
                        ),
                      );
                    } else if (state is PaymentLogReceived) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 26,
                              ),
                              TextWidget.regular(
                                text: 'سفارش های من',
                                fontSize: 15,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Expanded(
                                child: state.paymentLog.message.isEmpty
                                    ? NoItemWidget(
                                        height: 250,
                                        text: 'در حال حاضر سفارشی برای شما ثبت نشده است.',
                                      )
                                    : ListView.builder(
                                        itemCount: state.paymentLog.message.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                            height: 220,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: AppColor.mainColor,
                                                )),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  textDirection: TextDirection.rtl,
                                                  children: [
                                                    TextWidget.medium(
                                                      text: 'وضعیت: ${state.paymentLog.message[index].status}',
                                                      fontSize: 15,
                                                    ),
                                                    TextWidget.medium(text: '${state.paymentLog.message[index].total.toPersianDigit().seRagham()} ریال'),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  textDirection: TextDirection.rtl,
                                                  children: [
                                                    TextWidget.medium(text: 'کد سفارش: ${state.paymentLog.message[index].orderId}'),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  textDirection: TextDirection.rtl,
                                                  children: [
                                                    TextWidget.regular(text: 'تاریخ: ${state.paymentLog.message[index].updateDate.toPersianDigit()}'),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 12,
                                                ),
                                                Expanded(
                                                  child: ListView.separated(
                                                    reverse: true,
                                                    physics: const BouncingScrollPhysics(),
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: state.paymentLog.message[index].cartItemLogs.length,
                                                    separatorBuilder: (contextX, indexX) {
                                                      return Container(
                                                        color: AppColor.mainColor,
                                                        margin: const EdgeInsets.symmetric(horizontal: 8),
                                                        width: 0.8,
                                                        height: 32,
                                                      );
                                                    },
                                                    itemBuilder: (context, indexS) {
                                                      return Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          SizedBox(
                                                            width: 45,
                                                            height: 45,
                                                            child: ImageNetwork(url: state.paymentLog.message[index].cartItemLogs[indexS].product.img,)
                                                          ),
                                                          TextWidget.regular(text: state.paymentLog.message[index].cartItemLogs[indexS].product.name),
                                                          TextWidget.regular(text: 'تعداد : ${state.paymentLog.message[index].cartItemLogs[indexS].quantity.toString()}'),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget.medium(text: 'مشکلی رخ داده است. لطفا مجددا تلاش کنید.'),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  ButtonWidget(
                                    isEnabled: true,
                                    width: 112,
                                    text: 'تلاش مجدد',
                                    onPressed: () {
                                      blocContext.read<ProfileBloc>().add(
                                            PaymentLogEvent(),
                                          );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
