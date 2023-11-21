import '../cart_screen/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_subtitle.dart';
import 'package:yash_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:yash_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:yash_s_application3/widgets/custom_elevated_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
                  _buildCart(context),
                  SizedBox(height: 27.v),
                  _buildPaymentDetail(context),
                  SizedBox(height: 25.v),
                  Divider(),
                  SizedBox(height: 27.v),
                  _buildPaymentMethod(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildCheckout(context)));
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
        title: AppbarSubtitle(text: "My Cart"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgOverflowMenu,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v))
        ]);
  }

  /// Section Widget
  Widget _buildCart(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 25.v);
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return CartItemWidget();
        });
  }

  /// Section Widget
  Widget _buildPaymentDetail(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Payment Detail", style: theme.textTheme.titleMedium),
      SizedBox(height: 12.v),
      _buildAdminFee(context, adminFee: "Consultation", price: "60.00"),
      SizedBox(height: 11.v),
      _buildAdminFee(context, adminFee: "Admin Fee", price: "01.00"),
      SizedBox(height: 11.v),
      _buildAdminFee(context, adminFee: "Aditional Discount", price: "-"),
      SizedBox(height: 11.v),
      _buildAdminFee(context, adminFee: "Total", price: "61.00")
    ]);
  }

  /// Section Widget
  Widget _buildPaymentMethod(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Payment Method", style: theme.textTheme.titleMedium),
      SizedBox(height: 10.v),
      _buildAdminFee(context, adminFee: "VISA", price: "Change")
    ]);
  }

  /// Section Widget
  Widget _buildCheckout(BuildContext context) {
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
                        Opacity(
                            opacity: 0.9,
                            child: Padding(
                                padding: EdgeInsets.only(top: 1.v),
                                child: Text(" 20.98",
                                    style:
                                        CustomTextStyles.titleMediumOnPrimary)))
                      ])),
              CustomElevatedButton(width: 192.h, text: "Checkout")
            ]));
  }

  /// Common widget
  Widget _buildAdminFee(
    BuildContext context, {
    required String adminFee,
    required String price,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(adminFee,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.onPrimary)),
      Text(price,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: theme.colorScheme.onPrimary))
    ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
