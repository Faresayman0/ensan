import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Home_Screen.dart';
import 'SignUp_Screen.dart';
import 'package:test/widgets/Navbar_Roots.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passToggle = true;

  Future<void> login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final String query = '''
    mutation LoginUser {
      login(email: "$email", password: "$password") {
        token
        user {
          id
          name
          email
          device
        }
      }
    }
    ''';

    try {
      final response = await http.post(
        Uri.parse('https://myapis.whf.bz/graphql'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"query": query}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Raw response: ${response.body}');  // طباعة الرد الخام

        if (data.containsKey('errors') && data['errors'] != null) {
          handleErrors(data['errors'][0]['message']);
        } else if (data['data'] != null && data['data']['login'] != null && data['data']['login']['user'] != null) {
          final userData = data['data']['login']['user'];
          print('User Data: $userData');

          final String? name = userData['name'];
          final String? email = userData['email'];
          final String? device = userData['device'];
          final String? id = userData['id'];
          final String? token = data['data']['login']['token'];

          print('Name: $name, Email: $email, Device: $device');

          if (name != null && email != null && device != null && id != null && token != null) {
            final User currentUser = User(id: id, name: name, email: email, device: device,);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Navbar_Roots(currentUser: currentUser, userName: name)),
            );
          } else {
            showError('No valid user information available.');
          }
        } else {
          showError('Login failed, please try again.');
        }
      } else {
        showError('Login failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      showError('An error occurred: $e');
    }
  }

  void handleErrors(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $errorMessage'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

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
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextField(
                  controller: passwordController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                        passToggle ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Material(
                  color: Color(0xff7165d6),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: login,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        "Log In",
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Any Account? ",
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
                        MaterialPageRoute(builder: (context) => SignUp_Screen()),
                      );
                    },
                    child: Text(
                      "Create Account",
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
