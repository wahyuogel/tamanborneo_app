import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://scontent.fcgk8-2.fna.fbcdn.net/v/t1.0-9/49028215_522826824793663_3806217755930132480_n.jpg?_nc_cat=107&_nc_eui2=AeGLPAkgqYGY0bOJM3Jy50IoEUcQoNZ98XE5-jNE9QiQjKIA6nbSJOWJ4YG57AwFeX5YdfPbyJ-uMzuVnnPBsWgZm5Cbk2ozHYsuVkZq6kyXQg&_nc_ht=scontent.fcgk8-2.fna&oh=08f123a1c588e38c80238a174f213951&oe=5C91E88B',
  'https://scontent.fcgk8-1.fna.fbcdn.net/v/t1.0-9/48403668_519375135138832_1655260780762759168_n.jpg?_nc_cat=111&_nc_eui2=AeGnWwdN1QhF70K3tEnPEhsoo_H7xlhKIID6JnOLRReNYimu5X3WaBKVMLlS22lYxnZhh-WkxVmlDXKBLfnDtE9VAMs9yyX0ucFOTE197tB-7g&_nc_ht=scontent.fcgk8-1.fna&oh=cd57ec7d4feb8577b129fd6d3b1aad80&oe=5C93D028',
  'https://scontent.fcgk8-1.fna.fbcdn.net/v/t1.0-9/49535984_521951878214491_1009412576934625280_n.jpg?_nc_cat=111&_nc_eui2=AeFRbg_7suKv7TaBjoqUTB512CMZlWthPdCGf7efiu9KiKHkzBXk0AsjEh8v-CgwXrnEhsdJgfYeHi5h97nQUmUHKd01e4X0jTXF5RnkBDZeLw&_nc_ht=scontent.fcgk8-1.fna&oh=50981875cce8d204a5f91922cece05ae&oe=5CD2506A',
];

final List child = map<Widget>(imgList, (index, i) {
  return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(i,
                fit: BoxFit.fitWidth,
                width: 1000.0,
              ),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text('',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  )
              ),
            ],
          )
      )
  );
}).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class HomeCarousel extends StatefulWidget {
  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          CarouselSlider(
            items: child,
            autoPlay: true,
            reverse: false,
            updateCallback: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(imgList, (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Colors.white
                            : Color.fromRGBO(0, 0, 0, 0.4)
                    ),
                  );
                }),
              )
          )
        ]
    );
  }
}