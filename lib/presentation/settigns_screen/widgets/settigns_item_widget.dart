import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class SettignsItemWidget extends StatelessWidget {
  const SettignsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 63.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: 'assets/images/star.jpeg',
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
          SizedBox(height: 4.v),
          Text(
            "Cops",
            style: CustomTextStyles.labelMediumCyan100,
          ),
          SizedBox(height: 2.v),
          Text(
            "80 ",
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
        ],
      ),
    );
  }
}
