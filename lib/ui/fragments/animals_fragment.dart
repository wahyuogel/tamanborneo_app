import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zoo_app/ui/components/animals/animal_card.dart';
import 'package:zoo_app/resources/app_constants.dart';

class AnimalsFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimalFragmentState();
}

class AnimalFragmentState extends State<AnimalsFragment> {

  static const mapItems = <String>[
    'Semua Satwa', 'Mamalia', 'Unggas', 'Reptilia'];
  String selectedItem = mapItems[0];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 40.0),
            child: StreamBuilder(
            stream: Firestore.instance.collection(AppConstants.animalCollection).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.documents != null) {
                return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                        snapshot.data.documents.length, (index) {
                      return AnimalCard(snapshot.data.documents[index]);
                    }));
              }
              return Container(
                  width: double.infinity, 
                  height: double.infinity,
                  child: Center(
                    child: Image.asset("assets/images/loading.gif"),
                  ),
              );
            }
        )),
        Container(
            height: 45.0,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Align(alignment: Alignment.centerRight,
              child: Padding(
                child: DropdownButton<String>(
                  value: selectedItem,
                  items: animalsPanelFilterItems(),
                  onChanged: (String newValue) {
                    setState(() {
                      selectedItem = newValue;
                    });
                  },
                ),
                padding: EdgeInsets.only(right: 15.0),
              ),
            )

        ),
      ],);
  }

  List<DropdownMenuItem<String>> animalsPanelFilterItems() {
    return mapItems.map((String value) =>
        DropdownMenuItem<String>(
          value: value,
          child: Text(value,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14.0),
          ),
        )).toList();
  }

}