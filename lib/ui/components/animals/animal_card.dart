import 'package:flutter/material.dart';
import 'package:zoo_app/resources/app_colors.dart';
import 'package:zoo_app/routes/app_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalCard extends StatelessWidget {


  final DocumentSnapshot document;

  AnimalCard(this.document);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Padding(
      padding: EdgeInsets.all(4.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Stack(children: <Widget>
          [
            FadeInImage.assetNetwork(
              image: document["image"],
              fit: BoxFit.cover,
              height: 300,
              placeholder: "assets/images/nophoto.gif",
            ),
            Align(alignment: Alignment.bottomCenter, child: Container(
              height: 30.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                  color: AppColors.primary
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    document["name"],
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0),
                  )),),
            )
          ]
          )),
    ),
        onTap: () {
          AppRoute.goToAnimalDetailPage(context,document);
        });
  }


}