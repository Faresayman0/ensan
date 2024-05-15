import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String device;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.device,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      device: json['device'],
    );
  }
}

Future<void> fetchDeviceByMacAddress(
    BuildContext context, String macaddress) async {
  final String query = '''
    query DeviceByMacaddress {
      deviceByMacaddress(macaddress: "$macaddress") {
        id
        macaddress
        longitude
        latitude
        temperature
        bloodpressure
        created_at
        updated_at
      }
    }
  ''';

  final response = await http.post(
    Uri.parse('https://myapis.whf.bz/graphql'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({"query": query}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Response Data: $data');
    if (data.containsKey('data') &&
        data['data'] != null &&
        data['data']['deviceByMacaddress'] != null) {
      final deviceData = data['data']['deviceByMacaddress'];
      print('Device Data: $deviceData');
      print('Latitude: ${deviceData['latitude']}');
      print('Longitude: ${deviceData['longitude']}');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      launchGoogleMaps(context, deviceData['latitude'],
                          deviceData['longitude']);
                    },
                    child: Text('Open in Google Maps'),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('No Data Found'),
            content: Text('No device data found for this user.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  } else {
    print('Error fetching device data: ${response.body}');
  }
}

class Home_Screen extends StatefulWidget {
  final String userName;
  final User currentUser;

  const Home_Screen({
    Key? key,
    required this.userName,
    required this.currentUser,
  }) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  List<String> symptoms = [
    "Temperature",
    "Snuffle",
    "Fever",
    "Cough",
    "Cold",
    "High blood pressure",
    "Increased heart rate",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello ${widget.userName}",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("images/lined heart.png"),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createVisitOption(
                  "Clinic Visit",
                  "Call The Hospital",
                  Icons.add,
                ),
                createVisitOption(
                  "Home Visit",
                  "Call The Doctor",
                  Icons.home_filled,
                ),
              ],
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "What Are Your Symptoms?",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: symptoms.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Color(0xfff4f6fa),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        symptoms[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                fetchDeviceByMacAddress(context, widget.currentUser.device);
              },
              child: Center(child: Text("Show Location")),
            ),
          ],
        ),
      ),
    );
  }

  Widget createVisitOption(String title, String subtitle, IconData icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xff7165d6),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Color(0xff7165d6),
                size: 35,
              ),
            ),
            SizedBox(height: 30),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void launchGoogleMaps(
    BuildContext context, String latitude, String longitude) async {
  final url =
      'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
  print('Attempting to launch Google Maps with URL: $url');
  try {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
      print('Could not launch $url');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
    print('Error: $e');
  }
}
