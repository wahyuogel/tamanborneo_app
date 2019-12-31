import 'package:scoped_model/scoped_model.dart';


class AnimalModel extends Model {
  int _id;
  String _name;
  String _image;

  int get id => _id;

  String get name => _name;

  String get image => _image;

  AnimalModel(int index, String name, String image) {
    _id = index;
    _name = name;
    _image = image;
    notifyListeners();
  }

}