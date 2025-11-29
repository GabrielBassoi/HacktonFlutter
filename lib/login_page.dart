import 'package:flutter/material.dart';

import 'const.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cor.black,

      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
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
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Login",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "IBM",
                        color: Cor.white,
                      )
                  ),
                  SizedBox(height: 32.0,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Cor.white,
                        fontFamily: "IBM",
                      ),
                      filled: true,
                      fillColor: Cor.gray,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(color: Cor.red, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(color: Cor.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(color: Cor.red, width: 1.5),
                      ),
                    ),
                    cursorColor: Cor.red,
                    cursorErrorColor: Cor.red,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Cor.white,
                      fontFamily: "IBM",
                    ),
                    buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
                  ),
                  SizedBox(height: 16,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Cor.red, width: 1.5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Cor.red, width: 1.5),
                      ),
                    ),
                    cursorColor: Cor.red,
                    cursorErrorColor: Cor.red,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Cor.white,
                      fontFamily: "IBM",
                    ),
                    buildCounter: (BuildContext context, {int? currentLength, int? maxLength, bool? isFocused}) => null,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
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
                        Navigator.pushReplacementNamed(context, "mainPage");
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
              ),
            )
          ],
        ),
      )
    );
  }
}
