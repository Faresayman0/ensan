import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appointment_Screen extends StatefulWidget {
  const appointment_Screen({super.key});

  @override
  State<appointment_Screen> createState() => _appointment_ScreenState();
}

class _appointment_ScreenState extends State<appointment_Screen> {
  List imgs=[
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];
  List syntix = [
    "Dr.Doha",
    "Dr.Nada",
    "Dr.Hossam",
    "Dr.Ali",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7165d6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.more_vert,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("images/doctors.png"),
                        ),
                        SizedBox(height: 15),
                        Text("Doctors",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Therapist",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xff9f97e2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.call,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xff9f97e2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                              CupertinoIcons.chat_bubble_text_fill,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height:20),
            Container(
              height: MediaQuery.of(context).size.height/1.5,
              width: double.infinity,
              padding: EdgeInsets.only(
              top:20,
                left: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
Text("About Doctor",
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  ),
),
                  SizedBox(height: 5),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Reviews",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.star,color: Colors.amber),
                      Text("4.9",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      SizedBox(width: 5),
                      Text("124",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff7165d5),
                        ),
                      ),
                      Spacer(),
                      TextButton(onPressed: (){}, child: Text("See all",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff7165d5),
                      ),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 160,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index ){
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width/1.4,
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage("images/${imgs[index]}"),
                              ),
                              title: Text(syntix[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              subtitle: Text("1 day ago"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,
                                  color: Colors.amber,
                                  ),
                                  Text("4,9",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                maxLines: 2,
                              overflow:TextOverflow.ellipsis,
                                "Many thanks to Dr. Dear.He is a great and professional doctor",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  ),
                  ),
                  SizedBox(height: 30),
                  Text("Location",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xfff0eefa),
                        shape: BoxShape.circle,
                      ),
                    child: Icon(Icons.location_on,
                    color: Color(0xff7165d6),
                    size: 30,
              ),
                         ),
                    title: Text("New Cairo,Medical Center",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    subtitle: Text("address line of the medical center,"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Consultation Price",
            style: TextStyle(
              color: Colors.black54,
            ),
            ),
            Text("\$100",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            ),
          ],
        ),
        SizedBox(height: 10),
            InkWell(
              onTap:(){} ,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
             decoration: BoxDecoration(
               color: Color(0xff7165d6),
               borderRadius: BorderRadius.circular(10),
             ),
                child:Center(
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ) ,
              ),

            )
          ],
        ),
      ),
    );
  }
}