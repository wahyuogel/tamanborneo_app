import 'package:flutter/material.dart';
import 'package:zoo_app/ui/pages/animal_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalPageRoute extends MaterialPageRoute<Null> {

  final DocumentSnapshot document;

  AnimalPageRoute(this.document) : super(builder: (BuildContext context) {
    return AnimalPage(document);
  });
}
