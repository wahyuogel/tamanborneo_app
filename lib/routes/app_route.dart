import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './profile_page_route.dart';
import './animal_page_route.dart';

class AppRoute{
  static void goToProfilePage(BuildContext context, FirebaseUser user){
    Navigator.push(context,ProfilePageRoute(user));
  }

  static void goToAnimalDetailPage(BuildContext context){
    Navigator.push(context, AnimalPageRoute());
  }
}