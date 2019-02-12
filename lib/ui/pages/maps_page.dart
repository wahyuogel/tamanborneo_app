import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zoo_app/ui/components/common/app_back_button.dart';

class MapsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(-0.447143,117.207241), zoom: 18.0),
                    )
                );
              },
            ),
            //TODO REMOVE AFTER DEMO
            Center(child:   Container(
                decoration: BoxDecoration(color: Colors.yellowAccent),
                child: Text("Fitur ini masih dalam tahap pengembangan", textAlign: TextAlign.center)),),
            AppBackButton()
          ],
        )
    ));
  }
}