import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class Personal_Care extends StatefulWidget {
  const Personal_Care({super.key});

  @override
  State<Personal_Care> createState() => _Personal_CareState();
}

class _Personal_CareState extends State<Personal_Care> {
  // Initializing variables for the fetched data

  String temperature = "wait";
  String bloodpressure = "wait";
  Map<String, dynamic>? deviceData;

  @override
  void initState() {
    super.initState();
    // Fetch device data when the widget is initialized
    fetchDeviceByMacAddress("101010");
  }

  Future<void> fetchDeviceByMacAddress(String macaddress) async {
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
      if (data['data']['deviceByMacaddress'] != null) {
        setState(() {
          deviceData = data['data']['deviceByMacaddress'];

          temperature = deviceData!['temperature'];
          bloodpressure = deviceData!['bloodpressure'];
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No device found with that MAC address')),
        );
      }
    } else {
      print('Error fetching device data: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 14, 40),
      appBar: AppBar(
        title: Text("Personal Care"),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.health_and_safety_rounded,
                            size: 100,
                            color: Colors.white,
                          ),
                          Text(
                            "Temperature",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "$temperature°",
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.medical_services,
                            size: 100,
                            color: Colors.white,
                          ),
                          Text(
                            "Blood Pressure",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "$bloodpressure mmHg",
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
