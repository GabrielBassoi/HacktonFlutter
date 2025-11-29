
import 'package:flutter/material.dart';
import 'const.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  bool _showAnswer = false; // Controls visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'Help Page',
            style: TextStyle(fontSize: 20.0, fontFamily: "IBM", color: Cor.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Cor.red, size: 32),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Ask any questions: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "IBM",
                color: Cor.white,
              ),
            ),
            SizedBox(height: 32.0),
            TextField(
              decoration: InputDecoration(
                hintText: "Type here...",
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Cor.white,
                  fontFamily: "IBM",
                ),
                filled: true,
                fillColor: Cor.gray,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Cor.red, width: 1.5),
                ),
              ),
              cursorColor: Cor.red,
              style: TextStyle(
                fontSize: 20.0,
                color: Cor.white,
                fontFamily: "IBM",
              ),
              buildCounter: (BuildContext context,
                  {int? currentLength, int? maxLength, bool? isFocused}) =>
              null,
            ),
            SizedBox(height: 16.0),

            // ✅ Conditional Container
            if (_showAnswer)
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Cor.gray,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "Here is an answer to your question!",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "IBM",
                    color: Cor.white,
                  ),
                ),
              ),

            Expanded(child: Container()),

            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Cor.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _showAnswer = !_showAnswer; // Toggle visibility
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        _showAnswer ? "Hide Answer" : "Show Answer",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "IBM",
                          color: Cor.white,
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

