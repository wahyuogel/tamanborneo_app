import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
        HeadingSection(document),
        DetailSection(),
      ],
    );
  }
}


class HeadingSection extends StatelessWidget {

  final DocumentSnapshot document;

  HeadingSection(this.document);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(
            this.document["image"],
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 36.0,
            left: 20.0,
            child: FloatingActionButton(
              elevation: 0,
              mini: true,
              backgroundColor: Colors.green,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
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
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_drop_down_circle),
                  ))
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