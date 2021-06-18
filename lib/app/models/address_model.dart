import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'parents/model.dart';

class Address extends Model {
  String id;
  String description;
  String address;
  double latitude;
  double longitude;
  bool isDefault;
  String userId;

  Address({this.id, this.description, this.address, this.latitude, this.longitude, this.isDefault, this.userId});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    address = json['address'];
    latitude = json['latitude']?.toDouble();
    longitude = json['longitude']?.toDouble();
    isDefault = json['isDefault'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['isDefault'] = this.isDefault;
    data['userId'] = this.userId;
    return data;
  }

  bool isUnknown() {
    return latitude == null || longitude == null;
  }

  LatLng getLatLng() {
    if (this.isUnknown()) {
      return LatLng(40.4, 7);
    } else {
      return LatLng(this.latitude, this.longitude);
    }
  }
}
