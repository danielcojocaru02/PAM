import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/center.dart';  // Import the model

abstract class CenterState {}

class CenterInitial extends CenterState {}

class CenterLoading extends CenterState {}

class CenterLoaded extends CenterState {
  final List<MedicalCenter> centers;

  CenterLoaded(this.centers); // Constructor now accepts a list of MedicalCenter objects
}

class CenterError extends CenterState {
  final String message;

  CenterError(this.message);
}

class CenterCubit extends Cubit<CenterState> {
  CenterCubit() : super(CenterInitial());

  Future<void> fetchCentersFromJson() async {
    emit(CenterLoading());
    try {
      // Load the JSON file from assets
      String jsonString = await rootBundle.loadString('assets/doctors.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Access 'nearby_centers' and parse each center into a MedicalCenter object
      List<MedicalCenter> centers = (jsonData['nearby_centers'] as List)
          .map((data) => MedicalCenter.fromJson(data))
          .toList();

      emit(CenterLoaded(centers));  // Emit the loaded centers list
    } catch (e) {
      emit(CenterError("Failed to load centers: $e"));
    }
  }
}
