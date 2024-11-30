import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key,
      this.hintText,
      this.onChanged,
      this.icon,
      this.obscureText = false});
  Function(String)? onChanged;
  String? hintText;
  Icon? icon;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'data is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Padding(
          padding: EdgeInsets.all(16),
          child: icon,
        ),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 78, 3, 61),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 84, 14, 95),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 84, 14, 95),
          ),
        ),
      ),
    );
  }
}
