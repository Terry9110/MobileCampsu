import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campsu/theme.dart';

class Congragulations extends StatefulWidget {
  @override
  State<Congragulations> createState() => _Congragulations();
}

class _Congragulations extends State<Congragulations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 8,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: activeGreenPrimary, width: 5),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                                child: Icon(Icons.done,
                                    size: 40, color: activeGreenPrimary)),
                          ),
                        ]),
                    const SizedBox(height: 20),
                    Text("Congratulations",
                        style: GoogleFonts.poppins(
                            color: activeGreenPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    Text("You have succesfully placed your order.",
                        style: GoogleFonts.poppins(
                          color: activeGreenPrimary,
                          fontSize: 12,
                        )),
                  ])),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/rateCamp");
                        },
                        child: Container(
                            width: 120,
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: activeGreenPrimary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text("Continue",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                    )))))),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
