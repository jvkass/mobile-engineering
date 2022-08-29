import 'package:bike_finder/entities/geometry.dart';
import 'package:bike_finder/entities/properties.dart';

class Station {
  int? id;
  Geometry? geometry;
  String? type;
  Properties? properties;

  Station({this.id, this.geometry, this.type, this.properties});

  Station.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    type = json['type'];
    properties = json['properties'] != null ? Properties.fromJson(json['properties']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['type'] = type;
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    return data;
  }
}
