import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoo_app/ui/components/common/app_back_button.dart';
import 'package:zoo_app/routes/app_route.dart';
import 'package:zoo_app/resources/app_constants.dart';

class AttractionPage extends StatelessWidget {
  final DocumentSnapshot document;
  AttractionPage(this.document);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: Color(0xFFFFFDE7)),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Image.network(
                            this.document["image"],
                            width: MediaQuery.of(context).size.width,
                            height: 300.0,
                            fit: BoxFit.cover,
                          ),
                          _buildPriceTag(context, document)
                        ],
                      ),
                      _buildAttractionName(document),
                      _buildAttractionDescription(document),
                    ],
                  ),
                ),
                AppBackButton(),
                _buildTicketButton(context)
              ],
            )));
  }

  Widget _buildAttractionName(DocumentSnapshot document) {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(12.0),
        child: Text(
          document["name"],
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.green,
              fontFamily: 'Chewy',
              fontWeight: FontWeight.w400,
              fontSize: 36.0),
        ));
  }

  Widget _buildAttractionDescription(DocumentSnapshot document) {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(12.0),
        child: Text(
          document["description"],
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black45,
              fontFamily: 'Chewy',
              fontWeight: FontWeight.w200,
              fontSize: 18.0),
        ));
  }

  Widget _buildPriceTag(BuildContext context, DocumentSnapshot document) {
    return Positioned(
        bottom: 20.0,
        right: 20.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Rp. ${document['ticket_price']} / sekali main",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0),
            ),
            decoration: BoxDecoration(color: Colors.orangeAccent),
          ),
        ));
  }

  Widget _buildTicketButton(BuildContext context) {
    return Positioned(
        bottom: 10.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: GestureDetector(
            onTap: () {
              AppRoute.goToWebPage(context, "Beli Tiket", AppConstants.bookTicketURL);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Beli tiket atraksi ini",
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
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
          ),
        ));
  }
}
