import '../dashboard_screen/widgets/doctor_item_widget.dart';
import '../dashboard_screen/widgets/eighteen_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';
import 'package:yash_s_application3/presentation/message_tab_container_screen/message_tab_container_screen.dart';
import 'package:yash_s_application3/presentation/schedule_tab_container_screen/schedule_tab_container_screen.dart';
import 'package:yash_s_application3/presentation/settigns_screen/settigns_screen.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:yash_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:yash_s_application3/widgets/custom_bottom_bar.dart';
import 'package:yash_s_application3/widgets/custom_elevated_button.dart';
import 'package:yash_s_application3/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 18.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(left: 20.h, bottom: 5.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 20.h),
                                        child: CustomSearchView(
                                            controller: searchController,
                                            hintText:
                                                "Search doctor, drugs, articles...")),
                                    SizedBox(height: 20.v),
                                    _buildEighteen(context),
                                    SizedBox(height: 20.v),
                                    _buildOfferBanner(context),
                                    SizedBox(height: 42.v),
                                    _buildTopDoctorSeeAll(context),
                                    SizedBox(height: 10.v),
                                    _buildDoctor(context),
                                    SizedBox(height: 31.v),
                                    _buildHealtArticleSee(context),
                                    SizedBox(height: 12.v),
                                    _buildTwentyFour(context)
                                  ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 74.v,
        title: AppbarTitle(
            text: "Welcome to CopMap, Officer",
            margin: EdgeInsets.only(left: 20.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLockOnprimary,
              margin: EdgeInsets.fromLTRB(20.h, 14.v, 20.h, 25.v))
        ]);
  }

  /// Section Widget
  Widget _buildEighteen(BuildContext context) {
    return SizedBox(
        height: 71.v,
        child: ListView.separated(
            padding: EdgeInsets.only(right: 20.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 17.h);
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return EighteenItemWidget(onTapBtnUser: () {
                onTapBtnUser(context);
              });
            }));
  }

  /// Section Widget
  Widget _buildOfferBanner(BuildContext context) {
    return Container(
        width: 335.h,
        margin: EdgeInsets.only(right: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 12.v),
        decoration: AppDecoration.fillTeal
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.v),
              SizedBox(
                  width: 168.h,
                  child: Text("Check your last bandobast",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMedium18
                          .copyWith(height: 1.50))),
              SizedBox(height: 7.v),
              CustomElevatedButton(
                  height: 26.v,
                  width: 106.h,
                  text: "Learn More",
                  buttonStyle: CustomButtonStyles.fillCyan,
                  buttonTextStyle: CustomTextStyles.labelLargePrimarySemiBold)
            ]));
  }

  /// Section Widget
  Widget _buildTopDoctorSeeAll(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Top Officer", style: theme.textTheme.titleMedium),
              GestureDetector(
                  onTap: () {
                    onTapTxtSeeAll(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 5.v),
                      child: Text("See all",
                          style: CustomTextStyles.labelLargeCyan300)))
            ]));
  }

  /// Section Widget
  Widget _buildDoctor(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            height: 173.v,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 14.h);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return DoctorItemWidget(onTapDoctor: () {
                    onTapDoctor(context);
                  });
                })));
  }

  /// Section Widget
  Widget _buildHealtArticleSee(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 23.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Todays Article", style: theme.textTheme.titleMedium),
          GestureDetector(
              onTap: () {
                onTapTxtSeeAll1(context);
              },
              child: Padding(
                  padding: EdgeInsets.only(bottom: 3.v),
                  child: Text("See all",
                      style: CustomTextStyles.labelLargeCyan300)))
        ]));
  }

  /// Section Widget
  Widget _buildTwentyFour(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20.h),
        padding: EdgeInsets.all(5.h),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                  imagePath: 'assets/images/article2.webp',
                  height: 55.adaptSize,
                  width: 55.adaptSize,
                  radius: BorderRadius.circular(6.h)),
              Padding(
                  padding: EdgeInsets.only(left: 12.h, bottom: 5.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 179.h,
                            child: Text(
                                "Ganesh Visarjan: 20k cops on bandobast duty in Mumbai today",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.labelMediumOnPrimary
                                    .copyWith(height: 1.50))),
                        SizedBox(height: 8.v),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jun 10, 2021 ",
                                  style: theme.textTheme.labelSmall),
                              Container(
                                  height: 2.adaptSize,
                                  width: 2.adaptSize,
                                  margin: EdgeInsets.only(
                                      left: 5.h, top: 3.v, bottom: 4.v),
                                  decoration: BoxDecoration(
                                      color: appTheme.gray500,
                                      borderRadius:
                                          BorderRadius.circular(1.h))),
                              Padding(
                                  padding: EdgeInsets.only(left: 5.h),
                                  child: Text("5min read",
                                      style: theme.textTheme.labelSmall))
                            ])
                      ]))
            ]));
  }

  /// Section Widget
  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.of(context).pushNamed(
        getCurrentRoute(type),
      );
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Messages:
        return AppRoutes.messageTabContainerScreen;
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

  /// Navigates to the drDetailsScreen when the action is triggered.
  onTapDoctor(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.drDetailsScreen);
  }

  /// Navigates to the articleScreen when the action is triggered.
  onTapBtnUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.articleScreen);
  }

  /// Navigates to the drListScreen when the action is triggered.
  onTapTxtSeeAll(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.drListScreen);
  }

  /// Navigates to the articleScreen when the action is triggered.
  onTapTxtSeeAll1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.articleScreen);
  }
}
