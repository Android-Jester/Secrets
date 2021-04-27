import 'package:flutter/material.dart';
import 'package:secrets/UI/Components/rounded_button.dart';
import 'package:secrets/UI/Screens/Decode%20Screen/decode_screen.dart';
import 'package:secrets/UI/Screens/Encode%20Screen/encode_screen.dart';

class SplashScreen extends StatelessWidget {
  static String id = "splash_screen";
  @override
  Widget build(BuildContext context) {
    const kButtonTextSize = 40.0;

    return Scaffold(
      backgroundColor: Color(0xff013220),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  RoundedButton(
                      color: EncodeScreen.enCodeBackground,
                      width: MediaQuery.of(context).size.width,
                      fontSize: kButtonTextSize,
                      height: MediaQuery.of(context).size.height / 2,
                      label: "Encode",
                      press: () {
                        Navigator.pushNamed(context, EncodeScreen.id);
                      },
                      margin: null),
                  SizedBox(
                    height: 10.0,
                  ),
                  RoundedButton(
                      color: DecodeScreen.deCodeBackground,
                      width: MediaQuery.of(context).size.width,
                      fontSize: kButtonTextSize,
                      height: MediaQuery.of(context).size.height / 2 - 10,
                      label: "Decode",
                      press: () {
                        Navigator.pushNamed(context, DecodeScreen.id);
                      },
                      margin: null)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
