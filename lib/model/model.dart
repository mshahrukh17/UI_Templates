class Place {
  final String imageUrl;
  final String placeName;
  final String placeDescription;
  final String location;

  Place({
    required this.imageUrl,
    required this.placeName,
    required this.placeDescription,
    required this.location,
  });
}

class FamousPlaces{
  final String countryName;

  FamousPlaces({
    required this.countryName
  });
}
