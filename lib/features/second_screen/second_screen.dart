import 'dart:ui';

import 'package:bmicalculator2/core/colors_manager.dart';
import 'package:bmicalculator2/core/common_widgets/appbutton.dart';
import 'package:bmicalculator2/features/second_screen/widgets/status_tag.dart';
import 'package:bmicalculator2/features/second_screen/widgets/weight_age_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import '../../core/common_widgets/app_bar.dart';
import '../first_screen/Logic/calc_bmi.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late RulerPickerController _rulerPickerController;
  num currentValue = 170;
  double weightValue =65;
  double ageValue =20;




  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: currentValue);
  }

  @override
  Widget build(BuildContext context) {
    final bool isMale = ModalRoute.of(context)!.settings.arguments as bool;
    String genderName = (isMale?"Male":"female") ;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Please Modify the values",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WeightAgeCard( mtext: "Weight (kg)", counter: weightValue,),
                  WeightAgeCard( mtext: "Age", counter: ageValue,),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.only(top: 16,bottom: 16),
        
        
                decoration: BoxDecoration(
        
                  borderRadius: BorderRadius.circular(20),
                  color: ColorsManager.Lightorange,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Color and opacity of the shadow
                      spreadRadius: 1, // Extends the shadow outwards
                      blurRadius: 2, // Blurs the edges of the shadow (gives the elevated look)
                      offset: Offset(0, 4), // Shifts the shadow slightly down (X, Y)
                    ),
                  ],
        
                ),
        
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Select your height (cm)",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      currentValue.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 16),
                    RulerPicker(
                      controller: _rulerPickerController,
                      onValueChanged: (value) {
                        setState(() {
                          currentValue = value;
                        });
                      },
                      onBuildRulerScaleText: (index, value) => value.toInt().toString(),
                      ranges: const [
                        RulerRange(begin: 100, end: 220, scale: 1),
                      ],
                      scaleLineStyleList: const [
                        ScaleLineStyle(color: Colors.green, width: 2, height: 30, scale: 0),
                        ScaleLineStyle(color: Colors.green, width: 1, height: 20, scale: 5),
                        ScaleLineStyle(color: Colors.green, width: 1, height: 10, scale: -1),
                      ],
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      rulerMarginTop: 8,
                      marker: const Icon(Icons.arrow_drop_down, size: 40, color: Colors.orange),
                      rulerBackgroundColor: ColorsManager.Lightorange,
                    ),
                  ],
                ),
              ),
              appbutton(name: "Calculate",onpressed:  () {
              Map<String, dynamic>  result = calculateBMI(genderName: genderName,heightValue:currentValue.toDouble() , weightValue: weightValue, ageValue: ageValue);
              showBlurDialog(context,result, currentValue ,
               weightValue ,
               ageValue ,genderName);
        
              },)

            ],
          ),
        ),
      ),
    );
  }
}
void showBlurDialog(BuildContext context,Map<String, dynamic> result,num currentValue ,
double weightValue,
double ageValue ,String genderName){
  bool isnormal = false;
  Color textColor =ColorsManager.orange;
  var status = result["status"];
  var bmi = result["result"];
  if(status == "Normal"){
    isnormal ==true;
    textColor = ColorsManager.green;
  }
  showDialog(context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.2),
    builder: (context) {
      return  BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24), // reduces side margin
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: ColorsManager.Lightgreen,
          child: Container(
            width: double.infinity, // takes full available width
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min, // fits content height
              children: [
                const Text("Your BMI",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text(
                  bmi.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 16),
                StatusTag( text:status, color:textColor,),
                // 🔹 add divider line
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 30,
                ),

                // Values row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "$weightValue kg",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$currentValue cm",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$ageValue",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      genderName,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Labels row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Weight",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Text("Height",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Text("Age", style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Text("Gender",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ],
                ),



                const SizedBox(height: 20),
                appbutton(
                  name: "Close",
                  onpressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      );

    },
  );
}