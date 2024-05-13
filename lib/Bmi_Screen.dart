import 'dart:math';
import 'package:flutter/material.dart';
import 'Result.dart';
class Bmi_Screen extends StatefulWidget {
  const Bmi_Screen({super.key});
  @override
  State<Bmi_Screen> createState() => _Bmi_ScreenState();
}
class _Bmi_ScreenState extends State<Bmi_Screen> {
  bool male =true;
  int heigh = 100;
  int waight = 50;
  int age = 20;
  late String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 14, 40),
      appBar: AppBar(title: Text("BMI CALCULATE"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
            child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                   child: InkWell(
                     onTap: (){
                       male = true;
                       setState(() {

                       });
                     },
                     child: Container(
                                      decoration: BoxDecoration(
                       color:male ? Colors.blue:Colors.grey,
                       borderRadius: BorderRadius.circular(10)
                                   ),
                                      child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                    Icon(
                                 Icons.male,
                                 size:100,
                               color: Colors.white),
                               Text("Male",
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 25,
                               ),
                               ),
                             ],),
                             ),
                   ),
        ),
        SizedBox(width:10),
        Expanded(
          child: InkWell(
            onTap: (){
              male = false;
              setState(() {

              });
            },
            child: Container(
                decoration: BoxDecoration(
                color: male ? Colors.grey:Colors.blue,
                borderRadius: BorderRadius.circular(10)
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    Icons.female,
                    size:100,
                    color: Colors.white),
                Text("Female",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),
                ),
              ],),
                    ),
          ),),
                ],
              ),),),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Hight",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        heigh.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(" Cm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      min:65,
                      max:230,
                      value: heigh.toDouble(),
                      onChanged: (value){
                        setState(() {
                          heigh = value.round();
                        });
                      },
                  ),
              ],) ,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),),
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child:Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                       Text("WIGHT",
                         style: TextStyle(
                             color: Colors.white,
                         fontSize: 22),
                       ),
                       Text(
                         waight.toString(),
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 30),
                       ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                   onPressed: (){
                                     setState(() {
                                       waight--;
                                     });
                                   },
                                   icon: Icon(Icons.remove)),
                              ),
                              SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        waight++;
                                      });
                                    },
                                    icon: Icon(Icons.add)),
                              ),
                          ],),
                      ],),
                    ),
                  )),
                  SizedBox(width:10),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22),
                          ),
                          Text(
                      age.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    icon: Icon(Icons.remove)),
                              ),
                              SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    icon: Icon(Icons.add)),
                              ),
                            ],),
                        ],),
                    ),
                  )),
                ],
              ) ,
            ),
            ),
            //Expanded(child: Container(),),
         MaterialButton(
          color: Colors.blue,
          height: 60,
          minWidth: double.infinity,
          onPressed: (){
            double bmi = waight / pow(heigh/ 100, 2);
            if(bmi.round() < 18){
              result = "Very than";
            }else if(bmi.round() > 18 && bmi.round() <25){
    result = "Normal";
    } else {
              result = "Very Fat";
    }
Navigator.of(context).push(MaterialPageRoute(builder: (context) => Result(male: male,heigh: heigh,
                 waight:waight,age: age, result: result,
            ),
            ));
          },
          child:Text("Calculate"),
        ),

          ],
        ),
      ),
    );
  }
}
