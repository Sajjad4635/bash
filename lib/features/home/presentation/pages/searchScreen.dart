import 'package:baash/core/constants/scroll_const.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/Image_shower.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/no_item_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:baash/features/home/presentation/manager/productsBloc/products_bloc.dart';
import 'package:baash/features/product_detail/presentation/pages/product_detail_screen.dart';
import 'package:baash/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class SearchScreen extends StatefulWidget {
  int category;

  SearchScreen({required this.category, Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => serviceLocator<ProductsHomeBloc>(),
          child: BlocListener<ProductsHomeBloc, ProductsState>(
            listener: (context, state) {},
            child: BlocBuilder<ProductsHomeBloc, ProductsState>(
              builder: (blocContext, state) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
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
                          Expanded(
                            child: TextFormField(
                              controller: searchController,
                              onChanged: (text) {
                                setState(() {
                                  if (searchController.text != '') {
                                    blocContext
                                        .read<ProductsHomeBloc>()
                                        .add(GetAllProductsEvent(params: AllProductsParams(pageSize: 1000, name: searchController.text, category: widget.category == 0 ? null : widget.category)));
                                  }
                                });
                              },
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                counterText: '',
                                hintText: 'جست و جو در باش',
                                hintStyle: TextStyle(
                                  color: AppColor.hintColorTextField,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.transparent),
                                ), // border: InputBorder.noBorder.none,
                              ),
                              style: Theme.of(blocContext).textTheme.bodyText1!.copyWith(
                                    color: AppColor.textColor,
                                  ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: state is GetAllProductsLoading
                          ? const Center(
                              child: LoadingWidget(),
                            )
                          : state is AllProductsReceived
                              ? state.allProducts.message.results.isEmpty
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
                                      })
                              : const SizedBox(),
                    )
                  ],
                );
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
}
