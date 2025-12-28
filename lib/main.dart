import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'screens/home_screen.dart'; // අපේ අලුත් Screen එක Import කරන්න

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // අර Debug පීත්ත පටිය අයින් කරන්න
      title: 'Luxe Cars',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      scrollBehavior: AppScrollBehavior(),
      home: const HomeScreen(), // මෙන්න මෙතනට අපේ අලුත් Screen එක දෙන්න
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse, // Mouse එකට අදින්න දෙන්නේ මෙතනින්
  };
}
