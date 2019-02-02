import 'package:flutter/material.dart';
import 'package:zoo_app/ui/components/attraction/attraction_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoo_app/resources/app_constants.dart';

class AttractionFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
            stream: Firestore.instance.collection(AppConstants.attractionCollection).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.documents != null) {
                return GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 6.0 / 9.0,
                    children: List.generate(
                        snapshot.data.documents.length, (index) {
                      return AttractionCard(snapshot.data.documents[index]);
                    }));
              }
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Image.asset("assets/images/loading.gif"),
                ),
              );
            }
        ));
  }
}


