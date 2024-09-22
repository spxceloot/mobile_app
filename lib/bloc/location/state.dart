import 'package:equatable/equatable.dart';
import 'package:spxce/model/parking_space.dart';

class LocationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class GeoLocationState extends LocationState {
  final GeoLocation location;
  GeoLocationState(this.location);

  @override
  List<Object?> get props => [location];
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);

  @override
  List<Object?> get props => [message];
}
