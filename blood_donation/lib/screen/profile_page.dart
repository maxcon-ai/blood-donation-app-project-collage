import 'package:blood_donation/screen/info-page.dart';
import 'package:blood_donation/screen/login_screen.dart';
import 'package:blood_donation/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/helper_function.dart';
import '../services/auth_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "";
  String email = '';
  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailSF().then((value) => (setState(() {
          email = value!;
        })));
    await HelperFunctions.getUserNameSF().then((value) => (setState(() {
          userName = value!;
        })));
    print(userName);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            CircleAvatar(
              backgroundColor: Colors.red,
              maxRadius: 50,
              child: Text(
                userName[0],
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                userName,
                style: GoogleFonts.openSans(fontSize: 25),
              ),
            ),
            Divider(thickness: 2),
            SizedBox(
              height: 55,
            ),
            Card(
              child: ListTile(

                onTap: () {
                  Get.to(Home());
                },
                leading: Icon(Icons.home),
                title: Text("home"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              child: ListTile(
                selected: true,
                onTap: () {},
                leading: Icon(Icons.person),
                title: Text("Profile"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              child: ListTile(
                leading: Image.asset("assets/logo/blood-icon.png",
                    width: 24, color: Colors.grey),
                title: Text("Signup As Donar"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              child: ListTile(
                onTap: (){
                  Get.to(TeamInfo());
                },
                leading: Icon(Icons.info_outline_rounded),
                title: Text("Info"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app_outlined,
                ),
                onTap: () async {
                  Get.defaultDialog(
                      title: "Are you sure you want to logout?",
                      barrierDismissible: false,
                      buttonColor: Colors.red,
                      confirmTextColor: Colors.white,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              authService.signOut().whenComplete(
                                  () => (Get.offAll(LoginScreen())));
                            },
                            child: Text("Confirm"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.red,
                                  side:
                                      BorderSide(width: 1, color: Colors.red)),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Cancle")),
                        ],
                      ));
                },
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.account_circle,
              size: 200,
              color: Colors.grey[600],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Full Name: ",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Expanded(
                  child: Text(
                    userName,
                    style: TextStyle(fontSize: 17),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 5,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Email: ",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Expanded(
                  child: Text(
                    email,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
