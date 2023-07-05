import 'package:baash/core/local_storage/preferences/pref.dart';
import 'package:baash/core/utils/county_list.dart';
import 'package:baash/core/widgets/button_widget.dart';
import 'package:baash/core/widgets/loading_widget.dart';
import 'package:baash/core/widgets/show_snack_bar.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/features/user_profile/domain/use_cases/params/update_profile_params.dart';
import 'package:baash/features/user_profile/presentation/manager/profile_bloc.dart';
import 'package:baash/features/user_profile/presentation/widgets/profile_appbar_widget.dart';
import 'package:baash/injection.dart';
import 'package:flutter/material.dart';
import 'package:baash/core/constants/string_consts.dart';
import 'package:baash/core/theme/app_color.dart';
import 'package:baash/core/widgets/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
// import 'package:image_picker/image_picker.dart';

import '../widgets/profile_label_widget.dart';

class CreateProfileDetailScreen extends StatefulWidget {
  String? name;
  String? lastName;
  String? shopName;
  String? address;
  String? mobile;
  String? email;

  CreateProfileDetailScreen({required this.name, required this.lastName, required this.shopName, required this.address, required this.mobile, required this.email, Key? key}) : super(key: key);

  @override
  State<CreateProfileDetailScreen> createState() => _CreateProfileDetailScreenState();
}

class _CreateProfileDetailScreenState extends State<CreateProfileDetailScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String provinceValue = '-';
  String countyValue = 'اصفهان';

  @override
  void initState() {
    nameController.text = widget.name ?? '';
    lastNameController.text = widget.lastName ?? '';
    shopNameController.text = widget.shopName ?? '';
    addressController.text = widget.address ?? '';
    mobileController.text = widget.mobile ?? '';
    emailController.text = widget.email ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: ProfileEditAppBarWidget(
        onTap: () {
          // getImage();
        },
      ),
      body: BlocProvider(
        create: (_) => serviceLocator<ProfileBloc>(),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            //print(':::::::::::::::::::$state');
            if (state is UserProfileCreated) {
              ShowSnackBar().showSuccessMessage(context: context, message: 'اطلاعات شما با موفقیت انجام شد.');
              Navigator.pop(context);
            }
            if (state is CreateUserProfileError) {
              ShowSnackBar().showError(context: context, message: state.message);
            }
          },
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const ProfileLabelWidget(
                text: 'ایجاد پروفایل',
                svg: 'assets/icons/profile_fill.svg',
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        TextFieldWidget(
                          hintText: 'نام',
                          textController: nameController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldWidget(
                          hintText: 'نام خانوادگی',
                          textController: lastNameController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DropdownButton<String>(
                          value: countyValue,
                          alignment: Alignment.center,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          isExpanded: true,
                          elevation: 0,
                          style: const TextStyle(color: AppColor.textColor),
                          underline: Container(
                            height: 2,
                            color: Colors.transparent,
                          ),
                          dropdownColor: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(10),
                          onChanged: (String? value) {
                            setState(() {
                              countyValue = value!;
                            });
                          },
                          items: CountyLists().allCountyList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: TextWidget.medium(
                                text: value,
                                fontSize: 12,
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldWidget(
                          hintText: 'آدرس',
                          textController: addressController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldWidget(
                          hintText: 'نام فروشگاه',
                          textController: shopNameController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldWidget(
                          hintText: 'شماره تلفن',
                          textController: mobileController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldWidget(
                          hintText: 'email',
                          textController: emailController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            if (state is UpdateUserProfileLoading) {
                              return const LoadingWidget();
                            } else {
                              return ButtonWidget(
                                isEnabled: true,
                                text: 'ویرایش',
                                onPressed: () async {
                                  if (nameController.text != '') {
                                    if (lastNameController.text != '') {
                                      if (shopNameController.text != '') {
                                        if (addressController.text != '') {
                                          if (mobileController.text != '' && mobileController.text.isValidIranianMobileNumber()) {
                                            await Pref.set('name', nameController.text);
                                            await Pref.set('lastName', lastNameController.text);
                                            await Pref.set('shopName', shopNameController.text);
                                            await Pref.set('address', addressController.text);
                                            await Pref.set('mobile', mobileController.text);
                                            context.read<ProfileBloc>().add(
                                                  CreateUserProfileEvent(
                                                    updateProfileParams: UpdateProfileParams(
                                                      name: nameController.text == '' ? '' : nameController.text,
                                                      lastName: lastNameController.text == '' ? '' : lastNameController.text,
                                                      shopName: shopNameController.text == '' ? '' : shopNameController.text,
                                                      address: addressController.text == '' ? '' : addressController.text,
                                                      mobile: mobileController.text == '' ? '' : mobileController.text,
                                                      province: 1,
                                                      county: 1,
                                                      email: emailController.text == '' ? '' : emailController.text,
                                                    ),
                                                  ),
                                                );
                                          } else {
                                            ShowSnackBar().showError(context: context, message: 'شماره همراه خود را کامل و صحیح وارد کنید');
                                          }
                                        } else {
                                          ShowSnackBar().showError(context: context, message: 'نام فروشگاه خود را وارد کنید');
                                        }
                                      } else {
                                        ShowSnackBar().showError(context: context, message: 'آدر خود را وارد کنید');
                                      }
                                    } else {
                                      ShowSnackBar().showError(context: context, message: 'نام خانوادگی خود را وارد کنید');
                                    }
                                  } else {
                                    ShowSnackBar().showError(context: context, message: 'نام خود را وارد کنید');
                                  }
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// void getImage() async{
//   final ImagePicker picker = ImagePicker();
//   final XFile? image = await picker.pickImage(source: ImageSource.camera);
//   print('::::::::::::::::::${image!.path}');
// }
}
