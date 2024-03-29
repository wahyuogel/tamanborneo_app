import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoo_app/resources/app_colors.dart';
import 'package:zoo_app/resources/app_strings.dart';
import 'package:zoo_app/routes/app_route.dart';
import 'package:zoo_app/ui/components/common/app_back_button.dart';

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
                  left: 32.0,
                  bottom: 54.0,
                  child: Text(this.document["name"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Chewy',
                        fontWeight: FontWeight.w400,
                        fontSize: 50.0),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(padding: EdgeInsets.only(bottom: 5.0),
                        child: Image.asset(
                          "assets/images/arrow_down.gif",
                          width: 60.0,
                          height: 60.0,)
                    ),
                ),
              ],
            ),

          ),
         
               AppBackButton(),
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
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildRowSizeInfo(document),
              _buildRowLivedInInfo(context, document),
              _buildConservationStatusInfo(context, document),
              _buildFactInfo(context, document),
            ],
          ),
          _buildMapsButton(context)
        ],
      )
    );
  }

  Widget _buildMapsButton(BuildContext context){
    return Positioned(
        bottom: 10.0,
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 50.0,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: GestureDetector(
            onTap: () {
              AppRoute.goToMapsPage(context);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.map, color: Colors.white,),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Temukan satwa ini di Peta",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Chewy',
                            fontWeight: FontWeight.w600,
                            fontSize: 24.0),
                      ),
                    )

                  ],
                ),
                decoration:BoxDecoration(gradient: LinearGradient(
                  colors: <Color>[Colors.lightGreen, AppColors.primary],
                )),
              ),
            ),
          ),
        )
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
                padding: EdgeInsets.all(4.0),
                child: Text(document["fact"],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Chewy',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
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
              Padding(child: Text(Strings.animalInfoConservationStatus,
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
                        fontSize: 30.0),
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
            padding: EdgeInsets.only(top: 15.0, left: 12.0, bottom: 15.0),
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
                      fontSize: 36.0),
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
              Text("${document['height']} m",
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
              Text("${document['weight']} Kg",
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