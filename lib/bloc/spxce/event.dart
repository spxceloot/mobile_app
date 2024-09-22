import 'package:equatable/equatable.dart';

class SpxceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNearby extends SpxceEvent {
  final double latitude;
  final double longitude;

  FetchNearby({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
