import 'package:flutter/material.dart';
import 'package:zoo_app/routes/app_route.dart';
import 'package:zoo_app/resources/app_strings.dart';


class HomeTicketBanner extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left:4.0,right: 4.0, bottom: 4.0),
        child: GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/banner_ticket.png", fit: BoxFit.fitWidth, height: 100.0,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width),
                ],
              ),
            ), onTap: () {
              AppRoute.goToWebPage(context, Strings.vInfoBuyTicketOnline, "http://attendize.website/e/6124/ok");
        })
    );
  }
}