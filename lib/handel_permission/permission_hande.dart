import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taxiflutter/components/feedback/custom_SnackBar.dart';

class PermissionHande {
  Future<bool> handlePreciseLocation(BuildContext context) async {

    PermissionStatus status = await Permission.location.request();

    if (status.isDenied) {
      CustomSnackBar.show(context, 'Please allow location permission!');
      return false;
    }

    if (status.isPermanentlyDenied) {
      CustomSnackBar.show(
        context,
        'Location permission denied permanently. Enable from settings.',
      );
      openAppSettings();
      return false;
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CustomSnackBar.show(context, 'Please turn on location service');
      await Geolocator.openLocationSettings();
      return false;
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double latitude = position.latitude;
      double longitude = position.longitude;

      print('Lat: $latitude, Lng: $longitude');

      return true;
    } catch (e) {
      CustomSnackBar.show(context, 'Failed to get location');
      return false;
    }
  }
  Future<bool> handleCameraPermission(BuildContext context) async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please allow camera permission!'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }

    if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Camera permission permanently denied. Enable from settings.'),
          duration: Duration(seconds: 3),
        ),
      );
      openAppSettings();
      return false;
    }

    return false;
  }
}
