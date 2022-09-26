import 'package:blood_donation/helper/helper_function.dart';
import 'package:blood_donation/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'firebase_options.dart';
import 'screen/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        primarySwatch: Colors.red,
      ),
      home: SplashScreenView(
        navigateRoute: _isSignedIn?Home():LoginScreen(),
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


