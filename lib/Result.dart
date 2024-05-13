import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final bool male ;
  final int heigh ;
  final int waight ;
  final int age ;
  final String result;
  const Result({
    Key? key,
    //super.key,
    required this.male,
    required this.heigh,
    required this.waight,
    required this.age,
    required this.result
  })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bmi"),
        centerTitle: true,
      ),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("Gender is :",
    style: TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    ),
    ),
      SizedBox(width:3),
      Text(
        male ? "Male" : "Female",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Age is :",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width:3),
          Text(
            age.toString(),
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Result is ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width:3),
          Text(
           result,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],),
    ],
    ),
    ),
    );
  }
}
