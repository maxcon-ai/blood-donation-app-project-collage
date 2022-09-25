import 'package:blood_donation/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                color: Colors.red,
                child: Center(
                  child: Container(
                    width: 250,
                    child: SizedBox(
                      child: Image.asset(
                        "assets/logo/logo.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 350,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        color: Colors.grey.shade500,
                        blurRadius: 15)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Login",
                        style: GoogleFonts.roboto(fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.roboto(fontSize: 17),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        hintText: "type your email",
                        fillColor: Colors.black,
                        hoverColor: Colors.black,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.roboto(fontSize: 17),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        hintText: "type your password",
                        fillColor: Colors.black,
                        hoverColor: Colors.black,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: GoogleFonts.roboto(fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.off(
                              LoginScreen(),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.leftToRight,
                            );
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.roboto(
                                fontSize: 15, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 575,
              child: Container(
                  width: 411,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Get.off(
                            LoginScreen(),
                            transition: Transition.downToUp,
                          );
                        }),
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )))
        ],
      ),
    );
  }
}
