import 'package:flutter/material.dart';

class GroupTile extends StatefulWidget {
  const GroupTile({Key? key, required this.username, required this.group, required this.location, required this.mobileNo, required this.id}) : super(key: key);
  final String username;
  final String group;
  final String location;
  final String mobileNo;
  final String id;

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(

      ),
    );
  }
}

