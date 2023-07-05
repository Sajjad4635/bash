import 'package:baash/core/local_storage/preferences/pref.dart';
import 'package:baash/core/network/token_handler.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/Image_shower.dart';
import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/no_item_widget.dart';
import 'package:baash/core/widgets/show_snack_bar.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/core/widgets/top_page_widget.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/params/payment_params.dart';
import 'package:baash/features/shopping_cart/presentation/manager/cart_bloc.dart';
import 'package:baash/features/shopping_cart/presentation/pages/receipt_screen.dart';
import 'package:baash/injection.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  String? name;
  String? lastName;
  String? shopName;
  String? address;
  String? mobile;

  @override
  void initState() {
    setVar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => serviceLocator<CartBloc>()..add(GetCartEvent()),
          child: BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state is AddedToCart) {
                ShowSnackBar().showSuccessMessage(context: context, message: 'کالا با موفقیت افزوده شد.');
                context.read<CartBloc>().add(GetCartEvent());
              }
              if (state is AddToCartError) {
                ShowSnackBar().showError(context: context, message: 'کالا در انبار موجود نمی باشد.');
                context.read<CartBloc>().add(GetCartEvent());
              }
              if (state is DeletedFromCart) {
                ShowSnackBar().showSuccessMessage(context: context, message: 'کالا از سبد شما حذف شد.');
                context.read<CartBloc>().add(GetCartEvent());
              }
              if (state is DeleteFromCartError) {
                ShowSnackBar().showError(context: context, message: 'مشکلی پیش آمده است لطفا مجددا تلاش کنید.');
                context.read<CartBloc>().add(GetCartEvent());
              }
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TopPageWidget(title: 'سبد خرید'),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (blocContext, state) {
                      if (state is GetCartLoading || state is AddToCartLoading || state is DeleteFromCartLoading) {
                        return const Center(
                          child: LoadingWidget(),
                        );
                      } else if (state is CartReceived) {
                        return Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: state.cartResponse.message.cartItems.isEmpty
                                    ? NoItemWidget(
                                        text: 'سبد خرید شما خالی است.',
                                      )
                                    : ListView.separated(
                                        itemCount: state.cartResponse.message.cartItems.length,
                                        separatorBuilder: (contextS, indexS) {
                                          return const Divider(
                                            thickness: 0.8,
                                          );
                                        },
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {},
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                              child: Container(
                                                height: 184,
                                                padding: const EdgeInsets.all(12),
                                                child: Row(
                                                  textDirection: TextDirection.rtl,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(10),
                                                              child: ImageNetwork(url: state.cartResponse.message.cartItems[index].product.img,)
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 12,
                                                          ),
                                                          Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed: () {
                                                                    blocContext.read<CartBloc>().add(DeleteFromCartEvent(id: state.cartResponse.message.cartItems[index].product.id.toString()));
                                                                  },
                                                                  icon: SvgPicture.asset(
                                                                    state.cartResponse.message.cartItems[index].quantity == 1 ? 'assets/icons/trash_icon.svg' : 'assets/icons/minus_icon.svg',
                                                                    color: AppColor.textColor,
                                                                    width: 20,
                                                                  )),
                                                              TextWidget.regular(text: state.cartResponse.message.cartItems[index].quantity.toString().toPersianDigit()),
                                                              IconButton(
                                                                onPressed: () {
                                                                  blocContext.read<CartBloc>().add(AddToCartEvent(id: state.cartResponse.message.cartItems[index].product.id.toString()));
                                                                },
                                                                icon: SvgPicture.asset(
                                                                  'assets/icons/plus_icon.svg',
                                                                  color: AppColor.textColor,
                                                                  width: 20,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      flex: 6,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Container(
                                                            margin: const EdgeInsets.only(top: 4),
                                                            child: Column(
                                                              textDirection: TextDirection.rtl,
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                TextWidget.regular(
                                                                  text: state.cartResponse.message.cartItems[index].product.name,
                                                                  fontSize: 13,
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                TextWidget.regular(
                                                                  text: ' ${state.cartResponse.message.cartItems[index].product.price.toString().toPersianDigit().seRagham()} ریال',
                                                                  fontSize: 13,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 7,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ),
                            Container(
                              height: 93,
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: AppColor.mainColor.withOpacity(0.3)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      TextWidget.regular(text: 'مجموع'),
                                      TextWidget.bold(
                                        text: '${state.cartResponse.message.total.toString().toPersianDigit().seRagham()} ریال',
                                        fontSize: 20,
                                      ),
                                    ],
                                  ),
                                  ButtonWidget(
                                    isEnabled: true,
                                    width: 184,
                                    text: 'پرداخت',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ReceiptScreen(
                                            paymentId: state.cartResponse.message.paymentId,
                                            amount: state.cartResponse.message.total,
                                            name: name.toString(),
                                            lastName: lastName.toString(),
                                            shopName: shopName.toString(),
                                            address: address.toString(),
                                            mobile: mobile.toString(),
                                            cartItems: state.cartResponse.message.cartItems,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return SizedBox(
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
                                  blocContext.read<CartBloc>().add(
                                        GetCartEvent(),
                                      );
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showNoItemWidget(bool noImageItem) {
    return noImageItem ? Image.asset('assets/images/no_item_image_1.png') : Image.asset('assets/images/no_item_image_2.png');
  }

  void setVar() async {
    
    print(':::::::::::::::::::::::::::::::::::::::');
    print(await Pref.get('name'));
    print(await Pref.get('lastName'));
    print(await Pref.get('shopName'));
    print(await Pref.get('address'));
    print(await Pref.get('mobile'));

    name = await Pref.get('name');
    lastName = await Pref.get('lastName');
    shopName = await Pref.get('shopName');
    address = await Pref.get('address');
    mobile = await Pref.get('mobile');
  }
}
