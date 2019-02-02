import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoo_app/routes/app_route.dart';

class AttractionCard extends StatelessWidget {
  final DocumentSnapshot document;

  AttractionCard(this.document);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          AppRoute.goToAttractionPage(context, document);
        },
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Stack(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    image: document["image"],
                    fit: BoxFit.cover,
                    height: 400,
                    placeholder: "assets/images/nophoto.gif",
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                          )),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              document["name"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12.0),
                            ),
                          )))
                ],
              )),
        ));
  }
}
