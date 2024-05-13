import 'package:flutter/material.dart';

import 'Chat_Screen.dart';
class Messages_Screen extends StatefulWidget {

  @override
  State<Messages_Screen> createState() => _Messages_ScreenState();
}
class _Messages_ScreenState extends State<Messages_Screen> {
  List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    SizedBox(height: 40),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Messages",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          SizedBox(height: 30),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            Container(
              width: 300,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:15),
                child:TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ) ,
              ),
            ),
                  Icon(
                    Icons.search,
                    color: Color(0xff7165d6),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Active Now",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder:(context,index){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                 BoxShadow(
                   color: Colors.black12,
                   spreadRadius: 2,
                   blurRadius: 10,
                 ),
                ],
              ),
              child: Stack(
                textDirection: TextDirection.rtl,
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "images/${imgs[index]}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(3),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Recent Chat",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context,index){
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(),));
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "images/doctor1.jpg",
              ),
            ),
            title: Text("Dr.Noha",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            subtitle: Text("Last seen at 11.30 Am",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text("8:30 Pm",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

          );
  },),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(),));

                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "images/doctor2.jpg",
                  ),
                ),
                title: Text("Dr.Nada",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Last seen at 11.30 Am",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text("4:30 Am",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),

              );
            },),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(),));

                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "images/doctor3.jpg",
                  ),
                ),
                title: Text("Dr.Hossam",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Last seen at 12:00 Am",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text("1:00 Pm",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),

              );
            },),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(),));

                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "images/doctor4.jpg",
                  ),
                ),
                title: Text("Dr.Ali",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Last seen at 5:00 Am",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text("12:30 Am",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
                ),
              );
            },),
      ],),
    );
  }
}