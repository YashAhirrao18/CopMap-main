import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_subtitle.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:yash_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:yash_s_application3/widgets/custom_elevated_button.dart';
import 'package:yash_s_application3/widgets/custom_icon_button.dart';

class BookAnAppointmentScreen extends StatelessWidget {
  const BookAnAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                child: Column(children: [
                  _buildProfilePic(context),
                  SizedBox(height: 19.v),
                  _buildDate(context),
                  SizedBox(height: 29.v),
                  _buildReason(context),
                  SizedBox(height: 13.v),
                  Divider(),
                  SizedBox(height: 18.v),
                  _buildPaymentDetails(context),
                  SizedBox(height: 12.v),
                  Divider(),
                  SizedBox(height: 18.v),
                  _buildPaymentMethod(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildPrice(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 10.v, bottom: 10.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "Appointment"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v))
        ]);
  }

  /// Section Widget
  Widget _buildProfilePic(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 6.v),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgProfilePic,
              height: 111.adaptSize,
              width: 111.adaptSize,
              radius: BorderRadius.circular(12.h)),
          Padding(
              padding: EdgeInsets.only(left: 18.h, top: 7.v, bottom: 4.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Marcus Horizon",
                        style: CustomTextStyles.titleMedium18),
                    SizedBox(height: 7.v),
                    Text("Chardiologist", style: theme.textTheme.labelLarge),
                    SizedBox(height: 13.v),
                    Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Row(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgStar,
                              height: 13.adaptSize,
                              width: 13.adaptSize,
                              margin: EdgeInsets.only(bottom: 1.v)),
                          Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Text("4.7",
                                  style: CustomTextStyles.labelLargeCyan300))
                        ])),
                    SizedBox(height: 10.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 13.adaptSize,
                          width: 13.adaptSize,
                          margin: EdgeInsets.only(bottom: 2.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Text("800m away",
                              style: theme.textTheme.labelLarge))
                    ])
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 1.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Date", style: theme.textTheme.titleMedium),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 2.v),
                child: Text("Change", style: theme.textTheme.bodySmall))
          ])),
      SizedBox(height: 6.v),
      Padding(
          padding: EdgeInsets.only(right: 34.h),
          child: Row(children: [
            CustomIconButton(
                height: 36.adaptSize,
                width: 36.adaptSize,
                padding: EdgeInsets.all(8.h),
                decoration: IconButtonStyleHelper.fillGrayTL18,
                child: CustomImageView(imagePath: ImageConstant.imgCalendar)),
            Padding(
                padding: EdgeInsets.only(left: 15.h, top: 11.v, bottom: 7.v),
                child: Text("Wednesday, Jun 23, 2021 | 10:00 AM",
                    style: theme.textTheme.titleSmall))
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildReason(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildConsultation(context,
          consultationText: "Reason", priceText: "Change"),
      SizedBox(height: 6.v),
      Row(children: [
        CustomIconButton(
            height: 36.adaptSize,
            width: 36.adaptSize,
            padding: EdgeInsets.all(8.h),
            decoration: IconButtonStyleHelper.fillGrayTL18,
            child: CustomImageView(imagePath: ImageConstant.imgClock)),
        Padding(
            padding: EdgeInsets.only(left: 15.h, top: 13.v, bottom: 5.v),
            child: Text("Chest pain", style: theme.textTheme.titleSmall))
      ])
    ]);
  }

  /// Section Widget
  Widget _buildPaymentDetails(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Payment Detail", style: theme.textTheme.titleMedium),
      SizedBox(height: 12.v),
      _buildConsultation(context,
          consultationText: "Consultation", priceText: "60.00"),
      SizedBox(height: 11.v),
      _buildConsultation(context,
          consultationText: "Admin Fee", priceText: "01.00"),
      SizedBox(height: 11.v),
      _buildConsultation(context,
          consultationText: "Aditional Discount", priceText: "-"),
      SizedBox(height: 11.v),
      _buildConsultation(context, consultationText: "Total", priceText: "61.00")
    ]);
  }

  /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Payment Method", style: theme.textTheme.titleMedium),
      SizedBox(height: 10.v),
      _buildConsultation(context, consultationText: "VISA", priceText: "Change")
    ]);
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 26.v),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 2.v, bottom: 6.v),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total",
                            style: CustomTextStyles.titleSmallGray500),
                        Padding(
                            padding: EdgeInsets.only(top: 1.v),
                            child: Text(" 61.00",
                                style: CustomTextStyles.titleMedium18))
                      ])),
              CustomElevatedButton(width: 192.h, text: "Booking")
            ]));
  }

  /// Common widget
  Widget _buildConsultation(
    BuildContext context, {
    required String consultationText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(consultationText,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.onPrimary)),
      Text(priceText,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.onPrimary))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
