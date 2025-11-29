import 'package:flutter/material.dart';

import 'const.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Cor.black,
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "St. Lawrence",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "IBM",
                      color: Cor.white,
                    ),
                  ),
                  Text(
                    "Navigation",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "IBM",
                      color: Cor.red,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16.0,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Cor.red,
                    size: 50.0
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: "Navigate ",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Cor.white,
                            fontFamily: "IBM",
                          ),
                          children: [
                            TextSpan(text: "easier ", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: "through")
                          ]
                      )
                  ),
                  Text(
                    "St. Lawrence College",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "IBM",
                      color: Cor.red,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: Cor.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          )
                      ),

                      onPressed: (){
                        Navigator.pushReplacementNamed(context, "loginPage");
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text("Login",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "IBM",
                            color: Cor.white,
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
