import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/doctor_cubit.dart'; // Import the DoctorCubit
import 'bloc/banner_cubit.dart'; // Import the BannerCubit
import 'bloc/category_cubit.dart'; // Import the CategoryBloc
import 'top_container.dart'; // Import other necessary widgets
import 'categories_container.dart';
import 'centers_container.dart';
import 'doctors_container.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DoctorCubit()..fetchDoctorsFromJson()),
          BlocProvider(create: (_) => BannerCubit()..fetchBannerFromJson()),
          BlocProvider(create: (_) => CategoryCubit()..fetchCategoriesFromJson()), // Trigger the event here
        ],
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doc'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopContainer(),
              CategoriesContainer(), // This will now listen to the CategoryBloc
              CentersContainer(),
              DoctorsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
