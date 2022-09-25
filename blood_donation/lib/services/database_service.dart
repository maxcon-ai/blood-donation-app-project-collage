import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String? userID;
  DatabaseService(this.userID);


  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection = FirebaseFirestore.instance.collection('groups');

  Future saveingUserData(String fullName, String email,String password) async{
    return await userCollection.doc(userID).set({
      'fullName': fullName,
      "email": email,
      "password":password,
      'groups': [],
      'profilePic':"",
      "userId":userID,
    });
  }
  Future gettingUserData(String email)async{
    QuerySnapshot snapshot = await userCollection.where("email").get();
    return snapshot;
  }
  getUserGroups() async{
    return await userCollection.doc(userID).snapshots();
  }


}
