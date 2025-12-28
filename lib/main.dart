import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Removes the "Debug" banner from the top right
      title: 'Luxe Cars',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // Enables Material 3 design standards
      ),
      scrollBehavior:
          AppScrollBehavior(), // Custom scroll behavior for mouse dragging
      home: const HomeScreen(), // Sets the HomeScreen as the initial route
    );
  }
}

// Custom ScrollBehavior class to enable mouse dragging on web and desktop
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind
        .mouse, // Allows scrolling with a mouse (crucial for testing on emulators)
  };
}
