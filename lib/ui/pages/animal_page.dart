import 'package:flutter/material.dart';

class AnimalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );

    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        HeadingSection(),
        DetailSection(),
      ],
    );
  }
}


class HeadingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/home_nav_animal.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 36.0,
            child: FlatButton.icon(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                label: Text("")),
          ),
          Positioned(
            left: 36.0,
            bottom: 54.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Ayam Besaung",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 36.0,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(10.0, 10.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(10.0, 10.0),
                          blurRadius: 10.0,
                          color: Color.fromARGB(125, 0, 0, 255),
                        ),
                      ]),
                ),
                Text("Ayamorpus Mampus",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 24.0),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 2.0,
              child: Align(
                alignment: Alignment.center,
                child: Icon(Icons.keyboard_arrow_down, color: Colors.white,)
              )
          )

        ],
      ),
    );
  }
}

class DetailSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Ayam Besaung")),
        body: Text("OK"),
      ),
    );
  }
}