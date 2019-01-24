import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zoo_app/resources/app_colors.dart';
import 'package:zoo_app/resources/app_strings.dart';

class AnimalPage extends StatelessWidget {

  final DocumentSnapshot document;

  AnimalPage(this.document);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );

    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        HeadingSection(document, controller),
        DetailSection(document),
      ],
    );
  }
}


class HeadingSection extends StatelessWidget {

  final DocumentSnapshot document;
  final PageController controller;

  HeadingSection(this.document, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Image.network(
            this.document["image"],
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                )
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 36.0,
                  bottom: 54.0,
                  child: Text(this.document["name"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 36.0),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(padding: EdgeInsets.only(bottom: 10.0),
                        child: FloatingActionButton(
                          elevation: 0,
                          mini: true,
                          backgroundColor: Colors.green,
                          onPressed: () {
                            controller.jumpToPage(1);
                          },
                          child: Icon(Icons.arrow_drop_down_circle),
                        ))
                )
              ],
            ),

          ),
          Positioned(
            top: 36.0,
            left: 20.0,
            child: FloatingActionButton(
              elevation: 0,
              heroTag: null,
              mini: true,
              backgroundColor: Colors.green,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailSection extends StatelessWidget {

  final DocumentSnapshot document;

  DetailSection(this.document);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(color: Color(0xFFFFFDE7)),
      child: Column(
        children: <Widget>[
          _buildRowSizeInfo(document),
          _buildRowLivedInInfo(context, document),
          _buildConservationStatusInfo(context, document),
          _buildFactInfo(context, document),
        ],
      ),
    );
  }

  Widget _buildFactInfo(BuildContext context,
      DocumentSnapshot document) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(child: Text(Strings.animalInfoFact,
                style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Chewy',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ), padding: EdgeInsets.only(bottom: 8.0)),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.all(8.0),
                child: Text(document["fact"],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Chewy',
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0),
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _buildConservationStatusInfo(BuildContext context,
      DocumentSnapshot document) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(child: Text(Strings.animalInfoLivedIn,
                style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Chewy',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0),
              ), padding: EdgeInsets.only(bottom: 8.0)),
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.all(10.0),
                  child: Text(document["conservation_status"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Chewy',
                        fontWeight: FontWeight.w600,
                        fontSize: 36.0),
                  ),
                  decoration: BoxDecoration(color: Colors.red),
                ),
              )
            ],
          ),
        )
    );
  }

  Widget _buildRowLivedInInfo(BuildContext context, DocumentSnapshot document) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(6.0),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            padding: EdgeInsets.only(top: 20.0, left: 12.0, bottom: 20.0),
            decoration: BoxDecoration(color: Color(0xFFFDD835)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(Strings.animalInfoLivedIn,
                  style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'Chewy',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0),
                ),
                Text(document["lived_in"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primary,
                      fontFamily: 'Chewy',
                      fontWeight: FontWeight.w600,
                      fontSize: 48.0),
                )
              ],
            ),
          )
      ),
    );
  }

  Widget _buildRowSizeInfo(DocumentSnapshot document) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text(Strings.animalInfoHeight,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'Chewy',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0),
                ),
              ),
              Text("20 M",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: 'Chewy',
                    fontWeight: FontWeight.w600,
                    fontSize: 48.0),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text(Strings.animalInfoWeight,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'Chewy',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0),
                ),
              ),
              Text("20 Kg",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: 'Chewy',
                    fontWeight: FontWeight.w600,
                    fontSize: 48.0),
              )
            ],
          ),
        )
      ],
    );
  }
}