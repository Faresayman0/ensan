import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/auth/Login_Screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Home_Screen.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({super.key});
  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  //GlobalKey<FormState> FormState =GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController device = TextEditingController();
  TextEditingController Password = TextEditingController();
  Future<void> register(
      String name, String email, String device, String password) async {
    final String mutation = '''
  mutation RegisterUser {
    register(input: {
      name: "$name",
      email: "$email",
      password: "$password",
      device: "$device"
    }) {
      user {
        id
        name
        email
      }
      token
    }
  }
  ''';

    final response = await http.post(
      Uri.parse('https://myapis.whf.bz/graphql'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "query": mutation,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['errors'] != null) {
        print('GraphQL mutation error: ${data['errors']}');
        // تحقق من رسالة الخطأ لتحديد ما إذا كان البريد الإلكتروني مكرر
        String errorMessage = data['errors'][0]['extensions']['debugMessage'];
        if (errorMessage.contains('Duplicate entry')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Email already exists, please use another email.'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${data['errors'][0]['message']}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        print('User: ${data['data']['register']['user']}');
        print('Token: ${data['data']['register']['token']}');

        // نقل المستخدم إلى صفحة تسجيل الدخول مع رسالة نجاح
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login_Screen()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration successful, please log in.'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      print('Error fetching from GraphQL endpoint: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed, please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset("images/doctors.png"),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextField(
                  controller: device,
                  decoration: InputDecoration(
                    labelText: "device",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: TextField(
                  controller: Password,
                  obscureText: passToggle ? true : false,
                  decoration: InputDecoration(
                    labelText: "Password ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (passToggle == true) {
                          passToggle = false;
                        } else {
                          passToggle = true;
                        }
                        setState(() {});
                      },
                      child: passToggle
                          ? Icon(CupertinoIcons.eye_slash_fill)
                          : Icon(CupertinoIcons.eye_fill),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Color(0xff7165d6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        if (name.text.isNotEmpty &&
                            email.text.isNotEmpty &&
                            device.text.isNotEmpty &&
                            Password.text.isNotEmpty) {
                          register(name.text, email.text, device.text,
                              Password.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill all the fields'),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: Center(
                          child: Text(
                            "Creat Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login_Screen(),
                          ));
                    },
                    child: Text(
                      "Log  In",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7165d6),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
