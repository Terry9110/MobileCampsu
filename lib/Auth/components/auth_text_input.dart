import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextInput extends StatelessWidget {
  const AuthTextInput(
      {Key? key,
      required this.inputType,
      this.passwordInput = false,
      required this.hintText,
      this.formatterList = const [],
      required this.label,
      this.onChanged,
      this.value})
      : super(key: key);
  final TextInputType inputType;
  final bool passwordInput;
  final String hintText;
  final String label;
  final List<TextInputFormatter> formatterList;
  final Function? onChanged;
  final String? value;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = value ?? "";
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: passwordInput,
      inputFormatters: formatterList,
      onChanged: (txt) {
        if (onChanged != null) {
          onChanged!(txt);
        }
      },
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
          contentPadding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 5),
          label: Text(label,
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
