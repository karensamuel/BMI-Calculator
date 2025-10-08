
import 'package:flutter/material.dart';

import '../../../core/colors_manager.dart';

class WeightAgeCard extends StatefulWidget {
  final String mtext;
   double counter;
   WeightAgeCard({
    super.key, required this.mtext, required this.counter,
  });

  @override
  State<WeightAgeCard> createState() => _WeightAgeCardState();
}

class _WeightAgeCardState extends State<WeightAgeCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.only(top: 16,bottom: 8,left: 8,right: 8),


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
          child:Column(
            children: [
              Text(widget.mtext,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey)),
              Text("${widget.counter.toInt()}",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: ColorsManager.orange)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        widget.counter--;
                      });

                    }, icon: Icon(Icons.remove,color: ColorsManager.orange,)),
                    IconButton(onPressed: (){
                      setState(() {
                        widget.counter++;
                      });

                    }, icon: Icon(Icons.add,color: ColorsManager.orange,))

                  ]
              )

            ],
          )

      ),
    );
  }
}