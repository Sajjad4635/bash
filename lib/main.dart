import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:baash/features/splash/presentation/pages/splash_screen.dart';

import 'core/theme/app_color.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColor.mainColor,
      ),
    );
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: NeumorphicApp(
          title: 'Baashs',
          themeMode: ThemeMode.dark,
          materialDarkTheme: ThemeData(
            fontFamily: 'Dana',
          ),
          materialTheme: ThemeData(
            fontFamily: 'Dana',
          ),
          theme: const NeumorphicThemeData(
            baseColor: Color(0xFFF7F7F7),
            lightSource: LightSource.bottomRight,
          ),
          darkTheme: const NeumorphicThemeData(
            baseColor: AppColor.mainColor2,
            lightSource: LightSource.bottomRight,
          ),
          home: const SplashScreen(),
        ));
  }
}
