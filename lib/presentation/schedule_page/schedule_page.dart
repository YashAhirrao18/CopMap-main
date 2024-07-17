// ignore_for_file: must_call_super

import '../schedule_page/widgets/schedule_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin<SchedulePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.white,
                child: Column(children: [
                  SizedBox(height: 30.v),
                  _buildSchedule(context)
                ]))));
  }

  /// Section Widget
  Widget _buildSchedule(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.v);
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ScheduleItemWidget(onTapDoctorReviews: () {
                    onTapDoctorReviews(context);
                  }, onTapRecentOrders: () {
                    onTapRecentOrders(context);
                  });
                })));
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapDoctorReviews(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupScreen);
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapRecentOrders(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.viewBandobastScreen);
  }
}
