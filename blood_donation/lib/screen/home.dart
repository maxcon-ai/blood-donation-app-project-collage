import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
      floatingActionButton: FloatingActionButton(
        tooltip: "Make a request",
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
        color:Colors.redAccent,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin: 5, //notche margin between floating button and bottom appbar
        child: Row( //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home, color: Colors.white,), onPressed: () {},),
            IconButton(icon: Icon(Icons.people_alt_outlined, color: Colors.white,), onPressed: () {},),
            SizedBox(width: 15,),
            IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},),
            IconButton(icon: Icon(Icons.favorite, color: Colors.white,), onPressed: () {},),
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
              "A",
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
              "Avijit",
              style: GoogleFonts.openSans(fontSize: 25),
            ),
          ),
          Divider(thickness: 2),
          SizedBox(
            height: 55,
          ),
          Card(
            child: ListTile(
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
              leading: Icon(
                Icons.exit_to_app_outlined,
              ),
              title: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
