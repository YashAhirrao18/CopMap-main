import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';
import 'package:yash_s_application3/widgets/custom_elevated_button.dart';
import 'package:yash_s_application3/widgets/custom_text_form_field.dart';
import 'package:yash_s_application3/features/firestore_services.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirestoreService _firestoreService = FirestoreService();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.cyan300,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 35.v),
            child: Column(
              children: [
                SizedBox(height: 70.v),
                _buildPageTitle(context),
                SizedBox(height: 32.v),
                CustomTextFormField(
                  controller: emailController,
                  hintText: "Your Email",
                  textInputType: TextInputType.emailAddress,
                  prefix: Container(
                    margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgMail,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(maxHeight: 48.v),
                ),
                SizedBox(height: 8.v),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: "Password",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  prefix: Container(
                    margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgLock,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(maxHeight: 48.v),
                  obscureText: true,
                ),
                SizedBox(height: 27.v),
                CustomElevatedButton(
                  text: "Sign In",
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  buttonTextStyle: CustomTextStyles.titleSmallTeal300,
                  onPressed: () {
                    _handleSignIn(context);
                  },
                ),
                SizedBox(height: 16.v),
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 24.v),
                Text(
                  "Forgot Password?",
                  style: CustomTextStyles.labelLargePrimaryBold_1,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    onTapTxtDonthaveanaccount(context);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don’t have an account?",
                          style: CustomTextStyles.bodySmallPrimary_1,
                        ),
                        TextSpan(text: " "),
                        TextSpan(
                          text: "Register",
                          style: CustomTextStyles.labelLargePrimaryBold,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageTitle(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          imagePath: 'assets/images/LOGO-removebg-preview.png',
          height: 42.v,
          width: 115.h,
        ),
        SizedBox(height: 26.v),
        Text(
          "Welcome to CopMap",
          style: CustomTextStyles.titleMediumOnPrimaryContainer,
        ),
        SizedBox(height: 12.v),
        Text(
          "Sign in to continue",
          style: CustomTextStyles.labelLargeGray50,
        ),
      ],
    );
  }

  Future<void> _handleSignIn(BuildContext context) async {
    try {
      // Check if the form is valid before proceeding
      if (_formKey.currentState?.validate() ?? false) {
        // Get email and password from the text controllers
        String email = emailController.text;
        String password = passwordController.text;

        // Check if email and password are not empty
        if (email.isNotEmpty && password.isNotEmpty) {
          // Call the loginUser method from FirestoreService
          await _firestoreService.loginUser(email: email, password: password);

          // Navigate to the dashboard screen upon successful login
          Navigator.pushNamed(context, AppRoutes.dashboardScreen);
        } else {
          throw Exception('Please enter both email and password');
        }
      }
    } catch (e) {
      // Handle login errors, e.g., display an error message
      print('Error logging in: $e');
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  onTapTxtDonthaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signupScreen);
  }
}
