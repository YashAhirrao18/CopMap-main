// ignore_for_file: must_be_immutable

import '../settigns_screen/widgets/settigns_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';
import 'package:yash_s_application3/presentation/message_tab_container_screen/message_tab_container_screen.dart';
import 'package:yash_s_application3/presentation/schedule_tab_container_screen/schedule_tab_container_screen.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:yash_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:yash_s_application3/widgets/station_custom_bottom_bar.dart';
import 'package:yash_s_application3/widgets/custom_icon_button.dart';

class SettignsScreen extends StatelessWidget {
  SettignsScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.teal300,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 226.v,
                width: 290.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Dhule City Station",
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                    _buildProfileColumn(context),
                  ],
                ),
              ),
              SizedBox(height: 38.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 31.v,
                ),
                decoration: AppDecoration.white.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderTL30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSettingOption(
                      context,
                      appointmentLabel: "My Saved",
                    ),
                    SizedBox(height: 13.v),
                    Divider(
                      color: appTheme.gray5001,
                    ),
                    SizedBox(height: 13.v),
                    _buildSettingOption(
                      context,
                      appointmentLabel: "Appointment",
                    ),
                    SizedBox(height: 13.v),
                    Divider(
                      color: appTheme.gray5001,
                    ),
                    SizedBox(height: 13.v),
                    _buildSettingOption(
                      context,
                      appointmentLabel: "Payment Method",
                    ),
                    SizedBox(height: 13.v),
                    Divider(
                      color: appTheme.gray5001,
                    ),
                    SizedBox(height: 13.v),
                    _buildSettingOption(
                      context,
                      appointmentLabel: "FAQs",
                    ),
                    SizedBox(height: 13.v),
                    Divider(
                      color: appTheme.gray5001,
                    ),
                    SizedBox(height: 13.v),
                    _buildSettingOption(
                      context,
                      appointmentLabel: "Help",
                    ),
                    SizedBox(height: 24.v),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBarColumn(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 61.v,
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgMoreIcon,
          margin: EdgeInsets.all(20.h),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildProfileStack(BuildContext context) {
    return SizedBox(
      height: 80.adaptSize,
      width: 80.adaptSize,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomImageView(
            imagePath: 'assets/images/Yathish N IPS.png',
            height: 80.adaptSize,
            width: 80.adaptSize,
            radius: BorderRadius.circular(
              40.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.only(
                right: 4.h,
                bottom: 5.v,
              ),
              padding: EdgeInsets.all(3.h),
              decoration: AppDecoration.white.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder6,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgCamera,
                height: 10.adaptSize,
                width: 10.adaptSize,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileColumn(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProfileStack(context),
          SizedBox(height: 71.v),
          SizedBox(
            height: 75.v,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.5.h),
                  child: SizedBox(
                    height: 44.v,
                    child: VerticalDivider(
                      width: 1.h,
                      thickness: 1.v,
                      color: appTheme.cyan100,
                    ),
                  ),
                );
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return SettignsItemWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBarColumn(BuildContext context) {
    return StationCustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildSettingOption(
    BuildContext context, {
    required String appointmentLabel,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 43.adaptSize,
          width: 43.adaptSize,
          padding: EdgeInsets.all(9.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgMenu,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 18.h,
            top: 13.v,
            bottom: 9.v,
          ),
          child: Text(
            appointmentLabel,
            style: theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 24.adaptSize,
          width: 24.adaptSize,
          margin: EdgeInsets.only(
            top: 10.v,
            bottom: 9.v,
          ),
        ),
      ],
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Messages:
        return AppRoutes.messageTabContainerScreen;
      case BottomBarEnum.Create:
        return AppRoutes.stationDashboardScreen;
      case BottomBarEnum.Appointment:
        return AppRoutes.scheduleTabContainerScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.settignsScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.messageTabContainerScreen:
        return MessageTabContainerScreen();
      case AppRoutes.scheduleTabContainerScreen:
        return ScheduleTabContainerScreen();
      case AppRoutes.settignsScreen:
        return SettignsScreen();
      default:
        return DefaultWidget();
    }
  }
}
