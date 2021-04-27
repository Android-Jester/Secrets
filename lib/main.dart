import 'package:flutter/material.dart';

import 'UI/Screens/Decode Screen/decode_result.dart';
import 'UI/Screens/Decode Screen/decode_screen.dart';
import 'UI/Screens/Encode Screen/encode_result.dart';
import 'UI/Screens/Encode Screen/encode_screen.dart';
import 'UI/Screens/Splash Screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static bool isEncode = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white.withOpacity(0.70))),
        appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0.0),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        EncodeScreen.id: (context) => EncodeScreen(),
        DecodeScreen.id: (context) => DecodeScreen(),
        EncodeResult.id: (context) => EncodeResult(),
        DecodeResult.id: (context) => DecodeResult(),
      },
    );
  }
}
