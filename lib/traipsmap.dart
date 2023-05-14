import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trips/colors.dart';

LatLng sourcelocation = const LatLng(0, 0);
LatLng destiationlocation = const LatLng(0, 0);
LatLng currentlocation = const LatLng(0, 0);

class TripsMap extends StatefulWidget {
  final Map srclocation;
  final Map deslocation;
  final Map curlocation;
  TripsMap(
      {super.key,
      required this.srclocation,
      required this.deslocation,
      required this.curlocation}) {
    sourcelocation = LatLng(srclocation['lat'], srclocation['long']);
    destiationlocation = LatLng(deslocation['lat'], deslocation['long']);
    currentlocation = LatLng(curlocation['lat'], curlocation['long']);
  }

  @override
  State<TripsMap> createState() => _TripsMapState();
}

class _TripsMapState extends State<TripsMap> {
  final String googleapikey = "AIzaSyBonq9QeCIgzqqvDxxMAcYUAMLQ0jkuGWM";

  static List<LatLng> polyLineCoordinates = [];
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleapikey,
        PointLatLng(sourcelocation.latitude, sourcelocation.longitude),
        PointLatLng(destiationlocation.latitude, destiationlocation.longitude));
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      setState(() {});
    }
  }

  void setCustomMarkerIcon() async {
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/start.png")
        .then((icon) {
      sourceIcon = icon;
    });
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/end.png")
        .then((icon) {
      destationIcon = icon;
    });
    await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/buslocation.png",
    ).then((icon) {
      currentIcon = icon;
    });
  }

  @override
  void initState() {
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  void dispose() {
    polyLineCoordinates.clear();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: currentlocation, zoom: 10),
        polylines: {
          Polyline(
              polylineId: const PolylineId("route"),
              points: polyLineCoordinates,
              color: AppColor.firstColor,
              width: 4)
        },
        markers: {
          Marker(
              markerId: const MarkerId("current "),
              position: currentlocation,
              icon: currentIcon),
          Marker(
              markerId: const MarkerId("source"),
              position: sourcelocation,
              icon: sourceIcon),
          Marker(
              markerId: const MarkerId("destiation"),
              position: destiationlocation,
              icon: destationIcon)
        },
      ),
    );
  }
}
