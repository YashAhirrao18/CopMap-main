import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_subtitle.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:yash_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:yash_s_application3/widgets/custom_elevated_button.dart';
import 'package:yash_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 42.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3.v),
                      _buildConsultationStart(context),
                      SizedBox(height: 20.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: _buildDrMarcusHorizon(context,
                              userName: "Dr. Marcus Horizon",
                              time: "10 min ago")),
                      SizedBox(height: 10.v),
                      Container(
                          margin: EdgeInsets.only(left: 1.h, right: 129.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 7.v),
                          decoration: AppDecoration.fillTeal.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBL8),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 4.v),
                                Text("Hello, How can i help you?",
                                    style: theme.textTheme.bodyMedium)
                              ])),
                      SizedBox(height: 15.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              margin: EdgeInsets.only(left: 98.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.h, vertical: 7.v),
                              decoration: AppDecoration.fillTeal300.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL8),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 4.v),
                                    SizedBox(
                                        width: 205.h,
                                        child: Text(
                                            "I have suffering from headache \nand cold for 3 days, I took 2 \ntablets of dolo, but still pain",
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .bodyMediumPrimary
                                                .copyWith(height: 1.50)))
                                  ]))),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: _buildDrMarcusHorizon(context,
                              userName: "Dr. Marcus Horizon",
                              time: "5 min ago")),
                      SizedBox(height: 10.v),
                      Container(
                          margin: EdgeInsets.only(left: 1.h, right: 113.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.h, vertical: 9.v),
                          decoration: AppDecoration.fillTeal.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBL8),
                          child: SizedBox(
                              width: 193.h,
                              child: Text(
                                  "Ok, Do you have fever? is the\nheadchace severe",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(height: 1.50)))),
                      SizedBox(height: 15.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              width: 237.h,
                              margin: EdgeInsets.only(left: 98.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.h, vertical: 6.v),
                              decoration: AppDecoration.fillTeal300.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL8),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 3.v),
                                    Container(
                                        width: 162.h,
                                        margin: EdgeInsets.only(right: 47.h),
                                        child: Text(
                                            "I don,t have any fever, \nbut headchace is painful",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .bodyMediumPrimary
                                                .copyWith(height: 1.50)))
                                  ]))),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: _buildDrMarcusHorizon(context,
                              userName: "Dr. Marcus Horizon", time: "Online")),
                      SizedBox(height: 10.v),
                      Container(
                          height: 22.v,
                          width: 58.h,
                          margin: EdgeInsets.only(left: 1.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 13.h, vertical: 8.v),
                          decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderBL5),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgGroup141,
                              height: 5.v,
                              width: 32.h,
                              alignment: Alignment.bottomCenter))
                    ])),
            bottomNavigationBar: _buildChatBox(context)));
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
        title: AppbarSubtitle(
            text: "Dr. Marcus Horizon", margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgVolume,
              margin: EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.v))
        ]);
  }

  /// Section Widget
  Widget _buildConsultationStart(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 41.h, vertical: 14.v),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("Consultion Start", style: CustomTextStyles.titleMediumCyan300),
          SizedBox(height: 8.v),
          Text("You can consult your problem to the doctor",
              style: theme.textTheme.labelLarge)
        ]));
  }

  /// Section Widget
  Widget _buildChatBox(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 26.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: CustomTextFormField(
                  width: 206.h,
                  controller: messageController,
                  hintText: "Type message ...",
                  textInputAction: TextInputAction.done,
                  prefix: Container(
                      margin: EdgeInsets.fromLTRB(10.h, 11.v, 11.h, 10.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgAttachmentIcon,
                          height: 28.adaptSize,
                          width: 28.adaptSize)),
                  prefixConstraints: BoxConstraints(maxHeight: 49.v))),
          CustomElevatedButton(
              width: 111.h,
              text: "Send",
              margin: EdgeInsets.only(left: 17.h),
              onPressed: () {
                onTapSend(context);
              })
        ]));
  }

  /// Common widget
  Widget _buildDrMarcusHorizon(
    BuildContext context, {
    required String userName,
    required String time,
  }) {
    return Row(children: [
      CustomImageView(
          imagePath: ImageConstant.imgEllipse27image40x40,
          height: 40.adaptSize,
          width: 40.adaptSize,
          radius: BorderRadius.circular(20.h)),
      Padding(
          padding: EdgeInsets.only(left: 13.h, top: 2.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(userName,
                style: theme.textTheme.titleSmall!
                    .copyWith(color: theme.colorScheme.onPrimary)),
            SizedBox(height: 7.v),
            Text(time,
                style: theme.textTheme.labelMedium!
                    .copyWith(color: appTheme.gray500))
          ]))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapSend(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupScreen);
  }
}
