import 'package:flutter/material.dart';

class Car {
  final String brand;
  final String model;
  final double price;
  final String imagePath;
  final String horsepower;
  final String description;
  final Color color;

  Car({
    required this.brand,
    required this.model,
    required this.price,
    required this.imagePath,
    required this.horsepower,
    required this.description,
    required this.color,
  });
}

List<Car> carList = [
  Car(
    brand: "Toyota",
    model: 'Land Cruiser 300',
    price: 150000,
    imagePath: 'assets/car01.png',
    horsepower: '304 HP',
    description:
        'The King of  Off-road. Luxury meets power with a 3.3L Twin Turbo V6 engine',
    color: Colors.black,
  ),
  Car(
    brand: 'BMW',
    model: '7 Series',
    price: 120000,
    imagePath: 'assets/car02.png',
    horsepower: '600 HP',
    description:
        'Ultimate driving machine with V12 power and executive luxury.',
    color: Colors.blueGrey.shade900,
  ),
  Car(
    brand: 'Ford',
    model: 'F-150 Raptor',
    price: 80000,
    imagePath: 'assets/car03.png',
    horsepower: '450 HP',
    description:
        'A high-performance off-road pickup truck built for any terrain.',
    color: Colors.brown.shade800,
  ),
  Car(
    brand: 'Lamborghini',
    model: 'Sian Roadster',
    price: 3700000,
    imagePath: 'assets/car04.png',
    horsepower: '819 HP',
    description:
        'Hybrid super sports car. The most powerful Lamborghini ever produced.',
    color: Colors.orange.shade900,
  ),
];
