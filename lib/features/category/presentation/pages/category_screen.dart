import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/home/presentation/manager/cartInquiryBloc/cart_inquiry_bloc.dart';
import 'package:baash/features/home/presentation/manager/categoryBloc/category_bloc.dart';
import 'package:baash/features/home/presentation/pages/productsOfCategory.dart';
import 'package:baash/features/shopping_cart/presentation/pages/shopping_cart_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/profile_main_screen.dart';
import 'package:baash/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int cartInquiryInt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColor.mainColor2),
                                  color: AppColor.backgroundColor,
                                ),
                                child: const Center(
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
                              child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: AppColor.mainColor2),
                                    color: AppColor.backgroundColor,
                                  ),
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
                                  )),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/app-icon.png',
                    width: 55,
                    height: 45,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileMainScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColor.mainColor2),
                        color: AppColor.backgroundColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset('assets/icons/userIcon.svg', color: AppColor.mainColor2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextWidget.bold(text: 'دسته بندی ها'),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: BlocProvider(
                create: (_) => serviceLocator<CategoryBloc>()
                  ..add(
                    GetCategoryListEvent(),
                  ),
                child: BlocListener<CategoryBloc, CategoryState>(
                  listener: (context, state) {
                    if (state is CartInquiryCReceived) {
                      setState(() {
                        if (state.cartInquiry.message!.quantity != null) {
                          cartInquiryInt = state.cartInquiry.message!.quantity!;
                        }
                      });
                      context.read<CategoryBloc>().add(
                            GetCategoryListEvent(),
                          );
                    }
                  },
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (contextB, state) {
                      if (state is GetCategoryListLoading) {
                        return Column(
                          children: const [
                            LoadingWidget(),
                          ],
                        );
                      } else if (state is CategoryListReceived) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                            itemCount: state.categoryList.message.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductsOfCategory(
                                        categoryId: state.categoryList.message[index].id,
                                        categoryName: state.categoryList.message[index].name,
                                      ),
                                    ),
                                  ).then((value) {
                                    contextB.read<CategoryBloc>().add(GetCartInquiryCEvent());
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 11),
                                  height: 89,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: SvgPicture.network(
                                            state.categoryList.message[index].img,
                                            color: Colors.black,
                                            placeholderBuilder: (BuildContext context) => Container(padding: const EdgeInsets.all(30.0), child: const CircularProgressIndicator()),
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
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      TextWidget.medium(text: state.categoryList.message[index].name)
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
                                  contextB.read<CategoryBloc>().add(GetCategoryListEvent());
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
          ],
        ),
      ),
    );
  }

  Widget showNoItemWidget(bool noImageItem) {
    return noImageItem ? Image.asset('assets/images/no_item_image_1.png') : Image.asset('assets/images/no_item_image_2.png');
  }
}
