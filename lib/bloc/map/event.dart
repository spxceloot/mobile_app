import 'package:equatable/equatable.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateLocation extends MapEvent {
  final CameraOptions cameraOptions;

  UpdateLocation(this.cameraOptions);

  @override
  List<Object?> get props => [cameraOptions];
}
