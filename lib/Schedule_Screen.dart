import 'package:flutter/material.dart';
import 'package:test/Completed_Schedule.dart';
import 'Canceld_Schedule.dart';
import 'Upcoming_Schedule.dart';
class Schedule_Screen extends StatefulWidget {
  const Schedule_Screen({super.key});

  @override
  State<Schedule_Screen> createState() => _Schedule_ScreenState();
}

class _Schedule_ScreenState extends State<Schedule_Screen> {
  int _buttonIndex=0;
  final _schedulewidgets=[
    //upcoming wight
    UpcomingSchedule(),
    //completed wight
    Completed_Schedule(),
    //canceld wight
    Canceld_Schedule(),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Padding(padding: EdgeInsets.symmetric(horizontal: 15),
      child:Text("Schedule",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      ) ,
      ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xfff4f6fa),
              borderRadius: BorderRadius.circular(10),
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                      _buttonIndex = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      decoration: BoxDecoration(
                        color:_buttonIndex == 0 ?Color(0xff7165d6) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text("Upcoming",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                          color: _buttonIndex == 0
                              ? Colors.white
                              : Colors.black38
                      ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        _buttonIndex = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      decoration: BoxDecoration(
                        color:_buttonIndex == 1 ?Color(0xff7165d6) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Completed",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                            color: _buttonIndex == 1
                                ? Colors.white
                                : Colors.black38
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.zero),
                  InkWell(
                    onTap: (){
                      setState(() {
                        _buttonIndex = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      decoration: BoxDecoration(
                        color:_buttonIndex == 2 ?Color(0xff7165d6) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Canceld",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: _buttonIndex == 2
                              ? Colors.white
                              : Colors.black38),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _schedulewidgets[_buttonIndex],
          ],
        ),
      ),
    );
  }
}