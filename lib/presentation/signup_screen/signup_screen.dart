import 'package:flutter/material.dart';
import 'package:yash_s_application3/core/app_export.dart';
import 'package:yash_s_application3/widgets/custom_elevated_button.dart';
import 'package:yash_s_application3/widgets/custom_text_form_field.dart';
import 'package:yash_s_application3/features/firestore_services.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FirestoreService _firestoreService = FirestoreService();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController rankController = TextEditingController();
  TextEditingController dgpNumberController = TextEditingController();
  TextEditingController selectedPoliceStationController =
      TextEditingController();

  List<String> policeStations = [
    "Dhule City",
    "Aazadnagar",
    "Chalisgaon Road",
    "Mohadi Upnagar",
    "West Deopur",
    "Dhule Taluka",
    "Songir",
    "Sakri",
    "Pimplner",
    "Nijampur",
    "Shindkheda",
    "Nardana",
    "Dondaicha",
    "Shirpur Taluka",
    "Shirpur City",
    "Thalner ",
    "Deopur Police Station"
  ];

  List<String> ranks = [
    "Director General of Police",
    "Addl. Director General of Police",
    "Inspector General of Police",
    "Dy. Inspector General of Police",
    "Superintendent of Police",
    "Deputy Commissioner of Police",
    "Addl. Superintendent of Police",
    "Assistant Superintendent of Police",
    "Dy. Superintendent of Police (SDPO)",
    "Assistant Commissioner of Police (A.C.P.)",
    "Police Inspector (P.I.)",
    "Assistant Police Inspector (A.P.I.)",
    "Police Sub Inspector (P.S.I.)",
    "Assistant Police Sub Inspector (A.S.I.)",
    "Head Constable (H.C.)",
    "Police Naik (P.N.)",
    "Police Constable (P.C.)"
  ];

  String errorMessage = '';
  String successMessage = '';

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: appTheme.cyan300,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 35.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Align widgets to stretch horizontally
            children: [
              SizedBox(height: 70.v),
              _buildPageTitle(context),
              SizedBox(height: 29.v),
              _buildFullName(context),
              SizedBox(height: 8.v),
              _buildEmail(context),
              SizedBox(height: 8.v),
              _buildPassword(context),
              SizedBox(height: 8.v),
              _buildPassword1(context),
              SizedBox(height: 8.v),
              _buildMobileNumber(context),
              SizedBox(height: 8.v),
              _buildRank(context),
              SizedBox(height: 8.v),
              _buildDGNumber(context),
              SizedBox(height: 8.v),
              _buildPoliceStation(context),
              SizedBox(height: 39.v),
              _buildSignUp(context),
              SizedBox(height: 16.v), // Adjust this height based on your layout
              GestureDetector(
                onTap: () {
                  onTapTxtHaveanaccount(context);
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Have an account?",
                        style: CustomTextStyles.bodySmallPrimary_1,
                      ),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Sign In",
                        style: CustomTextStyles.labelLargePrimaryBold,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 16.v), // Adjust this height based on your layout
            ],
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
        SizedBox(height: 17.v),
        Text(
          "Let’s Get Started",
          style: CustomTextStyles.titleMediumOnPrimaryContainer,
        ),
        SizedBox(height: 10.v),
        Text(
          "Create a new account",
          style: CustomTextStyles.labelLargeGray50,
        ),
      ],
    );
  }

  Widget _buildFullName(BuildContext context) {
    return CustomTextFormField(
      controller: fullNameController,
      hintText: "Full Name",
      prefix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgUser,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(maxHeight: 48.v),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
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
    );
  }

  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "Password",
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
    );
  }

  Widget _buildPassword1(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController1,
      hintText: "Password Again",
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
    );
  }

  Widget _buildMobileNumber(BuildContext context) {
    return CustomTextFormField(
      controller: mobileNumberController,
      hintText: "Mobile Number",
      textInputType: TextInputType.phone,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
        child: CustomImageView(
          imagePath: 'assets/images/mobile_icon.png',
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(maxHeight: 48.v),
    );
  }

  Widget _buildRank(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        hintText: "Select Rank",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      value: rankController.text.isEmpty ? ranks.first : rankController.text,
      items: ranks.map((rank) {
        return DropdownMenuItem(
          value: rank,
          child: Text(rank),
        );
      }).toList(),
      onChanged: (value) {
        rankController.text = value as String;
      },
    );
  }

  Widget _buildDGNumber(BuildContext context) {
    return CustomTextFormField(
      controller: dgpNumberController,
      hintText: "DGP Number",
      prefix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
        child: CustomImageView(
          imagePath: 'assets/images/station_icon.png',
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(maxHeight: 48.v),
    );
  }

  Widget _buildPoliceStation(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        hintText: "Select Police Station",
        hintStyle: TextStyle(color: const Color.fromARGB(255, 107, 104, 104)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      value: selectedPoliceStationController.text.isEmpty
          ? policeStations.first
          : selectedPoliceStationController.text,
      items: policeStations.map((station) {
        return DropdownMenuItem(
          value: station,
          child: Text(station),
        );
      }).toList(),
      onChanged: (value) {
        selectedPoliceStationController.text = value as String;
      },
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
          text: "Sign Up",
          buttonStyle: CustomButtonStyles.fillPrimary,
          buttonTextStyle: CustomTextStyles.titleSmallTeal300,
          onPressed: () async {
            List<String> existingDGPs =
                await _firestoreService.getExistingDGPs();
            String enteredDGP = dgpNumberController.text;

            if (existingDGPs.contains(enteredDGP)) {
              await _firestoreService.registerUser(
                dgpNumber: enteredDGP,
                email: emailController.text,
                fullName: fullNameController.text,
                mobileNumber: mobileNumberController.text,
                password: passwordController.text,
                rank: rankController.text,
                selectedPoliceStation: selectedPoliceStationController.text,
              );
              setState(() {
                successMessage = 'Registration successful!';
                errorMessage = ''; // Clear any previous error message
              });
              // You can add navigation or any other logic after successful user signup.
            } else {
              setState(() {
                errorMessage = 'Invalid DGP. User registration not allowed.';
                successMessage = ''; // Clear any previous success message
              });
            }
          },
        ),
        SizedBox(height: 16.v),
        Text(
          errorMessage,
          style: TextStyle(color: Colors.red),
        ),
        SizedBox(height: 16.0),
        Text(
          successMessage,
          style: TextStyle(color: Colors.green),
        ),
        SizedBox(height: 16.v),
      ],
    );
  }

  onTapTxtHaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
