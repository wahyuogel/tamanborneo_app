import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoo_app/ui/pages/profile_page.dart';

class ProfilePageRoute extends MaterialPageRoute<Null> {

//  final FirebaseUser user;

  ProfilePageRoute() : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        elevation: 1.0,
      ),
      body: Builder(
        builder: (BuildContext context) =>
            Center(
              child: ProfilePage(),
            ),
      ),
    );
  });
}
