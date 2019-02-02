import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './profile_page_route.dart';
import './animal_page_route.dart';
import './maps_page_route.dart';
import './web_page_route.dart';
import './attraction_page_route.dart';

class AppRoute {
  static void goToProfilePage(BuildContext context, FirebaseUser user) {
    Navigator.push(context, ProfilePageRoute(user));
  }

  static void goToAnimalDetailPage(
      BuildContext context, DocumentSnapshot document) {
    Navigator.push(context, AnimalPageRoute(document));
  }

  static void goToMapsPage(BuildContext context) {
    Navigator.push(context, MapsPageRoute());
  }

  static void goToWebPage(BuildContext context, String title, String url) {
    Navigator.push(context, WebPageRoute(title, url));
  }

  static void goToAttractionPage(
      BuildContext context, DocumentSnapshot document) {
    Navigator.push(context, AttractionPageRoute(document));
  }
}

class BaseRoute<T> extends MaterialPageRoute<Null> {
  BaseRoute(K, V)
      : super(builder: (BuildContext context) {
          return null;
        });
}
