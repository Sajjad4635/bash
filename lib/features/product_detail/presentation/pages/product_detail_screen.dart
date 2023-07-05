import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/Image_shower.dart';
import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/show_snack_bar.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/home/presentation/manager/cartInquiryBloc/cart_inquiry_bloc.dart';
import 'package:baash/features/product_detail/domain/entities/product_detail_response.dart';
import 'package:baash/features/product_detail/presentation/manager/product_detail_bloc.dart';
import 'package:baash/features/product_detail/presentation/pages/overall_information.dart';
import 'package:baash/features/product_detail/presentation/pages/show_images.dart';
import 'package:baash/features/product_detail/presentation/pages/technical_information.dart';
import 'package:baash/features/shopping_cart/presentation/pages/shopping_cart_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/create_profile_detail_screen.dart';
import 'package:baash/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductDetailScreen extends StatefulWidget {
  int id;
  String brand;

  ProductDetailScreen({required this.id, required this.brand, Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int cartInquiryInt = 0;
  List<OtherProductErProductDetailResponse> tempDropDown = [];
  OtherProductErProductDetailResponse? dropdownValue;
  String? erTemp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => serviceLocator<ProductDetailBloc>()
            ..add(
              GetProductDetailEvent(
                id: widget.id,
              ),
            ),
          child: BlocListener<ProductDetailBloc, ProductDetailState>(
            listener: (context, state) {
              if (state is ProductDetailReceived) {
                tempDropDown.clear();
                for (int i = 0; i < state.allProducts.message.otherProductEr.length; i++) {
                  tempDropDown.add(state.allProducts.message.otherProductEr[i]);
                }
                if (tempDropDown.isNotEmpty) {
                  dropdownValue = tempDropDown.first;
                }
              }
              if (state is AddedToCartDetailPage) {
                ShowSnackBar().showSuccessMessage(context: context, message: 'کالا به سبد خرید افزوده شد.');
                context.read<ProductDetailBloc>().add(
                      GetProductDetailEvent(
                        id: widget.id,
                      ),
                    );
              }
              if (state is AddToCartDetailPageError) {
                ShowSnackBar().showError(context: context, message: 'کالا در انبار موجود نمی باشد.');
                context.read<ProductDetailBloc>().add(GetProductDetailEvent(id: widget.id));
              }
              if (state is UserProfileReceived) {
                if (state.userProfile.message.profile != null) {
                  context.read<ProductDetailBloc>().add(AddToCartDetailPageEvent(id: widget.id.toString()));
                } else {
                  ShowSnackBar().showError(context: context, message: 'لطفا پروفایل کاربری خود را تکمیل کنید.');
                  context.read<ProductDetailBloc>().add(GetProductDetailEvent(id: widget.id));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateProfileDetailScreen(
                        name: '',
                        lastName: '',
                        address: '',
                        shopName: '',
                        mobile: '',
                        email: '',
                      ),
                    ),
                  );
                }
              }
            },
            child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
              builder: (blocContext, state) {
                if (state is GetProductDetailLoading || state is AddToCartDetailPageLoading || state is GetUserProfileLoading) {
                  return const Center(
                    child: LoadingWidget(),
                  );
                } else if (state is ProductDetailReceived) {
                  // erTemp = state.allProducts.message.er;
                  return Column(
                    children: [
                      const SizedBox(
                        height: 26,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.rtl,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(blocContext);
                              },
                              child: const Icon(
                                Icons.close,
                                color: AppColor.mainColor2,
                                size: 22,
                              ),
                            ),
                            BlocProvider(
                              create: (_) => serviceLocator<cartInquiryBloc>()..add(GetCartInquiryEvent()),
                              child: BlocListener<cartInquiryBloc, cartInquiryState>(
                                listener: (context, state) {
                                  if (state is CartInquiryReceived) {
                                    if (state.cartInquiry.message!.quantity != null) {
                                      cartInquiryInt = state.cartInquiry.message!.quantity!;
                                    }
                                  }
                                },
                                child: BlocBuilder<cartInquiryBloc, cartInquiryState>(
                                  builder: (contextB, state) {
                                    if (state is GetCartInquiryLoading) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: const SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Center(
                                            child: LoadingWidget(size: 15),
                                          ),
                                        ),
                                      );
                                    } else if (state is CartInquiryReceived) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(contextB, MaterialPageRoute(builder: (context) => const ShoppingCartScreen())).then((value) {
                                            contextB.read<cartInquiryBloc>().add(GetCartInquiryEvent());
                                          });
                                        },
                                        child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Stack(
                                            children: [
                                              const Center(
                                                child: Icon(
                                                  Icons.shopping_cart_outlined,
                                                  color: AppColor.mainColor2,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.bottomRight,
                                                child: state.cartInquiry.message!.quantity == null
                                                    ? const SizedBox()
                                                    : Container(
                                                        width: 15,
                                                        height: 15,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(100),
                                                          color: Colors.red,
                                                        ),
                                                        child: Center(
                                                            child: TextWidget.medium(
                                                          text: cartInquiryInt.toString(),
                                                          color: Colors.white,
                                                          fontSize: 8,
                                                        )),
                                                      ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              InkWell(
                                onTap: () {
                                  if (state.allProducts.message.supplementaryImages.isNotEmpty) {
                                    Navigator.push(
                                      blocContext,
                                      MaterialPageRoute(
                                        builder: (context) => ShowImages(imageList: state.allProducts.message.supplementaryImages),
                                      ),
                                    );
                                  }
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(blocContext).size.width,
                                  height: MediaQuery.of(blocContext).size.height / 3.5,
                                  child: ClipRRect(borderRadius: BorderRadius.circular(10), child: ImageNetwork(url: state.allProducts.message.img)),
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: AppColor.mainColor.withOpacity(0.2)),
                                    child: SvgPicture.network(
                                      state.allProducts.message.category.img.toString(),
                                      // loadingBuilder: (context, w, l) {
                                      //   return const LoadingWidget();
                                      // },
                                      // errorBuilder: (context, error, o) {
                                      //   return const Icon(
                                      //     Icons.error_outline,
                                      //     color: Colors.red,
                                      //   );
                                      // },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: TextWidget.medium(
                                      text: state.allProducts.message.category.name,
                                      color: AppColor.mainColor2,
                                    ),
                                  ),
                                  const Spacer(),
                                  state.allProducts.message.inventory <= 5 && state.allProducts.message.inventory != 0
                                      ? TextWidget.regular(
                                          text: 'تنها ${state.allProducts.message.inventory} عدد در انبار ',
                                          color: Colors.red,
                                        )
                                      : state.allProducts.message.inventory == 0
                                          ? TextWidget.regular(
                                              text: 'ناموجود',
                                              color: Colors.red,
                                            )
                                          : const SizedBox()
                                ],
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget.bold(
                                    text: '${state.allProducts.message.name} (${widget.brand})',
                                    fontSize: 16,
                                    textOverflow: TextOverflow.visible,
                                    alignment: TextAlign.center,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              const Divider(),
                              Container(
                                alignment: Alignment.centerRight,
                                child: TextWidget.medium(
                                  text: 'انتخاب R/er',
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              tempDropDown.isNotEmpty
                                  ? SizedBox(
                                      height: 46,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        reverse: true,
                                        itemCount: tempDropDown.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              print(erTemp);
                                              print(tempDropDown[index].er);
                                              erTemp = tempDropDown[index].er;
                                              blocContext.read<ProductDetailBloc>().add(
                                                    GetProductDetailEvent(
                                                      id: widget.id,
                                                    ),
                                                  );
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                              margin: const EdgeInsets.symmetric(horizontal: 3),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: erTemp == state.allProducts.message.otherProductEr[index].er ? AppColor.mainColor2 : AppColor.disableGrey,
                                                ),
                                              ),
                                              child: Center(
                                                child: TextWidget.regular(
                                                  text: '${tempDropDown[index].name} (${tempDropDown[index].er})',
                                                  textDirection: TextDirection.rtl,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                height: 22,
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: TextWidget.medium(
                                  text: state.allProducts.message.descriptions,
                                  textDirection: TextDirection.rtl,
                                  textOverflow: TextOverflow.visible,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              SizedBox(
                                  // height: 250,
                                  child: showDetail(productFeatures: state.allProducts.message.productFeatures)),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    blocContext,
                                    MaterialPageRoute(
                                      builder: (context) => TechnicalInformation(productFeatures: state.allProducts.message.productFeatures),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 64,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      TextWidget.medium(
                                        text: 'مشخصات بیشتر محصول',
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(thickness: 0.8),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    blocContext,
                                    MaterialPageRoute(
                                      builder: (context) => OverallInformation(
                                        des: state.allProducts.message.descriptions,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 64,
                                  alignment: Alignment.centerRight,
                                  child: TextWidget.medium(
                                    text: 'معرفی اجمالی محصول',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (state is AddToCartDetailPageLoading)
                                  ? const SizedBox(
                                      width: 168,
                                      child: Center(
                                        child: LoadingWidget(),
                                      ),
                                    )
                                  : ButtonWidget(
                                      isEnabled: true,
                                      width: 168,
                                      text: 'افزودن به سبد خرید',
                                      onPressed: () {
                                        if (state.allProducts.message.inventory == 0) {
                                          ShowSnackBar().showError(context: context, message: 'کالا در انبار موجود نمی باشد.');
                                        } else {
                                          blocContext.read<ProductDetailBloc>().add(GetUserProfileEvent());
                                        }
                                      },
                                    ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: TextWidget.medium(
                                  text: '${state.allProducts.message.price.toPersianDigit().seRagham()} ریال',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
                            blocContext.read<ProductDetailBloc>().add(
                                  GetProductDetailEvent(id: widget.id),
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
        ),
      ),
    );
  }

  Widget showNoItemWidget(bool noImageItem) {
    return noImageItem ? Image.asset('assets/images/no_item_image_1.png') : Image.asset('assets/images/no_item_image_2.png');
  }

  Widget showDetail({required List<ProductFeatureProductDetailResponse> productFeatures}) {
    return Column(
      children: [
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
        productFeatures.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  attItem(title: productFeatures[0].name, text: productFeatures[0].value),
                  productFeatures.length <= 1 ? const SizedBox() : attItem(title: productFeatures[1].name, text: productFeatures[1].value),
                  productFeatures.length <= 2 ? const SizedBox() : attItem(title: productFeatures[2].name, text: productFeatures[2].value),
                  productFeatures.length <= 3 ? const SizedBox() : attItem(title: productFeatures[3].name, text: productFeatures[3].value),
                  productFeatures.length <= 4 ? const SizedBox() : attItem(title: productFeatures[4].name, text: productFeatures[4].value),
                ],
              )
      ],
    );
  }

  Widget attItem({required String title, required String text}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      height: 48,
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
