import 'package:blood_donation/screen/login_screen.dart';
import 'package:blood_donation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/helper_function.dart';
import '../main.dart';
import '../services/auth_services.dart';
import 'home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  // String email ='';
  // String password='';
  bool _isLoading = false;
  TextEditingController? emailController;
  TextEditingController? nameController;
  TextEditingController? passwordController;
  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController!.dispose();
    nameController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }
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
          Form(
            key: formKey,
            child: Positioned(
              top: 250,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  height: 400,
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
                          "Register",
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
                      CustomTextFormField(controller: emailController!, validator: 'email',labelText: "type your email address"),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Full Name",
                        style: GoogleFonts.roboto(fontSize: 17),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      CustomTextFormField(controller: nameController!, validator: 'name',labelText: "type your name"),
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
                      CustomTextFormField(controller: passwordController!, validator: 'password',labelText: "type your password"),
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
          ),
          Positioned(
              top: 625,
              child: Container(
                  width: 411,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          register();
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
  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(nameController!.value.text,
          emailController!.value.text, passwordController!.value.text)
          .then((value) async {
        if (value == true) {
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(emailController!.value.text);
          await HelperFunctions.saveUserNameSF(nameController!.value.text);

          Get.to(Home());
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
