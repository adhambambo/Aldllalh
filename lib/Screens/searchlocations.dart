import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyPlacesScreen extends StatefulWidget {
  @override
  _NearbyPlacesScreenState createState() => _NearbyPlacesScreenState();
}

class _NearbyPlacesScreenState extends State<NearbyPlacesScreen> {
  late List<DocumentSnapshot> _nearbyPlaces = [];
  late Position _currentPosition;
  late DocumentSnapshot _selectedPlace;
  late bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
      });
      _getNearbyPlaces();
    } catch (e) {
      print('Error getting current location: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _getNearbyPlaces() async {
    List<String> collections = [
      'مصانع/مصانع ملابس/مصانع ملابس العاشر من رمضان',
      'مصانع/مصانع ملابس/مصانع ملابس شبابي ورجالي',
      'مصانع/مصانع ملابس/مصانع تصنيع للغير',
      'مصانع/مصانع ملابس/مصانع جينز',
      'مصانع/مصانع ملابس/مصانع داخلي ولانجيري',
      'مصانع/مصانع ملابس/مصانع طرح ومكملات حجاب',
      'مصانع/مصانع ملابس/مصانع عبايات كرداسة',
      'مصانع/مصانع ملابس/مصانع ملابس اطفال',
      'مصانع/مصانع ملابس/مصانع ملابس جسر السويس',
      'مصانع/مصانع ملابس/مصانع ملابس عبايات واسدالات',
      'مصانع/مصانع ملابس/مصانع ملابس كاجوال حريمي',
      'مصانع/مصانع ملابس/مصانع ملابس مدينة العبور',
      'مصانع/مصانع ملابس/مصانع ملابس هوم ويير حريمي',
      'مصانع/تريكو/تريكو',
      'مصانع/تريكو/مصانع اجا المنصورة',
      'مصانع/تريكو/مصانع طنامل',
      'مصانع/مستلزمات انتاج احذية/مستلزمات انتاج احذية',
      'مصانع/مستلزمات انتاج ملابس/اكسسوارات ملابس الجراج جسرالسويس',
      'مصانع/مستلزمات انتاج ملابس/اكسسوارات ملابس حارة المزين الموسكي',
      'مصانع/مستلزمات انتاج ملابس/اكسسوارات ملابس شارع 18',
      'مصانع/مستلزمات انتاج ملابس/كبس استرس وترانسفير',
      'مصانع/مستلزمات انتاج ملابس/مصانع سوست وشماعات واكياس',
      'مصانع/مستلزمات انتاج ملابس/مطابع',
      'مصانع/مستلزمات انتاج ملابس/مكن والات',
      // اللي فوق سليم
      'مصانع/مفروشات ووبريات/اقمشة تنجيد',
      'مصانع/مفروشات ووبريات/بطاطين ودفايات',
      'مصانع/مفروشات ووبريات/ستائر',
      'مصانع/مفروشات ووبريات/فوط وملايات سرير والحفه',
      //
      'مكاتب/مكاتب ملابس/مكاتب جينز',
      'مكاتب/مكاتب ملابس/مكاتب داخلي ولانجيري',
      'مكاتب/مكاتب ملابس/مكاتب ملابس اطفال',
      'مكاتب/مكاتب ملابس/مكاتب ملابس الترعة البولاقية',
      'مكاتب/مكاتب ملابس/مكاتب ملابس العتبة والموسكي والغورية',
      'مكاتب/مكاتب ملابس/مكاتب ملابس النزهة الجديده',
      'مكاتب/مكاتب ملابس/مكاتب ملابس جاهزة',
      'مكاتب/مكاتب ملابس/مكاتب ملابس شبابي ورجالي',
      'مكاتب/مكاتب ملابس/مكاتب ملابس عبايات واسدالات',
      'مكاتب/مكاتب ملابس/مكاتب ملابس عمارات البترول',
      'مكاتب/مكاتب ملابس/مكاتب ملابس عمارات رامو',
      'مكاتب/مكاتب ملابس/مكاتب ملابس كاجوال حريمي',
      'مكاتب/مكاتب ملابس/مكاتب ملابس كاجوال روكسي',
      'مكاتب/مكاتب ملابس/مكاتب ملابس مول الشوازليه وصيدناوي والقدس',
      'مكاتب/مكاتب ملابس/مكاتب ملابس هوم ويير حريمي',
      'مكاتب/مكاتب ملابس/مكاتب ملابس وسط البلد',
      'مكاتب/مكاتب احذية وشنط/مستوردين ومكاتب احذية وشنط',
      'مكاتب/مكاتب احذية وشنط/مكاتب احذية وشنط النزهة الجديده',
      'مكاتب/مكاتب احذية وشنط/مكاتب احذية وشنط باب الشعرية',
      'مكاتب/تجار اقمشة/اخري',
      'مكاتب/تجار اقمشة/اقمشة الازهر والغوريه',
      'مكاتب/تجار اقمشة/اقمشة المطرية',
      'مكاتب/تجار اقمشة/اقمشة شارع 18 جسر السويس',
      'مكاتب/تجار اقمشة/اقمشة وكالة البلح',
      'محلات/محلات/محلات احذية',
      'محلات/محلات/محلات جينز',
      'محلات/محلات/محلات حريمي كاجوال',
      'محلات/محلات/محلات عبايات واسدالات',
      'محلات/محلات/محلات لانجيري',
      'محلات/محلات/محلات مستحضرات تجميل',
      'محلات/محلات/محلات ملابس اطفال',
      'محلات/محلات/محلات ملابس حريمي بيتي',
      'محلات/محلات/محلات ملابس شبابي ورجالي',
      //الي جاي ده سليم
      "كولكشن/كولكشن/اجهزة منزلية",
      "كولكشن/كولكشن/ادوات منزلية",
      'كولكشن/كولكشن/اكسسوارات حريمي',
      'كولكشن/كولكشن/العاب اطفال',
      'كولكشن/كولكشن/شركات شحن',
      'كولكشن/كولكشن/مستحضرات تجميل',
      'كولكشن/كولكشن/موبايلات',
      'مصانع/مصانع احذية وشنط/مصانع احذية خفيفه',
      'مصانع/مصانع احذية وشنط/مصانع احذية شعبي',
      'مصانع/مصانع احذية وشنط/مصانع احذية كوتشي',
      'مصانع/مصانع احذية وشنط/مصانع احذية لوكس حريمي',
      'مصانع/مصانع احذية وشنط/مصانع احذية لوكس رجالي',
      'مصانع/مصانع احذية وشنط/مصانع حزام',
      'مصانع/مصانع احذية وشنط/مصانع شنط',
    ];

    List<DocumentSnapshot> nearbyPlaces = [];
    bool placesFound = false;
    int currentIndex = 0;
    void showNextPlace() {
      setState(() {
        // التأكد من أن المكان التالي متاح
        if (currentIndex < _nearbyPlaces.length - 1) {
          currentIndex++; // زيادة فهرس المكان الحالي لعرض المكان التالي
        } else {
          // إعادة المؤشر للبداية في حالة الوصول إلى المكان الأخير
          currentIndex = 0;
        }
      });
    }

    for (String collection in collections) {
      var placesSnapshot =
          await FirebaseFirestore.instance.collection(collection).get();
      for (String collection in collections) {
        var placesSnapshot =
            await FirebaseFirestore.instance.collection(collection).get();

        for (var place in placesSnapshot.docs) {
          try {
            if (place.data().containsKey('location') &&
                place.data()['location'] != null &&
                place.data()['location'] != "") {
              GeoPoint location = _convertToGeoPoint(place['location']);
              double distance = Geolocator.distanceBetween(
                _currentPosition.latitude,
                _currentPosition.longitude,
                location.latitude,
                location.longitude,
              );
              if (distance <= 5000) {
                setState(() {
                  _nearbyPlaces.add(place);
                  placesFound =
                      true; // تعيين قيمة المتغير للإشارة إلى العثور على أماكن
                });
                return; // انتهاء البحث بعد العثور على المكان الأول
              }
            }
          } catch (e) {
            print('Error processing place: $e');
          }
        }
      }
    }
    setState(() {
      _nearbyPlaces = nearbyPlaces;
      _isLoading = false;

      // قم بترتيب الأماكن حسب المسافة
      _nearbyPlaces.sort((a, b) {
        double distanceA = _calculateDistance(a);
        double distanceB = _calculateDistance(b);
        return distanceA.compareTo(distanceB);
      });
    });
  }

  GeoPoint _convertToGeoPoint(String locationString) {
    List<String> parts = locationString.split(',');
    double latitude = double.parse(parts[0]);
    double longitude = double.parse(parts[1]);
    return GeoPoint(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _nearbyPlaces.isEmpty
          ? Center(
              child: Text(
                'لا توجد أماكن بالقرب منك',
                style: TextStyle(fontSize: 20),
              ),
            )
          : PageView.builder(
              itemCount: _nearbyPlaces.length,
              itemBuilder: (context, index) {
                var place = _nearbyPlaces[index];
                GeoPoint location = _convertToGeoPoint(place['location']);
                double distance = Geolocator.distanceBetween(
                      _currentPosition.latitude,
                      _currentPosition.longitude,
                      location.latitude,
                      location.longitude,
                    ) /
                    1000; // تحويل المسافة من أمتار إلى كيلومترات
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPlace = place;
                    });
                    Get.to(() => SEARCHINFO(factoryData: {
                          'text': _selectedPlace['text'],
                          'image1': _selectedPlace['image1'],
                          'image2': _selectedPlace['image2'],
                          'image3': _selectedPlace['image3'],
                          'image4': _selectedPlace['image4'],
                        }));
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: place['image'] != null
                                  ? Image.network(
                                      place['image'],
                                      width: 120, // تحديد العرض المناسب للصورة
                                      height: 120, // تحديد الطول المناسب للصورة
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child; // إذا تم تحميل الصورة بنجاح، عرض الصورة
                                        } else {
                                          // إذا كان التحميل مستمرًا، عرض رمز التحميل هنا
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        }
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/logo0.jpg',
                                          width:
                                              120, // تحديد العرض المناسب للصورة
                                          height: 120,
                                        ); // تحديد الصورة الافتراضية
                                      },
                                    )
                                  : Image.asset(
                                      'assets/logo0.jpg', // الصورة البديلة من ال assets
                                      width: 120, // تحديد العرض المناسب للصورة
                                      height: 120, // تحديد الطول المناسب للصورة
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            place['name'],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            place['address'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'المسافة التقريبية: ${distance.toStringAsFixed(2)} كم',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 4),
                          InkWell(
                            onTap: () {
                              _openGoogleMaps(place['location']);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on, // اسم الأيقونة للموقع
                                  color: Colors.grey, // لون الأيقونة
                                  size: 16, // حجم الأيقونة
                                ),
                                SizedBox(width: 5), // تباعد بين الأيقونة والنص
                                Text(
                                  'اضغط لعرض الموقع علي الخريطة', // الموقع الجغرافي
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }

  void _openGoogleMaps(String location) async {
    // تستخدم location لإنشاء الرابط
    String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(location)}';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  double _calculateDistance(DocumentSnapshot place) {
    GeoPoint location = _convertToGeoPoint(place['location']);
    double distance = Geolocator.distanceBetween(
      _currentPosition.latitude,
      _currentPosition.longitude,
      location.latitude,
      location.longitude,
    );
    return distance;
  }
}

class SEARCHINFO extends StatefulWidget {
  final Map<String, dynamic> factoryData;

  const SEARCHINFO({Key? key, required this.factoryData});

  @override
  State<SEARCHINFO> createState() => _SEARCHINFOState();
}

class _SEARCHINFOState extends State<SEARCHINFO> {
  final Stream<QuerySnapshot> kerdasainfo = FirebaseFirestore.instance
      .collection('مصانع/مصانع ملابس/مصانع ملابس العاشر من رمضان')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'معلومات عن المكان',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          // استخدم widget.factoryData للوصول إلى البيانات
          child: Column(
            children: [
              Text(widget.factoryData['text'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl),
              Center(
                child: Text(
                  'صور المكان:',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                      child: Image.network(
                        widget.factoryData['image1'],
                        fit: BoxFit.contain,
                        width: 600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                      child: Image.network(
                        widget.factoryData['image2'],
                        fit: BoxFit.contain,
                        width: 600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                      child: Image.network(
                        widget.factoryData['image3'],
                        fit: BoxFit.contain,
                        width: 600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      color: Colors.grey,
                      child: Image.network(
                        widget.factoryData['image4'],
                        fit: BoxFit.contain,
                        width: 600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
