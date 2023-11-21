// ignore_for_file: must_call_super

import '../message_page/widgets/messagelist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  MessagePageState createState() => MessagePageState();
}

class MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin<MessagePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 31.v),
                  _buildMessageList(context)
                ]))));
  }

  /// Section Widget
  Widget _buildMessageList(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24.v);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return MessagelistItemWidget(onTapChat: () {
                    onTapChat(context);
                  });
                })));
  }

  /// Navigates to the chatScreen when the action is triggered.
  onTapChat(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.chatScreen);
  }
}
