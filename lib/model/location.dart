// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Location {
  final String latitude;
  final String longitude;
  final String country;
  final String locality;
  final String sublocality;
  Location({
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.locality,
    required this.sublocality,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
      'locality': locality,
      'sublocality': sublocality,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      country: map['country'] ?? '',
      locality: map['locality'] ?? '',
      sublocality: map['sublocality'] ?? '',
    );
  }

  
}
