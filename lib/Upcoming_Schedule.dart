import 'package:flutter/material.dart';
class UpcomingSchedule extends StatefulWidget {
  const UpcomingSchedule({super.key});
  @override
  State<UpcomingSchedule> createState() => _UpcomingScheduleState();
}
class _UpcomingScheduleState extends State<UpcomingSchedule> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    Text("About Doctor",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    ),
          SizedBox(height: 15),
          Container(
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
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  ListTile(
                    title: Text("Dr:Asmaa",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    subtitle:Text("Therapist"),
                    trailing: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/doctor1.jpg"),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15),
              child:Divider(
                  thickness: 1,
                height: 20,
              ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        Row(children: [
                          Icon(Icons.calendar_month,
                            color:Colors.black54,
                          ),
                          SizedBox(width:5),
                          Text("22/2/2024",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],),

                      ],),
                      Row(
                        children: [
                          Icon(Icons.access_time_filled,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Text("10:30 Am",
                            style: TextStyle(color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                  Row(children: [
                 Container(
                   padding:EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     color: Colors.green,
                     shape: BoxShape.circle,
                   ),
                 ),
                    SizedBox(width: 5),
                    Text("Confirmed",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                    ),
                  ],),

                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xfff4f6fa),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("Cancel",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xff7165d6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("Reschedule",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text("About Doctor",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          Container(
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
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  ListTile(
                    title: Text("Dr:Aber",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:Text("Therapist"),
                    trailing: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/doctor2.jpg"),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                    child:Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        Row(children: [
                          Icon(Icons.calendar_month,
                            color:Colors.black54,
                          ),
                          SizedBox(width:5),
                          Text("22/2/2024",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],),

                      ],),
                      Row(
                        children: [
                          Icon(Icons.access_time_filled,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Text("11:00 pm",
                            style: TextStyle(color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Container(
                          padding:EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("Confirmed",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],),

                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xfff4f6fa),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("Cancel",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xff7165d6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("Reschedule",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text("About Doctor",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15),
          Container(
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
              width: MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  ListTile(
                    title: Text("Dr:Adham",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:Text("Therapist"),
                    trailing: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/doctor3.jpg"),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                    child:Divider(
                      thickness: 1,
                      height: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        Row(children: [
                          Icon(Icons.calendar_month,
                            color:Colors.black54,
                          ),
                          SizedBox(width:5),
                          Text("22/2/2024",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],),

                      ],),
                      Row(
                        children: [
                          Icon(Icons.access_time_filled,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 5),
                          Text("5:30 pm",
                            style: TextStyle(color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Container(
                          padding:EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("Confirmed",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],),

                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xfff4f6fa),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("Cancel",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xff7165d6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("Reschedule",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
