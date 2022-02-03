import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomText extends StatelessWidget {
  const BottomText(
      {required this.startText,
      required this.actionText,
      required this.routeName});
  final String startText;
  final String actionText;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(startText,
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        const SizedBox(width: 5),
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            child: Text(actionText,
                style: GoogleFonts.poppins(
                    color: const Color(0xFF006633),
                    fontWeight: FontWeight.w600)))
      ],
    );
  }
}
