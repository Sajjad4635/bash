import 'package:baash/core/constants/scroll_const.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/Image_shower.dart';
import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/no_item_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/home/domain/entities/all_products_response.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:baash/features/home/presentation/manager/productsBloc/products_bloc.dart';
import 'package:baash/features/home/presentation/pages/searchScreen.dart';
import 'package:baash/features/product_detail/presentation/pages/product_detail_screen.dart';
import 'package:baash/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductsOfCategory extends StatefulWidget {
  int categoryId;
  String categoryName;

  ProductsOfCategory({required this.categoryId, required this.categoryName, Key? key}) : super(key: key);

  @override
  State<ProductsOfCategory> createState() => _ProductsOfCategoryState();
}

class _ProductsOfCategoryState extends State<ProductsOfCategory> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
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
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: AppColor.mainColor2,
                      size: 22,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.transparent,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextWidget.medium(
                text: 'لیست محصولات در دسته بندی ${widget.categoryName}',
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: BlocProvider(
                create: (_) => serviceLocator<ProductsHomeBloc>()
                  ..add(
                    GetAllProductsEvent(
                      params: AllProductsParams(category: widget.categoryId, pageSize: 1000),
                    ),
                  ),
                child: BlocBuilder<ProductsHomeBloc, ProductsState>(
                  builder: (blocContext, state) {
                    if (state is GetAllProductsLoading) {
                      return const Center(
                        child: LoadingWidget(),
                      );
                    } else if (state is AllProductsReceived) {
                      //print(':::::::::::::::::::::::::::::::::::');
                      //print(state.allProducts.message.results.isEmpty);
                      return Container(
                        child: state.allProducts.message.results.isEmpty
                            ? SizedBox(
                                height: 250,
                                child: NoItemWidget(),
                              )
                            : Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        blocContext,
                                        MaterialPageRoute(
                                          builder: (context) => SearchScreen(
                                            category: widget.categoryId,
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
                                    child: state.allProducts.message.results.isEmpty
                                        ? Center(
                                            child: NoItemWidget(
                                              height: 250,
                                              text: 'موردی یافت نشد!',
                                            ),
                                          )
                                        : ListView.separated(
                                            itemCount: state.allProducts.message.results.length,
                                            physics: mainScrollPhysics,
                                            separatorBuilder: (contextS, indexS) {
                                              return Container(
                                                height: 1.5,
                                                width: double.infinity,
                                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.mainColor),
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
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12),
                                                  child: Container(
                                                    height: 184,
                                                    padding: const EdgeInsets.all(12),
                                                    child: Row(
                                                      textDirection: TextDirection.rtl,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: 130,
                                                          height: 160,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(10),
                                                            child: ImageNetwork(url: state.allProducts.message.results[index].img.toString())
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 15,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            margin: const EdgeInsets.only(top: 4),
                                                            child: Column(
                                                              textDirection: TextDirection.rtl,
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    alignment: Alignment.topRight,
                                                                    child: TextWidget.medium(
                                                                      text: state.allProducts.message.results[index].name.toString(),
                                                                      textOverflow: TextOverflow.visible,
                                                                      alignment: TextAlign.right,
                                                                      fontSize: 13,
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 15,
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: TextWidget.bold(
                                                                    text: ' ${state.allProducts.message.results[index].price.toString().toPersianDigit().seRagham()} ریال',
                                                                    fontSize: 16,
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
                                  ),
                                ],
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
                                blocContext.read<ProductsHomeBloc>().add(GetAllProductsEvent(
                                      params: AllProductsParams(category: widget.categoryId, pageSize: 1000),
                                    ));
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showNoItemWidget(bool noImageItem) {
    return noImageItem ? Image.asset('assets/images/no_item_image_1.png') : Image.asset('assets/images/no_item_image_2.png');
  }
}
