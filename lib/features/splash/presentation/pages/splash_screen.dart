import 'dart:async';
import 'dart:io';

import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/dashboard/presentation/dashboard_screen.dart';
import 'package:baash/features/splash/domain/entities/setting_response.dart';
import 'package:baash/features/splash/presentation/manager/splash_bloc.dart';
import 'package:baash/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../login/presentation/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: BlocProvider(
          create: (_) => serviceLocator<SplashBloc>()..add(GetLocalDataEvent()),
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is HomeScreenState) {
                Future.delayed(const Duration(seconds: 2)).then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(selectedIndex: 3),
                    ),
                  ),
                );
              } else if (state is LoginScreenState) {
                Future.delayed(const Duration(seconds: 2)).then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
                );
              }
            },
            child: BlocBuilder<SplashBloc, SplashState>(
              builder: (context, state) {
                if (state is ErrorInternet) {
                  return Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset('assets/images/app-logo.jpeg'),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/wifi-slash.svg'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextWidget.regular(
                              text: NO_INTERNET_SPLASH,
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: ButtonWidget(
                              svg: 'assets/icons/retry.svg',
                              text: 'تلاش مجدد',
                              isEnabled: true,
                              onPressed: () {
                                context.read<SplashBloc>().add(GetSettingEvent());
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('assets/images/app-icon.png'),
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

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {}
  }

  void checkVersionAndShowPopUp(SettingResponse setting, BuildContext context) async {
    /// pop up update or go to next event GetLocalDataEvent
    if (Platform.isAndroid) {
      var info = await PackageInfo.fromPlatform();
      var appVersion = int.parse(info.version.replaceAll('.', ''));
      var serverVersion = int.parse(setting.data!.android.version.replaceAll('.', ''));
      if (appVersion >= serverVersion) {
        Timer(const Duration(seconds: 2), () {
          context.read<SplashBloc>().add(GetLocalDataEvent());
        });
      } else {
        var link = setting.data!.android.url;
        Timer(const Duration(seconds: 1), () {
          context.read<SplashBloc>().add(
                HandleUpdate(
                  isForced: setting.data!.android.isForced,
                  link: link,
                ),
              );
        });
      }
    } else {
      var info = await PackageInfo.fromPlatform();
      var appVersion = int.parse(info.version.replaceAll('.', ''));
      var serverVersion = int.parse(setting.data!.ios.version.replaceAll('.', ''));
      if (appVersion >= serverVersion) {
        Timer(const Duration(seconds: 2), () {
          context.read<SplashBloc>().add(GetLocalDataEvent());
        });
      } else {
        var link = setting.data!.ios.url;
        Timer(const Duration(seconds: 1), () {
          context.read<SplashBloc>().add(
                HandleUpdate(
                  isForced: setting.data!.ios.isForced,
                  link: link,
                ),
              );
        });
      }
    }
  }
}
