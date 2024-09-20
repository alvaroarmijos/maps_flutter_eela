import 'dart:convert';

Places placesFromJson(String str) => Places.fromJson(json.decode(str));

String placesToJson(Places data) => json.encode(data.toJson());

class Places {
  final List<Place>? features;

  Places({
    this.features,
  });

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        features: json["features"] == null
            ? []
            : List<Place>.from(json["features"]!.map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
      };
}

class Place {
  final String? text;
  final String? placeName;
  final List<double>? center;

  Place({
    this.text,
    this.placeName,
    this.center,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        text: json["text"],
        placeName: json["place_name"],
        center: json["center"] == null
            ? []
            : List<double>.from(json["center"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "place_name": placeName,
        "center":
            center == null ? [] : List<dynamic>.from(center!.map((x) => x)),
      };
}
