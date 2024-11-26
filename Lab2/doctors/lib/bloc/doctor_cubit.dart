import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/doctor.dart';

// Event states for BLoC
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final List<Doctor> doctors;

  DoctorLoaded(this.doctors);
}

class DoctorError extends DoctorState {
  final String message;

  DoctorError(this.message);
}

// Cubit to manage the doctor's data
class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  Future<void> fetchDoctorsFromJson() async {
    emit(DoctorLoading());
    try {
      // Load the JSON file from assets
      String jsonString = await rootBundle.loadString('assets/doctors.json');
      final List<dynamic> data = json.decode(jsonString)["doctors"];
      final List<Doctor> doctors = data.map((json) => Doctor.fromJson(json)).toList();

      emit(DoctorLoaded(doctors));
    } catch (e) {
      emit(DoctorError("Failed to load doctors: $e"));
    }
  }
}
