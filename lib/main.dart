import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:zoo_app/ui/fragments/home_fragment.dart';
import 'package:zoo_app/ui/fragments/visitor_info_fragment.dart';
import 'package:zoo_app/ui/fragments/animals_fragment.dart';
import 'package:zoo_app/ui/fragments/attraction_fragment.dart';
import 'package:zoo_app/ui/fragments/profile_fragment.dart';
import 'package:zoo_app/resources/app_colors.dart';
import 'package:zoo_app/resources/app_strings.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeFragment(),
    AttractionFragment(),
    AnimalsFragment(),
    VisitorInfoFragment(),
    ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // Using most Material widgets requires MaterialLocalizations.
      // To fix this, We should add a material localization delegate to Cupertino app:
      // https://github.com/flutter/flutter/issues/21872#issuecomment-421508939
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: true,
      home: Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(child: _children[_currentIndex]), // new
          bottomNavigationBar: FlipBoxBar(
            initialIndex: 0,
            animationDuration: const Duration(seconds: 1),
            onIndexChanged: (int) => onTabTapped(int),
            items: [
              FlipBarItem(icon: Icon(Icons.home, color: Colors.white,),
                  text: _buildNavItemText(Strings.homePanel),
                  frontColor: AppColors.accent,
                  backColor: AppColors.primary),
              FlipBarItem(icon: Icon(Icons.beach_access, color: Colors.white),
                  text: _buildNavItemText(Strings.attractionPanel),
                  frontColor: Colors.orange,
                  backColor: Colors.orangeAccent),
              FlipBarItem(icon: Icon(Icons.widgets, color: Colors.white),
                  text: _buildNavItemText(Strings.animalsPanel),
                  frontColor: Colors.red,
                  backColor: Colors.redAccent),
              FlipBarItem(icon: Icon(Icons.info, color: Colors.white),
                  text: _buildNavItemText(Strings.visitorInfoPanel),
                  frontColor: Colors.purple,
                  backColor: Colors.purple),
              FlipBarItem(
                  icon: Icon(Icons.account_circle, color: Colors.white),
                  text: _buildNavItemText(Strings.settingsPanel),
                  frontColor: Colors.blue,
                  backColor: Colors.blueAccent),
            ],
          )
      ),

    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  Text _buildNavItemText(String title) {
    return Text(title,
      style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16.0),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Image.asset('assets/images/zoo_logo.png', fit: BoxFit.fitHeight),
      backgroundColor: AppColors.primary,);
  }


}


