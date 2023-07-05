import 'package:baash/core/utils/phone_number_format.dart';
import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/error_bottom_sheet.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/text_field_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/login/presentation/manager/login/login_bloc.dart';
import 'package:baash/features/login/presentation/pages/verify_code_screen.dart';
import 'package:baash/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../../core/theme/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  bool sendNumberValidator = false;
  bool showClearIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SafeArea(
        bottom: false,
        child: BlocProvider(
          create: (_) => serviceLocator<LoginBloc>(),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              color: AppColor.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is Error) {
                      ShowError.serverError(context: context, onTap: () {});
                    } else if (state is NumberSent) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyCodeScreen(number: state.number),
                        ),
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
                          TextWidget.regular(text: PHONE_NUMBER_LABEL),
                          const SizedBox(
                            height: 16,
                          ),
                          PhoneNumberTextField(
                            hintText: PHONE_NUMBER_HINT,
                            textController: phoneNumberController,
                            focusNode: null,
                            isEmpty: true,
                            suffixIcon: showClearIcon
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        phoneNumberController.clear();
                                        showClearIcon = false;
                                        sendNumberValidator = false;
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
                                sendNumberValidator = false;
                                if (phoneNumberController.text == '') {
                                  showClearIcon = false;
                                } else {
                                  showClearIcon = true;
                                }
                              });
                            },
                          ),
                          SizedBox(
                              height: 40,
                              child: Visibility(
                                visible: sendNumberValidator,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                  ),
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset('assets/icons/warning_icon.svg'),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      TextWidget.regular(
                                        text: PHONE_NUMBER_NOT_VALID,
                                        fontSize: 11,
                                        color: AppColor.errorColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return (state is Loading)
                              ? const SizedBox(height: 48, child: LoadingWidget())
                              : ButtonWidget(
                                  isEnabled: phoneNumberController.text.trim().isNotEmpty,
                                  text: PHONE_NUMBER_BUTTON,
                                  onPressed: () {
                                    if (PhoneNumberFormat.phoneNumberFormatWarning(phoneNumberController.text.trim().toEnglishDigit())) {
                                      var number = phoneNumberController.text.trim().toEnglishDigit();
                                      context.read<LoginBloc>().add(LoginSendNumber(number: number));
                                    } else {
                                      setState(
                                        () {
                                          sendNumberValidator = true;
                                        },
                                      );
                                    }
                                  },
                                );
                        },
                      ),
                      const Spacer(),
                      // Row(
                      //   textDirection: TextDirection.rtl,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     TextWidget.regular(text: PHONE_NUMBER_AGREEMENT_1),
                      //     TextWidget.medium(text: PHONE_NUMBER_AGREEMENT_2),
                      //     TextWidget.regular(text: PHONE_NUMBER_AGREEMENT_3),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
