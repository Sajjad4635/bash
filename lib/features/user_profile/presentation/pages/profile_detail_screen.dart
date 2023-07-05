import 'package:baash/core/constants/string_consts.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/app_main_container.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/user_profile/presentation/manager/profile_bloc.dart';
import 'package:baash/features/user_profile/presentation/pages/create_profile_detail_screen.dart';
import 'package:baash/features/user_profile/presentation/pages/edit_profile_detail_screen.dart';
import 'package:baash/features/user_profile/presentation/widgets/profile_appbar_widget.dart';
import 'package:baash/features/user_profile/presentation/widgets/profile_label_widget.dart';
import 'package:baash/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: BlocProvider(
        create: (_) => serviceLocator<ProfileBloc>()..add(GetUserProfileEvent()),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          child: Column(
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is GetUserProfileLoading) {
                    return const Expanded(
                      child: Center(
                        child: LoadingWidget(),
                      ),
                    );
                  } else if (state is UserProfileReceived) {
                    return state.userProfile.message.profile == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileAppBarWidget(),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  const Expanded(
                                    child: ProfileLabelWidget(
                                      text: PROFILE_DETAIL_LABEL,
                                      svg: 'assets/icons/profile_fill.svg',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CreateProfileDetailScreen(
                                            name: '',
                                            lastName: '',
                                            address: '',
                                            shopName: '',
                                            mobile: '',
                                            email: '',
                                          ),
                                        ),
                                      ).then((value) {
                                        context.read<ProfileBloc>().add(GetUserProfileEvent());
                                      });
                                    },
                                    child: AppMainContainer(
                                      depth: 2,
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                      child: SvgPicture.asset(
                                        'assets/icons/edit_icon.svg',
                                        width: 20,
                                        height: 20,
                                        color: AppColor.mainColor2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'نام'),
                                    TextWidget.medium(text: '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'نام خانوادگی'),
                                    TextWidget.medium(text: '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'آدرس'),
                                    TextWidget.medium(text: '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'نام فروشگاه'),
                                    TextWidget.medium(text: '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'شماره تلفن'),
                                    TextWidget.medium(text: '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'ایمیل'),
                                    TextWidget.medium(text: '---'),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProfileAppBarWidget(img: state.userProfile.message.profile!.img),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  const Expanded(
                                    child: ProfileLabelWidget(
                                      text: PROFILE_DETAIL_LABEL,
                                      svg: 'assets/icons/profile_fill.svg',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditProfileDetailScreen(
                                            name: state.userProfile.message.profile!.firstName,
                                            lastName: state.userProfile.message.profile!.lastName,
                                            address: state.userProfile.message.profile!.address,
                                            shopName: state.userProfile.message.profile!.shopName,
                                            mobile: state.userProfile.message.profile!.phoneNumber,
                                            email: state.userProfile.message.profile!.email,
                                          ),
                                        ),
                                      ).then((value) {
                                        context.read<ProfileBloc>().add(GetUserProfileEvent());
                                      });
                                    },
                                    child: AppMainContainer(
                                      depth: 2,
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                      child: SvgPicture.asset(
                                        'assets/icons/edit_icon.svg',
                                        width: 20,
                                        height: 20,
                                        color: AppColor.mainColor2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'نام'),
                                    TextWidget.medium(text: state.userProfile.message.profile!.firstName ?? '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'نام خانوادگی'),
                                    TextWidget.medium(text: state.userProfile.message.profile!.lastName ?? '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'آدرس'),
                                    TextWidget.medium(text: state.userProfile.message.profile!.address ?? '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'نام فروشگاه'),
                                    TextWidget.medium(text: state.userProfile.message.profile!.shopName ?? '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'شماره تلفن'),
                                    TextWidget.medium(text: state.userProfile.message.profile!.phoneNumber ?? '---'),
                                  ],
                                ),
                              ),
                              AppMainContainer(
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget.regular(text: 'ایمیل'),
                                    TextWidget.medium(text: state.userProfile.message.profile!.email ?? '---'),
                                  ],
                                ),
                              ),
                            ],
                          );
                  } else {
                    return TextWidget.regular(text: 'error');
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
