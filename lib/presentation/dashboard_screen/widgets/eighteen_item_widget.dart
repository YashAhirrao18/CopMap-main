import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';
import 'package:yash_s_application3/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class EighteenItemWidget extends StatelessWidget {
  EighteenItemWidget({
    Key? key,
    this.onTapBtnUser,
  }) : super(
          key: key,
        );

  VoidCallback? onTapBtnUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71.h,
      child: CustomIconButton(
        height: 71.adaptSize,
        width: 71.adaptSize,
        padding: EdgeInsets.all(6.h),
        decoration: IconButtonStyleHelper.fillCyan,
        onTap: () {
          onTapBtnUser!.call();
        },
        child: CustomImageView(
          imagePath: 'assets/images/police icon.jpeg',
        ),
      ),
    );
  }
}
