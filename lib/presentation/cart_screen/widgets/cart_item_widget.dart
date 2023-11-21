import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13.h),
      decoration: AppDecoration.outlineTeal.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDrugThumbnail72x72,
            height: 72.adaptSize,
            width: 72.adaptSize,
            radius: BorderRadius.circular(
              36.h,
            ),
            margin: EdgeInsets.only(
              left: 6.h,
              top: 2.v,
              bottom: 17.v,
            ),
          ),
          Spacer(
            flex: 56,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 4.v,
              bottom: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OBH Combi",
                  style: CustomTextStyles.titleMedium18,
                ),
                SizedBox(height: 2.v),
                Text(
                  "75ml",
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 25.v),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgMenuGray500,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(bottom: 1.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text(
                        "1",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgPlus,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                      margin: EdgeInsets.only(
                        left: 13.h,
                        bottom: 1.v,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(
            flex: 44,
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgTrash,
                  height: 18.adaptSize,
                  width: 18.adaptSize,
                ),
                SizedBox(height: 47.v),
                Text(
                  "9.99",
                  style: CustomTextStyles.titleMedium18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
