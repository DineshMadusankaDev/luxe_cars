import 'package:flutter/material.dart';
import '../models/car.dart';

class DetailsScreen extends StatelessWidget {
  final Car car;

  const DetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // මුළු පිටුවම කළු පාටයි
      // උඩින්ම තියෙන AppBar එක (Back Button & Heart Icon)
      appBar: AppBar(
        backgroundColor: Colors.transparent, // විනිවිද පෙනෙනවා
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
          // 1. කාර් එකේ පින්තූරය සහ නම (උඩ කොටස)
          // ----------------------------------------
          Expanded(
            flex: 5, // ඉඩ ප්‍රමාණය
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // කාර් එකේ පාටට අනුව පොඩි Gradient එකක් (Background Glow)
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    car.color.withOpacity(0.3), // කාර් එකේ පාට
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hero Animation (Home එකේ ඉඳන් කාර් එක පාවෙලා එනවා)
                  Hero(
                    tag: car.imagePath,
                    child: Image.asset(
                      car.imagePath,
                      height: 220,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Brand Name (TOYOTA)
                  Text(
                    car.brand.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 2,
                      fontSize: 16,
                    ),
                  ),

                  // Model Name (Land Cruiser 300)
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
          // 2. විස්තර සහ Booking Button (යට කොටස)
          // ----------------------------------------
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.grey[900], // තද අළු පාට පසුබිමක්
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Specifications (වේගය, බලය වගේ දේවල් පෙන්නන පෙට්ටි)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSpecCard("0-100 km/h", "3.5s"),
                      _buildSpecCard("Top Speed", "250 km/h"),
                      _buildSpecCard("Engine", "V8 Turbo"),
                    ],
                  ),
                  SizedBox(height: 25),

                  // Description Title
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Description Text
                  Text(
                    "Experience the ultimate luxury with the ${car.brand} ${car.model}. A perfect combination of high performance and comfort.",
                    style: TextStyle(
                      color: Colors.white54,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),

                  Spacer(), // ඉතුරු ඉඩ ටික පල්ලෙහාට යවනවා
                  // Book Test Drive Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        // Booking function එක පස්සේ දාමු
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Booking Feature coming soon!"),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: car.color, // කාර් එකේ පාටින් බටන් එක
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

  // පොඩි කොටු (Specs Cards) හදන Function එක
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
