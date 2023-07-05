import 'package:baash/core/local_storage/preferences/pref.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/app_main_container.dart';
import 'package:baash/core/widgets/soon_screen.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/splash/presentation/pages/splash_screen.dart';
import 'package:baash/features/user_profile/presentation/manager/profile_bloc.dart';
import 'package:baash/features/user_profile/presentation/pages/about_us_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/call_to_order.dart';
import 'package:baash/features/user_profile/presentation/pages/cart_status_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/contact_us_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/profile_detail_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/refund_screen.dart';
import 'package:baash/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../core/constants/string_consts.dart';
import '../widgets/divider_profile_widget.dart';
import '../widgets/profile_appbar_widget.dart';
import '../widgets/profile_tile_widget.dart';

class ProfileMainScreen extends StatefulWidget {
  String? from;
  ProfileMainScreen({this.from, Key? key}) : super(key: key);

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocProvider(
        create: (_) => serviceLocator<ProfileBloc>(),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileAppBarWidget(from: widget.from,),
                  AppMainContainer(
                    child: Column(
                      children: [
                        ProfileTileWidget(
                          text: PROFILE_DETAIL_LABEL,
                          svg: 'assets/icons/userIcon.svg',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileDetailScreen(),
                              ),
                            );
                          },
                        ),
                        const DividerProfileWidget(),
                        ProfileTileWidget(
                          text: 'سفارش های من',
                          svg: 'assets/icons/unselected_services_icon.svg',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CartStatusScreen()));
                          },
                        ),
                        const DividerProfileWidget(),
                        ProfileTileWidget(
                          text: PROFILE_FRIENDS_LABEL,
                          svg: 'assets/icons/profile_friends.svg',
                          onTap: () {
                            //todo open profile friends
                          },
                        ),
                      ],
                    ),
                  ),
                  AppMainContainer(
                    child: Column(
                      children: [
                        ProfileTileWidget(
                          text: 'تهیه ابزار تلفنی',
                          svg: 'assets/icons/profile_finance.svg',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CallToOrder()));
                          },
                        ),
                        const DividerProfileWidget(),
                        ProfileTileWidget(
                          text: 'عودت سفارش',
                          svg: 'assets/icons/profile_finance.svg',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const RefundScreen()));
                          },
                        ),
                        const DividerProfileWidget(),
                        ProfileTileWidget(
                          text: PROFILE_SETTING_LABEL,
                          svg: 'assets/icons/setting.svg',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SoonScreen(title: PROFILE_SETTING_LABEL)));
                          },
                        ),
                      ],
                    ),
                  ),
                  AppMainContainer(
                    child: Column(
                      children: [
                        ProfileTileWidget(
                          text: PROFILE_SUPPORT_LABEL,
                          svg: 'assets/icons/support.svg',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsScreen()));
                          },
                        ),
                        const DividerProfileWidget(),
                        ProfileTileWidget(
                          text: PROFILE_ABOUT_LABEL,
                          svg: 'assets/icons/about_us.svg',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (blocContext, state) {
                      return AppMainContainer(
                        child: Column(
                          children: [
                            ProfileTileWidget(
                              text: 'خروج از حساب کاربری',
                              svg: 'assets/icons/exit_icon.svg',
                              onTap: () {
                                exitAccount(
                                    context: context,
                                    onTap: () async {
                                      print('::::::::::::::::::::::::::::::::::${await Pref.get('token')}');
                                      // setState(() {
                                      await Pref.remove('token');
                                      print('::::::::::::::::::::::::::::${await Pref.get('token')}');
                                      // });
                                      // print('::::::::::::::::::::::::::::::::::$token');
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const SplashScreen(),
                                          ),
                                          (route) => false);
                                    });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )),
            TextWidget.regular(
              text: '0.0.8'.toPersianDigit(),
              fontSize: 13,
              color: AppColor.hintColor,
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  exitAccount({required BuildContext context, required Function onTap}) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 229,
          padding: const EdgeInsets.only(
            top: 12,
            left: 24,
            right: 24,
            bottom: 44,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 51,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: TextWidget.medium(
                      text: 'آیا می خواهید از حساب خود خارج شوید؟',
                      fontSize: 16,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NeumorphicButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: NeumorphicStyle(
                          color: Colors.white,
                          shape: NeumorphicShape.flat,
                          depth: 0,
                          shadowLightColor: AppColor.lightDepthColor,
                          shadowDarkColor: AppColor.darkDepthColor,
                          border: const NeumorphicBorder(color: AppColor.textColor2, width: 1.5),
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 28,
                          child: Center(
                            child: TextWidget.medium(
                              text: 'انصراف',
                              color: AppColor.textColor2,
                              fontSize: 16,
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 12,
                    ),
                    NeumorphicButton(
                        onPressed: () {
                          onTap();
                        },
                        style: NeumorphicStyle(
                          color: AppColor.mainColor,
                          shape: NeumorphicShape.flat,
                          depth: 0,
                          shadowLightColor: AppColor.lightDepthColor,
                          shadowDarkColor: AppColor.darkDepthColor,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 28,
                          child: Center(
                            child: TextWidget.medium(
                              text: 'خروج',
                              color: AppColor.textColor2,
                              fontSize: 16,
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
