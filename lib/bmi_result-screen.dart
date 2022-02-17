import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {

  final double result;
  final bool ismale;
  final int age;
  late final String res;

  BmiResult({
   required this.result,
   required this.age,
   required this.ismale,
}){
    if(result<17){
      res='UNDERWEIGHT';
    }
    else if(result<25 && result>17){
      res='Average';
    }
    else{
      res='OverWeight';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'BMI Result',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender :${ismale? 'Male':'Female'}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
            Text(
              'Result : $res ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
            Text(
              'Age : $age',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
          ],
        ),
      ),
    );
  }
}
