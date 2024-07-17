import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class DoctorItemWidget extends StatelessWidget {
  DoctorItemWidget({
    Key? key,
    this.onTapDoctor,
  }) : super(
          key: key,
        );

  VoidCallback? onTapDoctor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            onTapDoctor!.call();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.h,
              vertical: 10.v,
            ),
            decoration: AppDecoration.outlineTeal.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 8.v),
                CustomImageView(
                  imagePath: 'assets/images/Yathish N IPS.png',
                  height: 68.adaptSize,
                  width: 68.adaptSize,
                  radius: BorderRadius.circular(
                    34.h,
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(height: 18.v),
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text(
                    "Rajesh Reddy",
                    style: CustomTextStyles.labelLargeOnPrimarySemiBold,
                  ),
                ),
                SizedBox(height: 3.v),
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text(
                    "PSI",
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: 6.v),
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgStar,
                        height: 10.adaptSize,
                        width: 10.adaptSize,
                        margin: EdgeInsets.only(bottom: 3.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.h,
                          top: 2.v,
                          bottom: 1.v,
                        ),
                        child: Text(
                          "4.7",
                          style: CustomTextStyles.labelSmallCyan300,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 23.h,
                          top: 3.v,
                        ),
                        child: Text(
                          "800m away",
                          style: CustomTextStyles.labelSmallBluegray200,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
