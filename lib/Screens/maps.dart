import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key, required this.onLocationChanged})
      : super(key: key);
  final LocationCallback onLocationChanged;

  @override
  State<MapSample> createState() => MapSampleState();
}

typedef LocationCallback = void Function(LatLng? location);

class MapSampleState extends State<MapSample> {
  late String locationData = '';
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  List<Marker> markers = [];
  LatLng selectedLocation = LatLng(0, 0);

  late LocationCallback onLocationChanged; // تحديث هنا

  static Position? position;
  static final CameraPosition _determineCurrentLocation = CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 16.4746,
  );

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.determineCurrentLocation().whenComplete(() {
      setState(() {});
    });
    setState(() {
      selectedLocation = LatLng(position!.latitude, position!.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  Widget buildMap() {
    return Scaffold(
      appBar: AppBar(
        title: Text('خرائط الدلاله'),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GoogleMap(
                zoomControlsEnabled: false,
                onTap: (LatLng latLng) {
                  print(latLng.latitude);
                  markers.add(Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(latLng.latitude, latLng.longitude)));
                  setState(() {
                    selectedLocation =
                        LatLng(latLng.latitude, latLng.longitude);
                  });
                  widget.onLocationChanged(selectedLocation); // تحديث هنا
                },
                markers: markers.toSet(),
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition: _determineCurrentLocation,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    if (selectedLocation != null) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: selectedLocation!,
        zoom: 16.4746,
      )));
    }
  }

//////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: Container(
                    child: CircularProgressIndicator(color: Colors.blue),
                  ),
                ),
          Positioned(
            bottom: 16.0,
            left: 5,
            right: 5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor, // لون الزر
              ),
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        CircularProgressIndicator(color: Colors.blue),
                        SizedBox(width: 16),
                        Text('جاري حفظ الموقع...'),
                      ],
                    ),
                    duration: Duration(seconds: 4),
                  ),
                );
                await _goToMyCurrentLocation;
                await _getCurrentLocation();
                Get.back();
              },
              child: Text(
                'حفظ الموقع',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ), // لون النص داخل الزر
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 5, 90),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () {
            _goToMyCurrentLocation();
          },
          child: Icon(Icons.place),
        ),
      ),
    );
  }
}

class LocationHelper {
  static Future<Position> determineCurrentLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

Future<void> _addDataToFirestores(String locations, String documentname) async {
  try {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users');
    await usersCollection.doc(documentname).set(
        {
          'location': locations,
          // يمكنك إضافة المزيد من الحقول إذا لزم الأمر
        },
        SetOptions(
            merge:
                true)); // استخدم SetOptions مع merge: true للدمج مع المستند الحالي إذا كان موجودًا بالفعل
    print('تمت إضافة البيانات إلى Firestore بنجاح!');
  } catch (e, stackTrace) {
    print('حدث خطأ أثناء إضافة البيانات إلى Firestore: $e');
    print('StackTrace: $stackTrace');
  }
}

Future<void> _getCurrentLocation() async {
  bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
  if (isLocationEnabled) {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    User? currentUser = FirebaseAuth.instance.currentUser;
    String documentName = currentUser?.email ??
        'default_email'; // استخدام عنوان البريد الإلكتروني كاسم المستند

    String locations = '${position.latitude},${position.longitude}';
    await _addDataToFirestores(locations, documentName);
  } else {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    User? currentUser = FirebaseAuth.instance.currentUser;
    String email = currentUser?.email ??
        'default_email'; // استخدام عنوان البريد الإلكتروني كاسم المستند

    String locations = '${position.latitude},${position.longitude}';
    await _addDataToFirestores(locations, email);
  }
}
