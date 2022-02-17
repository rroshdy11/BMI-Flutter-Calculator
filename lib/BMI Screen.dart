import 'dart:math';

import 'package:bmicalc/bmi_result-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {

  @override
  _BmiCalcState createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  bool ismale=true;
   double hight=120;
   int age=20;
   int weight=40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            'BMI Calculator',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(

          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            ismale=true;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 70,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text('MALE',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ismale ?Colors.grey.shade900:Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            ismale=false;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 70,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text('FEMALE',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: !ismale ?Colors.grey.shade900:Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${hight.round()}',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Slider(value: hight,
                            min: 80,
                            max: 220,
                            onChanged: (value){
                              setState(() {
                                hight=value;
                              });
                              print(value.round());
                            })
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey
                    ),
                  ),
                )
            ),
            Expanded(
                child:Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                   children: [
                     Expanded(
                       child: Container(
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('AGE',
                               style: TextStyle(
                                   fontSize: 25,
                                   fontWeight: FontWeight.bold
                               ),),
                             Text(
                               '$age',
                               style: TextStyle(
                                 fontSize: 40,
                                 fontWeight: FontWeight.w900,
                               ),
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 FloatingActionButton(
                                   onPressed: (){
                                     setState(() {
                                       age--;
                                     });
                                   },
                                   heroTag: 'age-',
                                   child: Icon(Icons.remove),
                                   mini: true,
                                 ),
                                 FloatingActionButton(
                                   heroTag: 'age+',
                                     onPressed: (){
                                       setState(() {
                                         age++;
                                       });
                                     },
                                   child: Icon(Icons.add),
                                   mini: true,
                                 )
                               ],
                             )
                           ],
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 20,
                     ),
                     Expanded(
                       child: Container(
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.grey),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Weight',
                               style: TextStyle(
                                   fontSize: 25,
                                   fontWeight: FontWeight.bold
                               ),),
                             Text(
                               '$weight',
                               style: TextStyle(
                                 fontSize: 40,
                                 fontWeight: FontWeight.w900,
                               ),
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 FloatingActionButton(
                                   onPressed: (){
                                     setState(() {
                                       weight--;
                                     });
                                   },
                                   child: Icon(Icons.remove),
                                   mini: true,
                                   heroTag: 'w-',
                                 ),
                                 FloatingActionButton(
                                   heroTag: 'W+',
                                   onPressed: (){
                                     setState(() {
                                       weight++;
                                     });
                                   },
                                   child: Icon(Icons.add),
                                   mini: true,
                                 )
                               ],
                             )
                           ],
                         ),
                       ),
                     )
                   ],
                  ),
                ) ),
            Container(
              width: double.infinity,
              color: Colors.grey,
              child: MaterialButton(
                onPressed: (){
                  var result=weight/pow(hight/100,2);

                  Navigator.push(context,
                    MaterialPageRoute(
                    builder: (context) => BmiResult(
                        age: age,
                        ismale: ismale,
                        result: result
                    ),
                  ),
                  );
                },
                height: 50,
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
