import 'package:flutter/material.dart';
import 'package:st_lawrence_navigation/help_page.dart';
import 'package:st_lawrence_navigation/login_page.dart';
import 'package:st_lawrence_navigation/start_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'St. Lawrence Navigation',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),

      initialRoute: "startPage",

      routes: {
        "startPage": (context) => const StartPage(),
        "loginPage": (context) => const LoginPage(),
        "mainPage": (context) => const MyHomePage(),
        "helpPage": (context) => const HelpPage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ✅ Hardcoded JSON data for markers
  final List<Map<String, dynamic>> markers = [
    {
      "roomNumber": 11230,
      "roomName": "WASHROOM",
      "description": "Gender neutral, accessible",
      "x": 45,
      "y": 75
    },
    {
      "roomNumber": 11240,
      "roomName": "WASHROOM",
      "description": "Women",
      "x": 235,
      "y": 47
    },
    {
      "roomNumber": 11250,
      "roomName": "OFFICE",
      "description": "IT admin",
      "x": 134,
      "y": 356
    },
    {
      "roomNumber": 11280,
      "roomName": "OFFICE",
      "description": "Kelly Portieous",
      "x": 234,
      "y": 246
    },
    {
      "roomNumber": 11290,
      "roomName": "CLASSROOM",
      "description": "Computer lab",
      "x": 235,
      "y": 243
    }
  ];

  // Original map dimensions (in pixels)
  final double originalMapWidth = 666; // Set your PNG width
  final double originalMapHeight = 725; // Set your PNG height

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'St. Lawrence Navigation',
            style: TextStyle(fontSize: 20.0, fontFamily: "IBM", color: Cor.white),
          ),
        ),
        leading: Icon(Icons.account_circle_rounded, color: Cor.red, size: 42),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "helpPage");
        },
        backgroundColor: Cor.gray,
        child: Icon(Icons.question_mark_rounded, color: Cor.red),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double scaleX = constraints.maxWidth / originalMapWidth;
          double scaleY = constraints.maxHeight / originalMapHeight;

          return InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Stack(
              children: [
                Image.asset('assets/college_map.png'),
                ...markers.map((marker) {
                  double posX = marker['x'] * scaleX;
                  double posY = marker['y'] * scaleY;

                  return Positioned(
                    left: posX,
                    top: posY,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: Cor.black,
                            title: Text(marker['roomName'], style: TextStyle(fontFamily: "IBM", color: Cor.red),),
                            content: Text(
                              'Room: ${marker['roomNumber']}\nDescription: ${marker['description']}',
                              style: TextStyle(fontFamily: "IBM", color: Cor.white)
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close', style: TextStyle(fontFamily: "IBM", color: Cor.red)),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.red, // Invisible clickable area
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
