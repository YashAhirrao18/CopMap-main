import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';
import 'package:yash_s_application3/widgets/custom_elevated_button.dart';
import 'package:yash_s_application3/widgets/custom_outlined_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.cyan300,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 46.v),
                child: Center(
                  child: Column(children: [
                    CustomImageView(
                      imagePath: 'assets/images/LOGO-removebg-preview.png',
                      height: 368.v,
                      width: 338.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                        height: 8
                            .v), // Adjust the spacing between the image and text
                    Text(
                      "Hey Cops! Get ready to ease your Bandobast Duty",
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 242, 240, 240), // Adjust text color as needed
                        fontSize: 20.0, // Adjust font size as needed
                      ),
                    ),
                    SizedBox(height: 77.v),
                    CustomOutlinedButton(
                        text: "Login",
                        margin: EdgeInsets.only(right: 6.h),
                        onPressed: () {
                          onTapLogin(context);
                        }),
                    SizedBox(height: 15.v),
                    CustomElevatedButton(
                        text: "Sign Up",
                        margin: EdgeInsets.only(right: 6.h),
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        buttonTextStyle: CustomTextStyles.titleSmallTeal300,
                        onPressed: () {
                          onTapSignUp(context);
                        }),
                    SizedBox(height: 30.v),
                    GestureDetector(
                      onTap: () {
                        onTapTxtForStationLogin(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "For Station Login=>",
                              style: CustomTextStyles.bodySmallPrimary_1,
                            ),
                            TextSpan(text: " "),
                            TextSpan(
                              text: "Station",
                              style: CustomTextStyles.labelLargePrimaryBold,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ]),
                ))));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupScreen);
  }
}

//Navigates to stationloginscren when action is triggered
onTapTxtForStationLogin(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.stationLoginScreen);
}
