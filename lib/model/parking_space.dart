class ParkingSpace {
  final GeoLocation geoLocation;
  final Location location;
  final String name;
  final String imageUrl;
  final double pricePerHour;

  ParkingSpace({
    required this.geoLocation,
    required this.location,
    required this.name,
    required this.pricePerHour,
    required this.imageUrl,
  });

  factory ParkingSpace.fromMap(Map<String, dynamic> data) {
    return ParkingSpace(
      geoLocation: GeoLocation.fromMap(data['geo_location']),
      location: Location.fromMap(data['location']),
      name: data['name'],
      pricePerHour: data['price_per_hour'],
      imageUrl: data['image_url'],
    );
  }
}

class GeoLocation {
  final double latitude;
  final double longitude;

  GeoLocation({required this.latitude, required this.longitude});

  factory GeoLocation.fromMap(Map<String, double> data) {
    return GeoLocation(
      latitude: data['latitude']!,
      longitude: data['longitude']!,
    );
  }
}

class Location {
  final String city;
  final String street;
  final String suburb;

  Location({required this.city, required this.street, required this.suburb});

  factory Location.fromMap(Map<String, String> data) {
    return Location(
      city: data['city']!,
      street: data['street']!,
      suburb: data['suburb']!,
    );
  }
}
