import 'package:spxce/model/parking_space.dart';

abstract class SpaceRepository {
  Future<List<ParkingSpace>> getNearbySpaces({
    required double latitude,
    required double longitude,
  });
}
