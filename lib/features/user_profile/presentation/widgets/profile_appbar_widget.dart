import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:baash/core/network/token_handler.dart';
import 'package:baash/core/widgets/text_widget.dart';
import 'package:baash/injection.dart';

import '../../../../core/theme/app_color.dart';

class ProfileAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  String? from;
  String? img;

  ProfileAppBarWidget({this.from, this.img, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 44, left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            from == 'home'
            ? const SizedBox()
            : InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/back_icon.svg',
                color: AppColor.mainColor2,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipOval(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                                child: Container(
                              color: const Color(0xff0C172B),
                            )),
                            Expanded(
                                child: Container(
                              color: const Color(0xffEDEEF2),
                            ))
                          ],
                        ),
                        Center(
                          child: ClipOval(
                            child: Container(
                              width: 56,
                              height: 56,
                              color: Colors.grey[300],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: img == null
                                    ? SvgPicture.asset(
                                        'assets/icons/user_avatar.svg',
                                      )
                                    : Image.network(img!),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/icons/back_icon.svg',
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class ProfileEditAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  String? img;
  Function onTap;

  ProfileEditAppBarWidget({this.img, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 44, left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/back_icon.svg',
                color: AppColor.mainColor2,
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    onTap();
                  },
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipOval(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                  child: Container(
                                color: const Color(0xff0C172B),
                              )),
                              Expanded(
                                  child: Container(
                                color: const Color(0xffEDEEF2),
                              ))
                            ],
                          ),
                          Center(
                            child: ClipOval(
                              child: Container(
                                width: 56,
                                height: 56,
                                color: Colors.grey[300],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: img == null
                                      ? SvgPicture.asset(
                                          'assets/icons/user_avatar.svg',
                                        )
                                      : Image.network(img!),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/icons/back_icon.svg',
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
