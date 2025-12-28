import 'package:flutter/material.dart';
import '../models/car.dart';
import 'details_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initial background color based on the first car
  Color _backgroundColor = carList[0].color;

  // Variable to track the current page index for the slider
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AnimatedContainer used for smooth background color transitions
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _backgroundColor,
              Colors.black, // Fade to black at the bottom
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- TOP BAR SECTION ---
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {},
                    ),
                    // Brand Logo Container
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                          0.2,
                        ), // Glassmorphism effect
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.directions_car,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "LUXE MOTORS",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // --- MAIN TITLE SECTION ---
              Text(
                "Find Your",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                "DREAM CAR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              // Decorative line under the title
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 20),
                height: 3,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // --- CAR SLIDER (PAGEVIEW) ---
              Expanded(
                child: PageView.builder(
                  itemCount: carList.length,
                  onPageChanged: (index) {
                    setState(() {
                      // Update background color and index on slide
                      _backgroundColor = carList[index].color;
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    Car car = carList[index];

                    return GestureDetector(
                      onTap: () {
                        // Navigate to Details Screen on tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(car: car),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Brand Name Badge
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white24),
                            ),
                            child: Text(
                              car.brand.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),

                          // Car Image with Hero Animation
                          Expanded(
                            child: Hero(
                              tag: car.imagePath,
                              child: Image.asset(
                                car.imagePath,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),

                          // Car Model and Price Information
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              children: [
                                Text(
                                  car.model,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '\$${car.price}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // --- DOT INDICATORS ---
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    carList.length,
                    (index) => buildDot(index, context),
                  ),
                ),
              ),

              // --- EXPLORE BUTTON ---
              GestureDetector(
                onTap: () {
                  // Navigate to Login/Welcome Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.explore, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        "Explore Cars",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build the animated pagination dots
  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      // Change width if the dot is active
      width: _currentIndex == index ? 25 : 6,
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.white : Colors.white38,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
