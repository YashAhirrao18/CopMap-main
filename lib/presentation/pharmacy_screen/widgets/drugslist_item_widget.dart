import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class DrugslistItemWidget extends StatelessWidget {
  const DrugslistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 118.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 6.h,
            vertical: 7.v,
          ),
          decoration: AppDecoration.outlineTeal.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 16.v),
              CustomImageView(
                imagePath: ImageConstant.imgDrugThumbnail,
                height: 50.adaptSize,
                width: 50.adaptSize,
                radius: BorderRadius.circular(
                  25.h,
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "Panadol",
                  style: CustomTextStyles.labelLargeOnPrimaryContainer,
                ),
              ),
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "20pcs",
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 3.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        "15.99",
                        style: CustomTextStyles.titleSmallOnPrimaryContainer,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgPlus,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(left: 38.h),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
