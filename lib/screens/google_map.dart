import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:study_test/services/data_search.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

const appKey = 'AIzaSyA1FbEV43z0-GqNmFTGrEoh0jWwoEQaR-4';

class GoogleMapTest extends StatefulWidget {
  @override
  _GoogleMapTestState createState() => _GoogleMapTestState();
}

class _GoogleMapTestState extends State<GoogleMapTest> {
  ScrollController sc = ScrollController();
  Position? currentPosition;
  CameraPosition _kGooglePlex = CameraPosition(target: LatLng(0, 0));
  GoogleMapController? gmc;
  Set<Marker> mapMarkerPoints = {};
  StreamSubscription<Position>? positionStream;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = appKey;

  @override
  void initState() {
    super.initState();
    updateUI();
    changeMarker();
    _getPolyline();
  }

  @override
  void dispose() {
    positionStream!.cancel();
    super.dispose();
  }

  void changeMarker() {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      LatLng newLatLng = LatLng(position.latitude, position.longitude);
      print(newLatLng);
      mapMarkerPoints.remove(Marker(markerId: MarkerId('1')));
      mapMarkerPoints.add(Marker(markerId: MarkerId('1'), position: newLatLng));
      gmc?.animateCamera(CameraUpdate.newLatLng(newLatLng));
      setState(() {});
    });
  }

  void updateUI() async {
    await getCurrentLocation();
    if (currentPosition != null) {
      setState(() {
        _kGooglePlex = CameraPosition(
          target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
          zoom: 10.4746,
        );
        mapMarkerPoints = {
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(currentPosition!.latitude, currentPosition!.longitude),
            infoWindow: InfoWindow(title: 'My Location'),
          )
        };
      });
    }
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await getLocationPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      var position = await Geolocator.getCurrentPosition();
      setState(() {
        currentPosition = position;
      });
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude);
      print('Lat: ${currentPosition!.latitude}');
      print('Lon: ${currentPosition!.longitude}');
      print(placeMarks[0].country);
    }
  }

  Future<LocationPermission> getLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    if (serviceEnabled) {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
    } else {
      permission = LocationPermission.denied;
      AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.SCALE,
        headerAnimationLoop: false,
        body: Text('Service is not enabled!'),
        padding: EdgeInsets.all(20),
      )..show();
    }
    return permission;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(30.5879, 31.4813),
      PointLatLng(30.4985, 31.6533),
      travelMode: TravelMode.driving,
    );
    polylineCoordinates.add(LatLng(30.5879, 31.4813));
    polylineCoordinates.add(LatLng(30.4985, 31.6533));
    // if (result.points.isNotEmpty) {
    //   result.points.forEach((PointLatLng point) {
    //     polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    //   });
    // }
    _addPolyLine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Test'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              // height: 450,
              child: _kGooglePlex == CameraPosition(target: LatLng(0, 0))
                  ? Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      markers: mapMarkerPoints,
                      polylines: Set<Polyline>.of(polylines.values),
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      myLocationEnabled: true,
                      tiltGesturesEnabled: true,
                      compassEnabled: true,
                      scrollGesturesEnabled: true,
                      zoomGesturesEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        gmc = controller;
                      },
                      onTap: (latLng) {
                        mapMarkerPoints.remove(Marker(markerId: MarkerId('1')));
                        mapMarkerPoints.add(Marker(markerId: MarkerId('1'), position: latLng));
                        setState(() {});
                      },
                    ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Get Location'),
            onPressed: () {
              updateUI();
              gmc!.animateCamera(
                CameraUpdate.newLatLng(
                  LatLng(currentPosition!.latitude, currentPosition!.longitude),
                ),
              );
            },
          ),
          ElevatedButton(
            child: Text('Go to Makka'),
            onPressed: () async {
              gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(21.606365, 39.818179)));
              Marker marker = Marker(
                markerId: MarkerId('1'),
                // visible: false,
                position: LatLng(21.606365, 39.818179),
                // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
                // icon: await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'images/avatar.png'),
                draggable: true,
                onDragEnd: (latLng) {
                  print(latLng);
                },
                infoWindow: InfoWindow(
                  title: 'Makka',
                  onTap: () {
                    print('info tap');
                  },
                ),
                onTap: () {
                  print('marker tap');
                },
              );

              setState(() {
                mapMarkerPoints = {marker};
              });
            },
          ),
          SizedBox(height: 50),
        ],
      ),
      // body: ListView(
      //   controller: sc,
      //   children: [
      //     ElevatedButton(
      //       onPressed: () {
      //         // sc.jumpTo(sc.position.maxScrollExtent);
      //         sc.animateTo(sc.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn);
      //       },
      //       child: Text('Jump to bottom'),
      //     ),
      //     ...List.generate(
      //       10,
      //       (i) => Container(
      //         height: 100,
      //         width: double.infinity,
      //         margin: EdgeInsets.all(10),
      //         color: i.isEven ? Colors.green : Colors.red,
      //         child: Text('Container ${i + 1}', style: TextStyle(color: Colors.white, fontSize: 20)),
      //         alignment: Alignment.center,
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         // sc.jumpTo(sc.position.minScrollExtent);
      //         sc.animateTo(sc.position.minScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn);
      //       },
      //       child: Text('Jump to top'),
      //     ),
      //   ],
      // ),
    );
  }
}
