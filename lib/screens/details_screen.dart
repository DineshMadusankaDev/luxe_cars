import 'package:flutter/material.dart';
import '../models/car.dart';

class DetailsScreen extends StatelessWidget {
  final Car car;

  const DetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // AppBar with transparent background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          // ----------------------------------------
          // TOP SECTION: Car Image & Title
          // ----------------------------------------
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // Subtle gradient background matching the car color
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    car.color.withOpacity(0.3),
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hero Animation for seamless transition
                  Hero(
                    tag: car.imagePath,
                    child: Image.asset(
                      car.imagePath,
                      height: 220,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Car Brand
                  Text(
                    car.brand.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 2,
                      fontSize: 16,
                    ),
                  ),

                  // Car Model
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      car.model,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ----------------------------------------
          // BOTTOM SECTION: Specs & Actions
          // ----------------------------------------
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Specifications Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSpecCard("0-100 km/h", "3.5s"),
                      _buildSpecCard("Top Speed", "250 km/h"),
                      _buildSpecCard("Engine", "V8 Turbo"),
                    ],
                  ),
                  SizedBox(height: 25),

                  // Description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Experience the ultimate luxury with the ${car.brand} ${car.model}. A perfect combination of high performance and comfort.",
                    style: TextStyle(
                      color: Colors.white54,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),

                  Spacer(),

                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Booking Feature coming soon!"),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: car.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        "Book Test Drive",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build specification cards
  Widget _buildSpecCard(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }
}
