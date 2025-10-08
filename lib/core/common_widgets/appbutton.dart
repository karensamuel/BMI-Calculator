
import 'package:flutter/material.dart';

import '../colors_manager.dart';

class appbutton extends StatelessWidget {
  final String name;
  final  void Function()? onpressed;
  const appbutton({
    super.key, required this.name, required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 50),

      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorsManager.green),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            elevation: MaterialStateProperty.all(0),


          ),
          onPressed: onpressed,
          child: Text(name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: ColorsManager.white),)),
    );
  }
}
