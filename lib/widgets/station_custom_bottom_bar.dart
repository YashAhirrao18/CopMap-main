// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';

class StationCustomBottomBar extends StatefulWidget {
  StationCustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  StationCustomBottomBarState createState() => StationCustomBottomBarState();
}

class StationCustomBottomBarState extends State<StationCustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavHome,
      activeIcon: ImageConstant.imgNavHome,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMessages,
      activeIcon: ImageConstant.imgNavMessages,
      title: "Messages",
      type: BottomBarEnum.Messages,
    ),
    BottomMenuModel(
      icon: 'assets/images/plus_icon.png', // Add the image path for "Create"
      activeIcon:
          'assets/images/plus_icon.png', // Add the active image path for "Create"
      title: "Create",
      type: BottomBarEnum.Create, // Add this line
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavAppointment,
      activeIcon: ImageConstant.imgNavAppointment,
      title: "Appointment",
      type: BottomBarEnum.Appointment,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.v,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 21.v,
                  width: 20.h,
                  color: appTheme.gray500,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: appTheme.gray500,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 22.v,
                  width: 19.h,
                  color: appTheme.cyan300,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.labelSmallCyan300.copyWith(
                      color: appTheme.cyan300,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          // Simplified navigation logic
          switch (bottomMenuList[index].type) {
            case BottomBarEnum.Home:
              Navigator.pushNamed(context, "/");
              break;
            case BottomBarEnum.Messages:
              Navigator.pushNamed(context, AppRoutes.messageTabContainerScreen);
              break;
            case BottomBarEnum.Create: // Add this case
              Navigator.pushNamed(
                  context,
                  AppRoutes
                      .stationCreateScreen); // Change this line to the actual route for Manage
              break;
            case BottomBarEnum.Appointment:
              Navigator.pushNamed(
                  context, AppRoutes.scheduleTabContainerScreen);
              break;
            case BottomBarEnum.Profile:
              Navigator.pushNamed(context, AppRoutes.settignsScreen);
              break;
          }
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Messages,
  Create,
  Appointment,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
