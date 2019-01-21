import 'package:flutter/material.dart';
import 'package:zoo_app/ui/components/attraction/attraction_card.dart';

class AttractionFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(3.0),
      childAspectRatio: 6.0 / 9.0,
      children: <Widget>[
        AttractionCard("assets/images/attraction/delman.jpg"),
        AttractionCard("assets/images/attraction/kuda_poni.jpg"),
        AttractionCard("assets/images/attraction/kuda_tunggang.jpg"),
        AttractionCard("assets/images/attraction/mobil_remot.jpg"),
        AttractionCard("assets/images/attraction/pasir_boat.jpg"),
        AttractionCard("assets/images/attraction/sepeda_anak.jpg"),
        AttractionCard("assets/images/attraction/sepeda_dewasa.jpg"),
        AttractionCard("assets/images/attraction/foto_satwa.jpg"),
      ],
    );
  }
}


