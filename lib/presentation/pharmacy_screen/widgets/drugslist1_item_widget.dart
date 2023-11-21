import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class Drugslist1ItemWidget extends StatelessWidget {
  const Drugslist1ItemWidget({Key? key})
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
                imagePath: ImageConstant.imgDrugThumbnail1,
                height: 50.adaptSize,
                width: 50.adaptSize,
                radius: BorderRadius.circular(
                  25.h,
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 27.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "OBH Combi",
                  style: CustomTextStyles.labelLargeOnPrimaryContainer,
                ),
              ),
              SizedBox(height: 1.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "75ml",
                  style: theme.textTheme.labelMedium,
                ),
              ),
              SizedBox(height: 4.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text(
                        "9.99",
                        style: CustomTextStyles.titleSmallOnPrimaryContainer,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgPlus,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(left: 45.h),
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
