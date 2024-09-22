import 'package:spxce/model/parking_space.dart';
import 'package:spxce/repository/space_repository.dart';

class TestSpaceRepository implements SpaceRepository {
  List<ParkingSpace> dummySpxces = [
    ParkingSpace.fromMap(
      {
        'name': 'Rosebank Mall',
        'image_url': 'assets/images/parking1.jpg',
        'price_per_hour': 12.00,
        'geo_location': {
          'latitude': 26.1463,
          'longitude': 28.0417,
        },
        'location': {
          'street': '15A Cradock Ave',
          'suburb': 'Johannesburg',
          'city': 'Rosebank',
          'postal_code': '2196',
        },
      },
    ),
    ParkingSpace.fromMap(
      {
        'name': 'Menlyn Mall',
        'image_url': 'assets/images/parking2.jpg',
        'price_per_hour': 12.00,
        'geo_location': {
          'latitude': 25.7828,
          'longitude': 28.2748,
        },
        'location': {
          'street': 'Cnr. Atterbury Rd & Lois Ave',
          'suburb': 'Pretoria',
          'city': 'Menlo Park',
          'postal_code': '0063',
        },
      },
    ),
    ParkingSpace.fromMap(
      {
        'name': 'Menlyn Mall',
        'image_url': 'assets/images/parking3.jpg',
        'price_per_hour': 12.00,
        'geo_location': {
          'latitude': 25.7828,
          'longitude': 28.2748,
        },
        'location': {
          'street': 'Magwa Cres',
          'suburb': 'Midrand',
          'city': 'Waterval 5-Ir',
          'postal_code': '1686',
        },
      },
    )
  ];

  @override
  Future<List<ParkingSpace>> getNearbySpaces({
    required double latitude,
    required double longitude,
  }) async {
    return dummySpxces;
  }
}
