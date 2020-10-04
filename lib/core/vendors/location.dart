import 'package:location/location.dart';

class LocationVendor {
  Location _location = new Location();

  void requestPermission() {
    this._location.requestPermission();
  }

  Future<LatLng> getCurrentLatLng() async {
    final data = await this._location.getLocation();
    return LatLng(lat: data.latitude, lng: data.longitude);
  }
}

class LatLng {
  double lat;
  double lng;
  LatLng({
    this.lat,
    this.lng,
  });
}
