import 'package:blood_donation/shared/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.labelText,

    this.textColor,
    this.fontWeight,
    required this.controller,
    required this.validator,
  }) : super(key: key);
  final String? labelText;

  final Color? textColor;
  final FontWeight? fontWeight;
  final TextEditingController controller;
  final String validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        hintText: labelText,
        focusColor: Colors.black,
        fillColor: Colors.black,
        hoverColor: Colors.black,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),

      ),
      validator:  (val) {
        if (validator == "email") {
          return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(val!)
              ? null
              : "Please enter a valid email";
        } else if (validator == "password") {
          return RegExp(
              r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
              .hasMatch(val!)
              ? null
              : "Minimum eight characters, at least one uppercase letter, \none lowercase letter, one number and one special character";
        } else {
          if(val!.isNotEmpty){
            return null;
          }
          else{
            return "{$validator} can't be empty";
          }
        }
      },
    );
  }
}
