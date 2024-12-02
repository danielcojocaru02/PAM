// banner_cubit.dart
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final String imageUrl;

  BannerLoaded(this.imageUrl);  // Constructor accepts the image URL
}

class BannerError extends BannerState {
  final String message;

  BannerError(this.message);
}

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

Future<void> fetchBannerFromJson() async {
  emit(BannerLoading());
  try {
    // Load the JSON file from assets
    String jsonString = await rootBundle.loadString('assets/doctors.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    
    // Access 'banner_image' as a list and extract the 'image' field
    final bannerUrl = jsonData['banner_image'] != null && jsonData['banner_image'].isNotEmpty
        ? jsonData['banner_image'][0]['image']
        : null;

    if (bannerUrl == null || bannerUrl.isEmpty) {
      emit(BannerError("Banner image URL is missing or invalid."));
    } else {
      emit(BannerLoaded(bannerUrl));  // Emit the BannerLoaded state with imageUrl
    }
  } catch (e) {
    emit(BannerError("Failed to load banner: $e"));
  }
}

}
