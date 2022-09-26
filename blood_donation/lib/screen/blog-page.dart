import 'package:blood_donation/screen/donor-page.dart';
import 'package:blood_donation/screen/home.dart';
import 'package:blood_donation/screen/info-page.dart';
import 'package:blood_donation/screen/profile_page.dart';
import 'package:blood_donation/widgets/groupTileWidget.dart';
import 'package:blood_donation/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper/helper_function.dart';
import '../services/auth_services.dart';
import '../services/database_service.dart';
import 'login_screen.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  bool _isloading = false;
  String userName = "";
  String email = '';
  AuthService authService = AuthService();
  Stream? groups;
  String dropdownvalue = 'A+';
  String location = '';
  String mobile = '';

  // List of items in our dropdown menu
  var items = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

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
    await DatabaseService(FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text(
          'Blood Donation',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(itemCount:3,itemBuilder: (context,_){
          return buidProfile(profilePic: "assets/logo/Screenshot_2.png", name: "Blood Save Life", );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Make a request",
        onPressed: () {
          popUpDialog();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.redAccent,
        shape: CircularNotchedRectangle(),
        //shape of notch
        notchMargin: 5,
        //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Get.off(Home());
              },
            ),
            IconButton(
              icon: Icon(
                Icons.people_alt,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 15,
            ),
            IconButton(
              icon: Image.asset("assets/logo/blood-icon.png",
                  width: 24, color: Colors.grey),
              onPressed: () {
                Get.off(DonorInfo());
              },
            ),
            IconButton(
              icon: Icon(
                Icons.menu_book_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Get.off(Blog());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
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
              selected: true,
              onTap: () {},
              leading: Icon(Icons.home),
              title: Text("home"),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            child: ListTile(
              onTap: () {
                Get.to(ProfilePage());
              },
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
                                side: BorderSide(width: 1, color: Colors.red)),
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
    );
  }

  popUpDialog() {
    Get.defaultDialog(
        barrierDismissible: true,
        title: 'Make a request',
        titleStyle: GoogleFonts.roboto(fontSize: 22),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _isloading == true
                ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
                : Column(
              children: [
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      location = val;
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  //Normal textInputField will be displayed
                  maxLines: 3,
                  // when user presses enter it will adapt to it
                  decoration: InputDecoration(
                    labelText: "Location",
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Mobile No"),
                  onChanged: (val) {
                    mobile = val;
                  },
                ),
                Row(
                  children: [
                    Expanded(child: Text("Groups")),
                    Expanded(
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            print(dropdownvalue);
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.red,
                  side: BorderSide(width: 1, color: Colors.red)),
              onPressed: () {
                Get.back();
              },
              child: Text("Cancle")),
          SizedBox(
            width: 25,
          ),
          ElevatedButton(
            onPressed: () async {
              if (location != "" && mobile != "") {
                setState(() {
                  _isloading = true;
                });
                DatabaseService(FirebaseAuth.instance.currentUser!.uid)
                    .createRequest(
                    userName,
                    FirebaseAuth.instance.currentUser!.uid,
                    location,
                    mobile,
                    dropdownvalue) .whenComplete(() {
                  _isloading = false;
                });
                Get.back();
                Get.snackbar("Group Created successfully", "",backgroundColor: Colors.green[400]);
                Get.to(Home());
              }
            },
            child: Text("Confirm"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
          ),
        ]);
  }
  buidProfile({required String profilePic,
    required String name,
    }) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(profilePic), fit: BoxFit.fill)),
            ),
            Text(
              name,
              style: GoogleFonts.roboto(fontSize: 22),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
