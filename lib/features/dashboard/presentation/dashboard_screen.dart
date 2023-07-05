import 'package:baash/features/category/presentation/pages/category_screen.dart';
import 'package:baash/features/shopping_cart/presentation/pages/shopping_cart_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/cart_status_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/profile_main_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:baash/core/constants/string_consts.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/features/home/presentation/pages/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  int selectedIndex;

  DashboardScreen({required this.selectedIndex, super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState(selectedIndex: selectedIndex);
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex;

  _DashboardScreenState({required this.selectedIndex});

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    ProfileMainScreen(from: 'home'),
    const CartStatusScreen(),
    const CategoryScreen(),
    const HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        // height: 65,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  width: 23,
                  height: 23,
                  color: AppColor.backgroundColor,
                  child: Center(
                    child: SvgPicture.asset(
                      0 == selectedIndex ? 'assets/icons/selected_account_icon.svg' : 'assets/icons/unselected_account_icon.svg',
                      color: setIconColor(index: 0),
                    ),
                  ),
                ),
                label: PROFILE_LABEL,
                tooltip: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 23,
                  height: 23,
                  color: AppColor.backgroundColor,
                  child: Center(
                    child: SvgPicture.asset(
                      1 == selectedIndex ? 'assets/icons/selected_services_icon.svg' : 'assets/icons/unselected_services_icon.svg',
                      color: setIconColor(index: 1),
                    ),
                  ),
                ),
                label: 'لیست سفارش‌ها',
                tooltip: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 23,
                  height: 23,
                  color: AppColor.backgroundColor,
                  child: Center(
                    child: SvgPicture.asset(
                      2 == selectedIndex ? 'assets/icons/selected_services_icon.svg' : 'assets/icons/unselected_services_icon.svg',
                      color: setIconColor(index: 2),
                    ),
                  ),
                ),
                label: 'دسته بندی ها',
                tooltip: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 23,
                  height: 23,
                  color: AppColor.backgroundColor,
                  child: Center(
                    child: SvgPicture.asset(
                      3 == selectedIndex ? 'assets/icons/selected_home_icon.svg' : 'assets/icons/unselected_home_icon.svg',
                      color: setIconColor(index: 3),
                    ),
                  ),
                ),
                label: HOME_LABEL,
                tooltip: '',
              ),
            ],
            enableFeedback: true,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'Dana',
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Dana',
              fontSize: 10,
            ),
            elevation: 20.0,
            showUnselectedLabels: true,
            backgroundColor: AppColor.backgroundColor,
            currentIndex: selectedIndex,
            selectedItemColor: AppColor.textColor,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  double setNeumorphicDepth({required int index}) {
    return index == selectedIndex ? -1 : 1;
  }

  Color setIconColor({required int index}) {
    return index == selectedIndex ? AppColor.mainColor2 : AppColor.hintColor;
  }
}
