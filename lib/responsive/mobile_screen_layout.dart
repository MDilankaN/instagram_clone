import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart' as modalUser;
import 'package:instagram_clone/resources/auth_methods.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  modalUser.User user = modalUser.User.empty();

  @override
  void initState() {
    super.initState();
  }

  getUserDetails() async {
    var data = await AuthMethods().getUserDetails();

    print(data.username);
    setState(() {
      user = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(user.username.toString())),
    );
  }
}
