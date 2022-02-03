import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FaceBookSigninButton extends StatelessWidget {
  const FaceBookSigninButton({required this.buttonName});
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(colors: [
              Color(0xFFE6E4E2),
              Color(0xFFE6E4E2),
            ])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                icon: const FaIcon(FontAwesomeIcons.facebook,
                    color: Color(0xFF4267B2)),
                onPressed: () {}),
            const SizedBox(width: 0),
            Text(buttonName,
                style: GoogleFonts.poppins(
                    color: const Color(0xFF4267B2),
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ],
        ));
  }
}
