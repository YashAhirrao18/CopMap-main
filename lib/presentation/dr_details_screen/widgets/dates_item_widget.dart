import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class DatesItemWidget extends StatelessWidget {
  const DatesItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 11.h,
            vertical: 10.v,
          ),
          decoration: AppDecoration.outlineTeal.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
              Text(
                "Mon",
                style: theme.textTheme.labelMedium,
              ),
              SizedBox(height: 2.v),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "21",
                  style: CustomTextStyles.titleMedium18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
