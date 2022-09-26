import 'package:blood_donation/screen/signup_screen.dart';
import 'package:blood_donation/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/helper_function.dart';
import '../main.dart';
import '../services/auth_services.dart';
import '../services/database_service.dart';
import '../widgets/widgets.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthService authService = AuthService();

  // String email ='';
  // String password='';
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            )
          : Stack(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
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
                              CustomTextFormField(
                                controller: emailController!,
                                validator: 'email',
                                labelText: 'type your email',
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
                              CustomTextFormField(
                                  controller: passwordController!,
                                  validator: 'password',
                                  labelText: "type your password"),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: GoogleFonts.roboto(fontSize: 15),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.off(RegisterScreen(),
                                          duration: Duration(milliseconds: 500),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Text(
                                      "Register ",
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
                                login();
                                print("ok");
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
                                    "Sign In",
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

  login() async {
    print("okey");
    if (formKey.currentState!.validate()) {
      print("okey");
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginUserWithEmailandPassword(
              emailController!.value.text, passwordController!.value.text)
          .then((value) async {
        if (value == true) {
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(emailController!.value.text);
          // QuerySnapshot snapshot =await DatabaseService(FirebaseAuth.instance.currentUser!.uid).gettingUserData(emailController!.value.text);
          QuerySnapshot snapshot =
              await DatabaseService(FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(emailController!.value.text);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
          //  print(snapshot);
          print(await DatabaseService(FirebaseAuth.instance.currentUser!.uid)
              .gettingUserData(emailController!.value.text));
          Get.offAll(Home());
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
