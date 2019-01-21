import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zoo_app/model/animal_model.dart';
import 'package:zoo_app/resources/app_colors.dart';
import 'package:zoo_app/routes/app_route.dart';

class AnimalCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return buildAnimalCard();
  }

  Widget buildAnimalCard() {
    return ScopedModelDescendant <AnimalModel>(
        rebuildOnChange: false,
        builder: (context, _, model) =>
           GestureDetector(child:  Padding(
             padding: EdgeInsets.all(4.0),
             child:  ClipRRect(
                 borderRadius: BorderRadius.circular(6.0),
                 child: Stack(children: <Widget>
                 [
                   FadeInImage.assetNetwork(
                     image: model.image,
                     placeholder: "assets/images/loading.gif",
                   ),
                   Align(alignment: Alignment.bottomCenter, child: Container(
                     height: 30.0,
                     width: MediaQuery
                         .of(context)
                         .size
                         .width,
                     decoration: BoxDecoration(
                         color: AppColors.primary
                     ),
                     child: Align(
                         alignment: Alignment.center,
                         child: Text(
                           model.name,
                           style: TextStyle(
                               color: Colors.white,
                               fontFamily: 'Poppins',
                               fontWeight: FontWeight.w600,
                               fontSize: 12.0),
                         )),),
                   )
                 ]
                 )),
           ),
           onTap: (){AppRoute.goToAnimalDetailPage(context);},)

           );
  }

}