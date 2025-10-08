import 'package:flutter/material.dart';

import '../colors_manager.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('BMI ',style: TextStyle(color: ColorsManager.orange,fontSize: 30,fontWeight: FontWeight.bold),),
        Text('Calculator',style: TextStyle(color: ColorsManager.green,fontSize: 30,fontWeight: FontWeight.bold),),
      ],
    ),
  );
}