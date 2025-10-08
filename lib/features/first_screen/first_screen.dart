import 'package:bmicalculator2/core/colors_manager.dart';
import 'package:bmicalculator2/features/first_screen/widgets/gender_card.dart';
import 'package:flutter/material.dart';

import '../../core/common_widgets/app_bar.dart';
import '../../core/common_widgets/appbutton.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
   bool? isMale;
  @override
  Widget build(BuildContext context) {
    final bool isMaleSelected = isMale == true;
    final bool isFemaleSelected = isMale == false;
    return Scaffold(
      appBar: buildAppBar(),
      body:Padding(padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Please choose your gender",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ,GestureDetector(
              onTap: (){
                setState(() {
                  isMale = true;
                });
              },
                child: GenderCard(gText: "Male", gImage:"assets/img/Male.png",isSelected: isMaleSelected,)),
            GestureDetector(
          onTap: (){
    setState(() {
    isMale = false;
    });
    },
        child: GenderCard(gText: "Female", gImage:"assets/img/Female.png",isSelected: isFemaleSelected,)),
            appbutton(name:"Continue", onpressed:(){
              if(isMale == null){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Choose your gender!"),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );

              }
              else{
                Navigator.pushNamed(context, '/secondscreen',arguments:isMale);

              }
            }, )
          ],
        ),
        
      ) ,

    );
  }


}
