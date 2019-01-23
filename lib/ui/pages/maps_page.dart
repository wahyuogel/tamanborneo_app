import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {

  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            )
          ],
        )
    );
  }
}