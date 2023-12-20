import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class ConsultCity {
  static Future<String> getCurrencyCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    String? city;
    if (placemarks[0].locality == '') {
      city = placemarks[0].subAdministrativeArea;
    } else if (placemarks[0].locality != '') {
      city = placemarks[0].locality;
    }

    return city ?? '';
  }
}
