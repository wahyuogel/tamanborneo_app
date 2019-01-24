import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttractionCard extends StatelessWidget {

  final DocumentSnapshot document;

  AttractionCard(this.document);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: 200.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: FadeInImage.assetNetwork(
                image: document["image"],
                fit: BoxFit.cover,
                height: 400,
                placeholder: "assets/images/nophoto.gif",
              )
          ),
        )
    );
  }
}