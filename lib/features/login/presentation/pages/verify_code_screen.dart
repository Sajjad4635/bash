import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/error_bottom_sheet.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/text_field_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/dashboard/presentation/dashboard_screen.dart';
import 'package:baash/features/login/presentation/manager/login/login_bloc.dart';
import 'package:baash/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../../core/theme/app_color.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String number;

  const VerifyCodeScreen({Key? key, required this.number}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  TextEditingController verifyCodeController = TextEditingController();
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;
  bool showClearIcon = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColor.mainColor,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              child: BlocProvider(
                create: (_) => serviceLocator<LoginBloc>(),
                child: Container(
                  color: AppColor.backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is Error) {
                          if (state.message != NO_INTERNET) {
                            showSnackBarError(VERIFY_CODE_IS_INVALID);
                          } else {
                            ShowError.serverError(context: context, onTap: () {});
                          }
                        } else if (state is CodeSent) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(selectedIndex: 3),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 60),
                              child: Image.asset(
                                'assets/images/app-icon.png',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  TextWidget.regular(text: VERIFY_CODE_LABEL_1),
                                  TextWidget.medium(text: widget.number.toPersianDigit()),
                                  TextWidget.regular(text: VERIFY_CODE_LABEL_2),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFieldWidget(
                                hintText: VERIFY_CODE_HINT,
                                textController: verifyCodeController,
                                keyboardType: TextInputType.number,
                                isEmpty: true,
                                maxLength: 5,
                                prefixIcon: showClearIcon
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            verifyCodeController.clear();
                                            showClearIcon = false;
                                          });
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.all(16),
                                            child: SvgPicture.asset(
                                              'assets/icons/close_circle_icon.svg',
                                              color: AppColor.textColor,
                                            )),
                                      )
                                    : const SizedBox(),
                                onChanged: (text) {
                                  setState(() {
                                    if (verifyCodeController.text == '') {
                                      showClearIcon = false;
                                    } else {
                                      showClearIcon = true;
                                    }
                                  });
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) => (state is SendCodeLoading)
                                ? const SizedBox(height: 48, child: LoadingWidget())
                                : ButtonWidget(
                                    isEnabled: verifyCodeController.text.trim().isNotEmpty,
                                    text: VERIFY_CODE_BUTTON,
                                    onPressed: () {
                                      if (verifyCodeController.text != '') {
                                        //todo validation code! for int and secure call
                                        context.read<LoginBloc>().add(
                                              LoginSendCode(
                                                number: widget.number.toEnglishDigit(),
                                                code: int.parse(verifyCodeController.text.toEnglishDigit()),
                                              ),
                                            );
                                      } else {
                                        showSnackBarError(VERIFY_CODE_IS_EMPTY);
                                      }
                                    }),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: TextWidget.regular(text: CHANGE_PHONE_NUMBER),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is Loading) {
                                return const LoadingWidget();
                              } else {
                                return CountdownTimer(
                                  endTime: endTime,
                                  widgetBuilder: (context, time) {
                                    if (time == null) {
                                      return GestureDetector(
                                        onTap: () {
                                          context.read<LoginBloc>().add(LoginSendNumber(number: widget.number));
                                          endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;
                                        },
                                        child: Center(child: TextWidget.regular(text: RESEND_CODE_TEXT)),
                                      );
                                    } else {
                                      return TextWidget.regular(
                                        textDirection: TextDirection.ltr,
                                        text: ('${(time.min ?? '0')}:${time.sec ?? '00'}').toPersianDigit(),
                                      );
                                    }
                                  },
                                  // endTime: endTime,
                                );
                              }
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBarError(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Neumorphic(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(
              bottom: 12,
            ),
            style: NeumorphicStyle(
              intensity: 10,
              depth: -2.5,
              shadowLightColor: AppColor.lightDepthColor,
              shadowDarkColor: AppColor.darkDepthColor,
              color: AppColor.errorColor,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
            ),
            child: TextWidget.regular(
              text: message,
              alignment: TextAlign.right,
            ),
          ),
          backgroundColor: AppColor.backgroundColor,
        ),
      );
  }
}
