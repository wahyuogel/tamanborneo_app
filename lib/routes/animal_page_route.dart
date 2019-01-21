import 'package:flutter/material.dart';
import 'package:zoo_app/ui/pages/animal_page.dart';

class AnimalPageRoute extends MaterialPageRoute<Null> {
  AnimalPageRoute() : super(builder: (BuildContext context) {
    return AnimalPage();
  });
}
