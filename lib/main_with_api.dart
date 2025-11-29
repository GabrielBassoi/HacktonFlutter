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
  List<Map<String, dynamic>> markers = [];
  bool isLoading = true;

  // Replace with your API URL
  final String apiUrl = 'https://your-api-url.com/markers';

  // Original map dimensions (in pixels)
  final double originalMapWidth = 666; // Set your PNG width
  final double originalMapHeight = 725; // Set your PNG height

  @override
  void initState() {
    super.initState();
    fetchMarkers().then((data) {
      print(data);
      setState(() {
        markers = data;
        isLoading = false;
      });
    }).catchError((error) {
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    });
  }



  Future<List<Map<String, dynamic>>> fetchMarkers() async {
    final url = Uri.parse('http://klns.ca/auth/getRooms');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer 0be1dabe78dfe6cad003929b18667028',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Decode JSON response
      print(response.body);
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load markers: ${response.statusCode}');
    }
  }


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
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.red))
          : LayoutBuilder(
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
                            title: Text(marker['roomName']),
                            content: Text(
                              'Room: ${marker['roomNumber']}\n${marker['description']}',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.transparent, // Invisible clickable area
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