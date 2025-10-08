
import 'package:flutter/material.dart';

import '../../../core/colors_manager.dart';

class GenderCard extends StatelessWidget {
  final  String gText;
  final String gImage;
  final bool isSelected;

  const GenderCard({
    super.key, required this.gText, required this.gImage, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        margin: EdgeInsets.only(top: 16,bottom: 16),


        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),
          color: isSelected?ColorsManager.Lightgreen:ColorsManager.Lightorange,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Color and opacity of the shadow
              spreadRadius: 1, // Extends the shadow outwards
              blurRadius: 2, // Blurs the edges of the shadow (gives the elevated look)
              offset: Offset(0, 4), // Shifts the shadow slightly down (X, Y)
            ),
          ],

        ),

        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(gText,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color:isSelected?ColorsManager.green:ColorsManager.orange),),
            Image.asset(gImage,)
          ],

        )
    );
  }
}
