import 'package:flutter/material.dart';
import 'package:zoo_app/resources/app_colors.dart';

class PanelBar extends StatelessWidget {

  final String appBarTitle;
  final double appBarHeight = 40.0;
  final EdgeInsets appBarPadding = EdgeInsets.only(left: 12.0, right: 12.0);

  PanelBar(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + appBarHeight,
        color: AppColors.primary,
        child: Row(
          children: <Widget>[
            Expanded(flex: 1,
              child: Padding(
                child:
                Icon(Icons.menu, color: Colors.white),
                padding: appBarPadding,),),
            Expanded(flex: 6,
              child: Container(
                padding: appBarPadding,
                child: Text(
                  appBarTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0
                  ),
                ),),),
            Expanded(flex: 1,
              child: Padding(
                child:
                GestureDetector(
                  child: Icon(Icons.account_circle, color: Colors.white),
                  onTap: () {
//                    AppRoute.goToProfilePage(context);
                  },),
                padding: appBarPadding,),),
          ],
        )
    );
  }

}
