import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewScreen/LandingScreen.dart';
import 'package:flutter_app/Screens/CameraScreen.dart';
import 'package:flutter_app/Screens/LoginScreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xF075E54),
        // accentColor: Color(0xFF12C7E)
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF12DC7E) // Your accent color
                ),
      ),
      //home: LandingScreen(),
      home: LoginScreen(),
    );
  }
}
