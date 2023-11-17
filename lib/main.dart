import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewScreen/LandingScreen.dart';
import 'package:flutter_app/Screens/CameraScreen.dart';
import 'package:flutter_app/Screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
      home: const LandingScreen(),
      // home: LoginScreen(),
    );
  }
}
