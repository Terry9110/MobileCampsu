import 'package:campsu/Auth/components/auth_text_input.dart';
import 'package:campsu/Auth/components/bottom_text.dart';
import 'package:campsu/Auth/components/date_input.dart';
import 'package:campsu/Auth/components/facebook_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:campsu/Auth/components/action_button.dart';

import 'package:provider/provider.dart';
import 'package:campsu/Auth/SignupPage/model/signupModel.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final provider = Provider.of<SignupModel>(context);
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(25),
      color: Colors.white,
      child: ListView(
        children: [
          Text("Create Account,",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24)),
          const SizedBox(height: 0),
          Text("Sign up to get started!",
              style:
                  GoogleFonts.poppins(color: Colors.grey[500], fontSize: 18)),
          const SizedBox(height: 60),
          AuthTextInput(
            inputType: TextInputType.name,
            hintText: "John Doe",
            label: "Full Name",
            value: provider.fullName,
            onChanged: (txt) {
              provider.setValues("name", txt);
            },
          ),
          const SizedBox(height: 15),
          AuthTextInput(
            inputType: TextInputType.emailAddress,
            hintText: "Email",
            label: "Email",
            value: provider.email,
            onChanged: (txt) {
              provider.setValues("email", txt);
            },
          ),
          const SizedBox(height: 15),
          AuthTextInput(
            inputType: TextInputType.text,
            hintText: "Choose username",
            label: "UserName",
            value: provider.userName,
            onChanged: (txt) {
              provider.setValues("userName", txt);
            },
          ),
          const SizedBox(height: 15),
          AuthTextInput(
            inputType: TextInputType.text,
            hintText: "Password",
            label: "Password",
            passwordInput: true,
            value: provider.password,
            onChanged: (txt) {
              provider.setValues("password", txt);
            },
          ),
          const SizedBox(height: 15),
          AuthDateInput(
            label: "Date of Birth",
            hintText: "Date of Birth",
            maxDate: DateTime(DateTime.now().year - 12),
            selectedDate: provider.dob,
            onChanged: (DateTime date) {
              provider.setDob(date);
            },
          ),
          const SizedBox(height: 15),
          AuthTextInput(
            value: provider.phone,
            onChanged: (txt) {
              provider.setValues("phone", txt);
            },
            inputType: TextInputType.phone,
            hintText: "Phone",
            label: "Phone",
            formatterList: [PhoneInputFormatter()],
          ),
          const SizedBox(height: 15),
          genderPicker(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: width - 50,
                  child: Text(
                      "By proceeding you also agree to the Terms of Service and Privacy Policy",
                      style: GoogleFonts.poppins(color: Colors.grey)))
            ],
          ),
          const SizedBox(height: 20),
          Visibility(
              visible: provider.isLoading,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              )),
          Visibility(
              visible: provider.errMesssage != null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(provider.errMesssage ?? "",
                      style:
                          GoogleFonts.poppins(color: Colors.red, fontSize: 14)),
                ],
              )),
          Visibility(
              visible: ((provider.isLoading) || (provider.errMesssage != null)),
              child: const SizedBox(height: 10)),
          Visibility(
              visible: !provider.isLoading,
              child: InkWell(
                  onTap: () {
                    provider.signup();
                    //Navigator.pushNamed(context, "/signupSuccesful");
                  },
                  child: const ActionButton(buttonName: "Sign Up"))),
          const SizedBox(height: 15),
          const FaceBookSigninButton(buttonName: "Connect with Facebook"),
          const SizedBox(height: 30),
          const BottomText(
            startText: "I'm already a member !",
            actionText: "Login",
            routeName: "/login",
          ),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }

  Widget genderPicker() {
    final provider = Provider.of<SignupModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Gender",
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 12))),
        GenderPickerWithImage(
          showOtherGender: true,
          verticalAlignedText: true,
          selectedGender: provider.gender == "others"
              ? Gender.Others
              : provider.gender == "male"
                  ? Gender.Male
                  : Gender.Female,
          selectedGenderTextStyle: const TextStyle(
              color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
          unSelectedGenderTextStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal),
          onChanged: (Gender? gender) {
            if (gender == null) {
              return;
            }
            print(gender.name);
            provider.setValues("gender", gender.name.toLowerCase());
          },
          equallyAligned: true,
          animationDuration: const Duration(milliseconds: 300),
          isCircular: true,
          // default : true,
          opacityOfGradient: 0.4,
          padding: const EdgeInsets.all(3),
          size: 50, //default : 40
        )
      ],
    );
  }
}
