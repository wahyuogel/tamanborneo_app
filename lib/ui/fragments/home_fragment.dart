import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoo_app/resources/app_strings.dart';
import 'package:zoo_app/routes/app_route.dart';
import 'package:zoo_app/ui/components/home/home_carousel.dart';
import 'package:zoo_app/ui/components/home/home_ticket_banner.dart';
import 'dart:async';

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeFragmentState();
}

class HomeFragmentState extends State<HomeFragment>{
  bool isDemoDialogAlreadyShown = false;

  @override
  Widget build(BuildContext context) {
//    if(!this.isDemoDialogAlreadyShown)
//      Future.delayed(Duration.zero, () => this._showAppInfoDialog(context));

    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: <Widget>[
                    HomeCarousel(),
                    HomeTicketBanner(),
                    Row(
                      children: <Widget>[
                        _buildCardRowNav(
                            context, "assets/images/banner_open.png"),
                        _buildCardRowNav(
                            context, "assets/images/banner_fb_check_in.png"),
                      ],
                    ),
                    _buildCardMap(context),
                  ],
                ))));
  }

  Widget _buildCardRowNav(BuildContext context, String image) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
            onTap: () {},
            child: Padding(
                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Image.asset(image)))));
  }

  Widget _buildCardMap(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.only(left:4.0,right: 4.0, top: 6.0, bottom: 4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.green),
                    child: Column(
                      children: <Widget>[
                        Text(
                          Strings.homeMapLabel,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Chewy',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                        Text(
                          Strings.homeMapContent,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0),
                        ),
                      ],
                    )),
                Image.asset("assets/images/banner_maps.png",
                    fit: BoxFit.fitWidth,
                    height: 150,
                    width: MediaQuery.of(context).size.width),
              ],
            ),
          ),
        ), onTap: () {
      AppRoute.goToMapsPage(context);
    });
  }

  void _showAppInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Strings.profileDialogAboutTitle, style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 16.0)),
          content: Text(
              Strings.profileDialogAboutContent, style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 12.0)),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                setState(() {
                  this.isDemoDialogAlreadyShown = true;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
