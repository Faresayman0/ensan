import 'package:test/auth/Login_Screen.dart';
import 'package:test/auth/SignUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:test/widgets/Navbar_Roots.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            
            SizedBox(height: 50),
            Padding(padding: EdgeInsets.all(20),
             child: CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage("images/doctor0.png"),
              ),
              //child: Image.asset("images/doctors.png"),  صوره تانيه
            ),
            SizedBox(height: 50),
            Text("We Care",
              style: TextStyle(
                color: Color(0xff7165d6),
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text("Cheek Your Health",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Color(0xff7165d6),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>Login_Screen(),
                      ));
                    },
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                      child: Text("Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Color(0xff7165d6),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>SignUp_Screen(),
                      ));
                    },
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                      child: Text("Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}