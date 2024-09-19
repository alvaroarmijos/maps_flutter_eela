import 'dart:convert';

DirectionsDto directionsDtoFromJson(String str) =>
    DirectionsDto.fromJson(json.decode(str));

String directionsDtoToJson(DirectionsDto data) => json.encode(data.toJson());

class DirectionsDto {
  final List<RouteDto>? routes;
  final String? uuid;

  DirectionsDto({
    this.routes,
    this.uuid,
  });

  factory DirectionsDto.fromJson(Map<String, dynamic> json) => DirectionsDto(
        routes: json["routes"] == null
            ? []
            : List<RouteDto>.from(
                json["routes"]!.map((x) => RouteDto.fromJson(x))),
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "routes": routes == null
            ? []
            : List<dynamic>.from(routes!.map((x) => x.toJson())),
        "uuid": uuid,
      };
}

class RouteDto {
  final double? duration;
  final double? distance;
  final String? geometry;

  RouteDto({
    this.duration,
    this.distance,
    this.geometry,
  });

  factory RouteDto.fromJson(Map<String, dynamic> json) => RouteDto(
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
