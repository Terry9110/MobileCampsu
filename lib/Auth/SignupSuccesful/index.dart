import 'package:campsu/Auth/components/action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campsu/theme.dart';

class SignupSuccess extends StatefulWidget {
  @override
  State<SignupSuccess> createState() => _SignupSuccess();
}

class _SignupSuccess extends State<SignupSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration:
                  const BoxDecoration(color: activeGreenPrimary, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                ),
              ]),
              padding: const EdgeInsets.only(
                  left: 15, right: 0, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 5,
                      child: Center(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text("Signup",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child: Text("Done",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 12))))))
                ],
              )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Expanded(
                          flex: 9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.grey[200],
                                  child: const CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.green,
                                      child: Center(
                                          child: Icon(Icons.done,
                                              size: 80, color: Colors.white)))),
                              const SizedBox(height: 20),
                              SizedBox(
                                  width: 180,
                                  child: Text("Sign up was succesful.",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500))),
                              const SizedBox(height: 5),
                              SizedBox(
                                  width: 160,
                                  child: Text(
                                      "You can start using the application now.",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.grey[800])))
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 30,
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                child: loginButton()),
                          ))
                    ])),
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: activeGreenPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text("Go To Login",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
