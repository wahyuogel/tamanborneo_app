import 'package:flutter/material.dart';
import 'package:zoo_app/ui/pages/attraction_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttractionPageRoute extends MaterialPageRoute<Null> {
  final DocumentSnapshot document;

  AttractionPageRoute(this.document)
      : super(builder: (BuildContext context) {
          return AttractionPage(document);
        });
}
