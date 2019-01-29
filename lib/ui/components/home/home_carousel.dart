import 'package:flutter/material.dart';
import 'package:zoo_app/helper/MapHelper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeCarousel extends StatefulWidget {
  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _current = 0;

  Widget _buildStream(){
    return StreamBuilder(
        stream: Firestore.instance.collection("promo").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data.documents != null) {
            return _buildCarousel(List.generate(
                snapshot.data.documents.length, (index) {
              return _buildCarouselItem(snapshot.data.documents[index]);
            }));
          }
          return Container(
            width: 100,
            height: 100,
            child: Center(
              child: Image.asset("assets/images/loading.gif"),
            ),
          );
        }
    );
  }

  Widget _buildCarouselItem(DocumentSnapshot document){
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.all(3.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(document["image"],
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
                          child: Text(document["name"],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0),
                          )
                      )
                  ),
                ],
              )
          )
      ),
      onTap: (){

      },
    );
  }

  Widget _buildCarousel(List<Widget> list){
    return Stack(
        children: [
          CarouselSlider(
            items: list,
            autoPlay: true,
            reverse: false,
            updateCallback: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          _buildCarouselIndicator(list)
        ]
    );
  }

  Widget _buildCarouselIndicator(List<Widget> list){
    return Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: MapHelper.map<Widget>(list, (index, url) {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildStream();
  }
}