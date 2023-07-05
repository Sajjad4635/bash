import 'package:baash/core/constants/scroll_const.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/Image_shower.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/no_item_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/home/domain/entities/all_products_response.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:baash/features/home/presentation/manager/bannersBloc/Banners_bloc.dart';
import 'package:baash/features/home/presentation/manager/cartInquiryBloc/cart_inquiry_bloc.dart';
import 'package:baash/features/home/presentation/manager/categoryBloc/category_bloc.dart';
import 'package:baash/features/home/presentation/manager/productsBloc/products_bloc.dart';
import 'package:baash/features/home/presentation/pages/productsOfCategory.dart';
import 'package:baash/features/home/presentation/pages/searchScreen.dart';
import 'package:baash/features/product_detail/presentation/pages/product_detail_screen.dart';
import 'package:baash/features/shopping_cart/presentation/pages/shopping_cart_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/call_to_order.dart';
import 'package:baash/features/user_profile/presentation/pages/profile_main_screen.dart';
import 'package:baash/injection.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _controller = CarouselController();

  int _current = 0;
  bool noImageItem = true;

  int cartInquiryInt = 0;

  List<Widget> sliderItems = [];

  List<Widget> sliderItemsSh = [
    Image.asset('assets/images/banner.png'),
    Image.asset('assets/images/banner.png'),
    Image.asset('assets/images/banner.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 50,
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        category: 0,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 49,
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColor.mainColor)),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      TextWidget.medium(
                        text: 'جست و جو در',
                        color: AppColor.hintColor,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      TextWidget.bold(
                        text: 'باش',
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  cacheExtent: 1000,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      child: BlocProvider(
                        create: (_) => serviceLocator<BannersBloc>()..add(GetBannersEvent()),
                        child: BlocListener<BannersBloc, BannersState>(
                          listener: (context, state) {
                            if (state is BannersReceived) {
                              sliderItems.clear();
                              for (final element in state.banners.message) {
                                sliderItems.add(
                                    ImageNetwork(url: element.img.toString())
                                );
                              }
                            }
                          },
                          child: BlocBuilder<BannersBloc, BannersState>(
                            builder: (context, state) {
                              if (state is GetBannersLoading) {
                                return const SizedBox();
                              } else if (state is BannersReceived) {
                                return Column(
                                  children: [
                                    CarouselSlider(
                                      items: sliderItems,
                                      carouselController: _controller,
                                      options: CarouselOptions(
                                        aspectRatio: 318 / 160,
                                        viewportFraction: 0.8,
                                        initialPage: 0,
                                        enableInfiniteScroll: true,
                                        reverse: true,
                                        autoPlay: true,
                                        autoPlayInterval: const Duration(seconds: 10),
                                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.3,
                                        pageSnapping: true,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _current = index;
                                          });
                                        },
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        textDirection: TextDirection.rtl,
                                        children: sliderItems.asMap().entries.map((entry) {
                                          return GestureDetector(
                                            onTap: () => _controller.animateToPage(entry.key),
                                            child: Container(
                                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                                child: _current == entry.key
                                                    ? Neumorphic(
                                                        style: NeumorphicStyle(
                                                          shadowDarkColorEmboss: AppColor.darkDepthColor,
                                                          shadowLightColorEmboss: AppColor.lightDepthColor,
                                                          depth: -2,
                                                        ),
                                                        child: Container(
                                                          width: 11.14,
                                                          height: 11.14,
                                                          decoration: const BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: AppColor.mainGrey,
                                                          ),
                                                          child: Center(
                                                            child: Container(
                                                              width: 8.41,
                                                              height: 8.41,
                                                              decoration: const BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                color: AppColor.mainColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Neumorphic(
                                                        style: NeumorphicStyle(
                                                          depth: -2,
                                                          shadowDarkColorEmboss: AppColor.darkDepthColor,
                                                          shadowLightColorEmboss: Colors.white.withOpacity(0.75),
                                                        ),
                                                        child: Container(
                                                            width: 9.18,
                                                            height: 9.18,
                                                            decoration: const BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: Colors.black,
                                                            )),
                                                      )),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CallToOrder()));
                          },
                          child: Container(
                            width: 236,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.mainColor,
                            ),
                            child: Center(
                              child: TextWidget.regular(text: 'تهیه ابزار تلفنی'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    BlocProvider(
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
                              return const SizedBox(
                                height: 89,
                                child: LoadingWidget(),
                              );
                            } else if (state is CategoryListReceived) {
                              return Container(
                                height: 89,
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  reverse: true,
                                  physics: const BouncingScrollPhysics(),
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
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: SvgPicture.network(
                                                  state.categoryList.message[index].img.toString(),
                                                  color: Colors.black,
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
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    productList(
                      catTitle: 'ابزار اندازه گیری',
                      catId: 1,
                    ),
                    productList(
                      catTitle: 'ابزار فرزکاری',
                      catId: 2,
                    ),
                    productList(
                      catTitle: 'ابزار تراشکاری',
                      catId: 3,
                    ),
                    productList(
                      catTitle: 'ابزار کارگاهی',
                      catId: 4,
                    ),
                    productList(
                      catTitle: 'ابزار جوشکاری',
                      catId: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar({required List<ResultAllProductsResponse> productList, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 49,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColor.mainColor)),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 16,
            ),
            TextWidget.medium(
              text: 'جست و جو در',
              color: AppColor.hintColor,
            ),
            const SizedBox(
              width: 7,
            ),
            TextWidget.bold(
              text: 'باش',
              color: Colors.grey,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget showNoItemWidget(bool noImageItem) {
    return noImageItem ? Image.asset('assets/images/no_item_image_1.png') : Image.asset('assets/images/no_item_image_2.png');
  }

  Widget productList({
    required String catTitle,
    required int catId,
  }) {
    return Column(
      children: [
        Container(
          height: 27,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          alignment: Alignment.centerRight,
          child: TextWidget.bold(
            text: catTitle,
            fontSize: 14,
          ),
        ),
        SizedBox(
          child: BlocProvider(
            create: (_) => serviceLocator<ProductsHomeBloc>()
              ..add(
                GetAllProductsEvent(
                  params: AllProductsParams(
                    pageSize: 10,
                    category: catId,
                  ),
                ),
              ),
            child: BlocListener<ProductsHomeBloc, ProductsState>(
                listener: (context, state) {
                  if (state is CartInquiryTReceived) {
                    setState(() {
                      if (state.cartInquiry.message!.quantity != null) {
                        cartInquiryInt = state.cartInquiry.message!.quantity!;
                      }
                    });
                    context.read<ProductsHomeBloc>().add(
                          GetAllProductsEvent(
                            params: AllProductsParams(pageSize: 10, category: catId),
                          ),
                        );
                  }
                },
                child: SizedBox(
                  height: 259,
                  child: BlocBuilder<ProductsHomeBloc, ProductsState>(
                    builder: (contextB, state) {
                      if (state is GetAllProductsLoading) {
                        return const Center(
                          child: LoadingWidget(),
                        );
                      } else if (state is AllProductsReceived) {
                        return Container(
                          child: state.allProducts.message.results.isEmpty
                              ? Column(
                                  children: [
                                    NoItemWidget(),
                                  ],
                                )
                              : ListView.separated(
                                  itemCount: state.allProducts.message.results.length,
                                  scrollDirection: Axis.horizontal,
                                  cacheExtent: 1000,
                                  reverse: true,
                                  physics: mainScrollPhysics,
                                  separatorBuilder: (contextS, indexS) {
                                    return Container(
                                      height: 100,
                                      width: 0.8,
                                      margin: const EdgeInsets.symmetric(horizontal: 24),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.mainColor.withOpacity(0.8)),
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductDetailScreen(
                                              id: state.allProducts.message.results[index].id.toInt(),
                                              brand: state.allProducts.message.results[index].brand,
                                            ),
                                          ),
                                        ).then((value) {
                                          contextB.read<ProductsHomeBloc>().add(GetCartInquiryTEvent());
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Container(
                                          width: 149,
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            textDirection: TextDirection.rtl,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: state.allProducts.message.results[index].img == null
                                                    ? const Center(
                                                        child: Icon(
                                                        Icons.error,
                                                        color: Colors.red,
                                                      ))
                                                    : ClipRRect(
                                                        borderRadius: BorderRadius.circular(10),
                                                        child: ImageNetwork(url: state.allProducts.message.results[index].img!,)
                                                      ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  margin: const EdgeInsets.only(top: 4),
                                                  child: Column(
                                                    textDirection: TextDirection.rtl,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.centerRight,
                                                        width: 82,
                                                        height: 26,
                                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: Colors.grey.withOpacity(0.2),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          textDirection: TextDirection.rtl,
                                                          children: [
                                                            Icon(
                                                              Icons.account_tree_outlined,
                                                              size: 16,
                                                              color: state.allProducts.message.results[index].exsist ? Colors.green : Colors.red,
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            TextWidget.regular(text: state.allProducts.message.results[index].exsist ? 'موجود' : 'ناموجود')
                                                          ],
                                                        ),
                                                      ),
                                                      TextWidget.medium(
                                                        text: '${state.allProducts.message.results[index].name} (${state.allProducts.message.results[index].brand})',
                                                        textOverflow: TextOverflow.visible,
                                                        alignment: TextAlign.right,
                                                        fontSize: 13,
                                                      ),
                                                      Container(
                                                        alignment: Alignment.centerLeft,
                                                        child: TextWidget.bold(
                                                          text: ' ${state.allProducts.message.results[index].price.toString().toPersianDigit().seRagham()} ریال',
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
