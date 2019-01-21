import 'package:flutter/material.dart';

class AttractionCard extends StatelessWidget {

  final String asset;

  AttractionCard(this.asset);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: 200.0,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset(asset, fit: BoxFit.cover,)
          ),
        )
    );
  }
}