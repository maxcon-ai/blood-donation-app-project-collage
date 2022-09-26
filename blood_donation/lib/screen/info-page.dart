import 'package:blood_donation/screen/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper/helper_function.dart';
import '../services/auth_services.dart';
import '../services/database_service.dart';
import 'login_screen.dart';

class TeamInfo extends StatefulWidget {
  const TeamInfo({Key? key}) : super(key: key);

  @override
  State<TeamInfo> createState() => _TeamInfoState();
}

class _TeamInfoState extends State<TeamInfo> {
  String userName = "";
  String email = '';
  AuthService authService = AuthService();
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

    }


  Future<void> urllancher(Uri url) async {
    if (await canLaunchUrl(url)) {
      throw "couldn't launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
            children: [
            buidProfile(
            profilePic:
            "https://shopnow.uuizard.com/wp-content/uploads/2022/08/IMG_20191129_130713.jpg",
            name: "Avijit Mondal (Team leader)",
            roll: "136067",
            profileLink: 'https://www.facebook.com/avijitmondalofficial3/'),
        buidProfile(
            profilePic:
            "https://shopnow.uuizard.com/wp-content/uploads/2022/08/291857137_724649958798598_2590277084743523940_n.jpg",
            name: "Abdur Rahman",
            roll: "136073",
            profileLink: "https://www.facebook.com/ar.r.503"),
        buidProfile(
            profilePic:
            "https://scontent.fcgp17-1.fna.fbcdn.net/v/t1.6435-9/156525897_958930591514007_1125907877766587274_n.jpg?stp=dst-jpg_s960x960&_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=Np7R7q7AVAYAX-Abloa&_nc_ht=scontent.fcgp17-1.fna&oh=00_AT9mk5_QRueH428PtftWSsvzzHBEFeJRW_NHLsYxN6N3kA&oe=635505DA",
            name: "Safayet Hossain",
            roll: "136071",
            profileLink: "https://www.facebook.com/s.136071"),
        buidProfile(
          profilePic: "https://shopnow.uuizard.com/wp-content/uploads/2022/08/279180643_1413636052408630_8726274460623902676_n.jpg",
          name: 'Mohammad Riaydul Islam', roll: "136075", profileLink: "https://www.facebook.com/s.136071"), 
              buidProfile(profilePic: "https://shopnow.uuizard.com/wp-content/uploads/2022/08/297102404_1481182032320698_970767902359759956_n.jpg",
                  name: 'Jenifar Sadia', roll: "178981", profileLink: "https://www.facebook.com/100028051686320/"),
              buidProfile(profilePic: "https://scontent.fcgp17-1.fna.fbcdn.net/v/t1.15752-9/275146950_331238478984731_4601549823637570835_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=ae9488&_nc_ohc=HzAFJc3Z2yEAX-TlKFc&_nc_ht=scontent.fcgp17-1.fna&oh=03_AVLxlZ563QdFG9x-rwhHNcB8nccxpgQKRI0KklZ9CAzniA&oe=63570358", name: "Dania Binte Rukaiya", roll: "136065", profileLink: ""),
              buidProfile(profilePic: "https://shopnow.uuizard.com/wp-content/uploads/2022/08/50818587_652581308490970_2642086150457524224_n.jpg", name: "Mohammad Arifur Rahman", roll: "136051", profileLink: ""),
              buidProfile(profilePic: "https://static-01.daraz.com.bd/p/6beb1c849ffcfdde52a446632446a045.jpg", name: "Eyesha Harun", roll: "136066", profileLink: ""),
              buidProfile(profilePic: "https://shopnow.uuizard.com/wp-content/uploads/2022/08/289608930_886445685649687_1581133736543334273_n.jpg",
                  name: "Arfan Islam Redowan", roll: "136079", profileLink: ""),
              buidProfile(profilePic: "https://static-01.daraz.com.bd/p/6beb1c849ffcfdde52a446632446a045.jpg", name: "Israt Jahan Nessa", roll: "136057", profileLink: "")
              
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
  buidProfile({required String profilePic,
    required String name,
    required String roll,
    required String profileLink}) {
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
                      image: NetworkImage(profilePic), fit: BoxFit.fitHeight)),
            ),
            Text(
              name,
              style: GoogleFonts.roboto(fontSize: 22),
              textAlign: TextAlign.start,
            ),
            Text("Roll: $roll"),
            SizedBox(
              height: 2,
            ),
            GestureDetector(
              onTap: () {
                print("click");
                final Uri url = Uri.parse(profileLink);
                launchUrl(url);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Text(
                  'View Profile',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
