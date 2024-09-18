import 'dart:convert';

Directions directionsFromJson(String str) =>
    Directions.fromJson(json.decode(str));

String directionsToJson(Directions data) => json.encode(data.toJson());

class Directions {
  final List<Route>? routes;
  final String? uuid;

  Directions({
    this.routes,
    this.uuid,
  });

  factory Directions.fromJson(Map<String, dynamic> json) => Directions(
        routes: json["routes"] == null
            ? []
            : List<Route>.from(json["routes"]!.map((x) => Route.fromJson(x))),
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "routes": routes == null
            ? []
            : List<dynamic>.from(routes!.map((x) => x.toJson())),
        "uuid": uuid,
      };
}

class Route {
  final double? duration;
  final double? distance;
  final String? geometry;

  Route({
    this.duration,
    this.distance,
    this.geometry,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "distance": distance,
        "geometry": geometry,
      };
}
