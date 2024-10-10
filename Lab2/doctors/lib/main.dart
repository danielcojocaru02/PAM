import 'package:doctors/centers_container.dart';
import 'package:doctors/doctors_container.dart';
import 'package:flutter/material.dart';
import 'top_container.dart'; // Import the TopContainer widget
import 'categories_container.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Doc'),
        ),
        body: Container(
          padding: const EdgeInsets.all(12.0), // Set padding here
          height: 1000,
          child: const SingleChildScrollView(
          child: Column(
            children: [
               TopContainer(), // Use the TopContainer
               CategoriesContainer(),
               CentersContainer(),
               DoctorsContainer(),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
