import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_field/date_field.dart';

class AuthDateInput extends StatefulWidget {
  const AuthDateInput(
      {Key? key,
      required this.hintText,
      required this.label,
      required this.selectedDate,
      required this.maxDate,
      this.onChanged})
      : super(key: key);
  final String hintText;
  final String label;
  final DateTime selectedDate;
  final Function? onChanged;
  final DateTime maxDate;
  @override
  State<AuthDateInput> createState() => _AuthDateInput();
}

class _AuthDateInput extends State<AuthDateInput> {
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      // in a build
      mode: DateTimeFieldPickerMode.date,
      onDateSelected: (DateTime value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      selectedDate: widget.selectedDate,
      lastDate: widget.maxDate,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
          contentPadding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 5),
          label: Text(widget.label,
              style:
                  GoogleFonts.poppins(color: Colors.grey[500], fontSize: 12)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1, color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Color(0xFFe63900))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1, color: Color(0xFFe63900)))),
    );
  }
}
