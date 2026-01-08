import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> handlePreciseLocation() async {
  var status = await Permission.location.request();

  if (status.isGranted) {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

     var latitude = position.latitude;
     var longitude = position.longitude;
  }
  else if (status.isDenied) {

  }
  else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}
