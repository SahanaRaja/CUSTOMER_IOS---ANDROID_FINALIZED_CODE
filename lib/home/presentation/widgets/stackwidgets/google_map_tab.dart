// added by bhava
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../../../core/app_constants.dart';

class GoogleMapScreen extends StatefulWidget {
  final double actualHeight;
  final String latitude;
  final String longitude;
  const GoogleMapScreen(
      {Key? key,
      required this.actualHeight,
      required this.latitude,
      required this.longitude})
      : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

// Starting point latitude
double originLatitude = 0.00;
// Starting point longitude
double originLongitude = 0.00;

// Destination latitude
// double destLatitude = 6.849660;
// // Destination Longitude
// double destLongitude = 3.648190;
// Markers to show points on the map
Map<MarkerId, Marker> markers = {};

PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late final GoogleMapController _googleMapController;

  // final Completer<GoogleMapController> _controller = Completer();
  // Configure map position and zoom
  // static final CameraPosition _kGooglePlex = CameraPosition(
  late CameraPosition _kGooglePlex;
  @override
  void initState() {
    originLatitude = double.parse(widget.latitude);
    originLongitude = double.parse(widget.longitude);

    _kGooglePlex = CameraPosition(
      target: LatLng(originLatitude, originLongitude),
      zoom: 9.20,
    );
    // getLatLong();
    // setState(() {}); // add by Mani
    print('originLatitude ------> $originLatitude');
    print('originLongitude ------> $originLongitude');
    super.initState();
  }

  // getLatLong() async {
  //   SharedPreferences prefs1 = await SharedPreferences.getInstance();

  //   originLatitude = await Prefs.originalLatitute;
  //   originLongitude = await Prefs.orginalLongitude;
  //   // setState(() {}); // add by Mani
  //   print('originLatitude ------> $originLatitude');
  //   print('originLongitude ------> $originLongitude');
  // }


  @override
  void didChangeDependencies() {
    _addMarker(
      LatLng(originLatitude, originLongitude),
      "origin",
      BitmapDescriptor.defaultMarker,
    );

    // Add destination marker
    _addMarker(
      LatLng(double.parse(widget.latitude), double.parse(widget.longitude)),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );
    _getPolyline();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: GetPlatform.isAndroid
          ? (widget.actualHeight - 40) / 18.1
          : (widget.actualHeight - MediaQuery.of(context).padding.bottom) /
              17.9 *
              10.5,
      // height: (widget.actualHeight - MediaQuery.of(context).padding.bottom) -
      //     (widget.actualHeight / 16.5) * 2 -
      //     88,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
        initialCameraPosition: _kGooglePlex,
        // initialCameraPosition:
        //     // CameraPosition(target: LatLng(widget.latitude, widget.longitude)),
        //     _kGooglePlex,
        myLocationEnabled: false,
        tiltGesturesEnabled: false,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        markers: Set<Marker>.of(markers.values),
        polylines: Set<Polyline>.of(polylines.values),
        onMapCreated: (controller) => _googleMapController = controller,
      ),
    );
  }

  // This method will add markers to the map based on the LatLng position
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);

    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);

    markers[markerId] = marker;
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLEMAPAPI,
      PointLatLng(originLatitude, originLongitude),
      PointLatLng(
          double.parse(widget.latitude), double.parse(widget.longitude)),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      print("check");
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        points: polylineCoordinates,
        width: 5,
        color: Colors.blueAccent);
    polylines[id] = polyline;
    setState(() {});
  }
}
