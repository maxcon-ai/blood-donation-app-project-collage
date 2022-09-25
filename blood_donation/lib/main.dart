import 'package:blood_donation/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenView(
        navigateRoute: LoginScreen(),
        duration: 3000,
        imageSize: 250,
        imageSrc: "assets/logo/logo.png",
        text: "Save Life",
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.red),
        backgroundColor: Colors.white,
      ),
    );
  }
}


