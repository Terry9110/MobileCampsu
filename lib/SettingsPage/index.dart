import 'package:flutter/material.dart';
import 'package:campsu/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: height * 0.5,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: activeGreenPrimary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(200))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  const SizedBox(width: 10),
                  Text("Profile",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 16))
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: 25, right: 25, bottom: 20, top: height * 0.20),
          child: Container(
            width: width,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Text('Profile Details',
                    style: GoogleFonts.poppins(
                        color: Colors.grey[800], fontWeight: FontWeight.w600)),
                const SizedBox(height: 20),
                profileDetails(fieldName: "UserName", value: "annielarson"),
                profileDetails(fieldName: "First Name", value: "Annie"),
                profileDetails(fieldName: "Last Name", value: "Larson"),
                profileDetails(
                    fieldName: "Email", value: "annie.larson@gmail.com"),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: activeRedPrimary.withOpacity(0.8),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Center(
                          child: Text("Change Password",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 12))),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.1),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 4.0, color: Colors.white),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN3-b6hE_5K-l4bv_gBuFtF5zWoPEhSkLsuw&usqp=CAU"))),
                    )
                  ])
            ]),
      ],
    ));
  }

  Widget profileDetails({required String fieldName, required String value}) {
    return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(fieldName,
                style: GoogleFonts.poppins(
                  color: Colors.black45,
                  fontSize: 14,
                )),
            Text(value,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12))
          ],
        ));
  }
}
