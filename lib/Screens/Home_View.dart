import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/AdmobADS/AdsInterstitialAd.dart';
import 'package:eldalala/Collections/Apelliance.dart';
import 'package:eldalala/Collections/BeautyCentre.dart';
import 'package:eldalala/Collections/Bedding_furnishings.dart';
import 'package:eldalala/Collections/Chandelliear.dart';
import 'package:eldalala/Collections/Clothing_factories.dart';
import 'package:eldalala/Collections/Clothing_offices.dart';
import 'package:eldalala/Collections/Clothing_production_supplies.dart';
import 'package:eldalala/Collections/Electronics.dart';
import 'package:eldalala/Collections/Emarketings.dart';
import 'package:eldalala/Collections/GOLDS.dart';
import 'package:eldalala/Collections/Houseware.dart';
import 'package:eldalala/Collections/Investement.dart';
import 'package:eldalala/Collections/Laps.dart';
import 'package:eldalala/Collections/Shoes_production_supplies.dart';
import 'package:eldalala/Collections/Textile_merchants.dart';
import 'package:eldalala/Collections/Used.dart';
import 'package:eldalala/Collections/cafe.dart';
import 'package:eldalala/Collections/cosemetics.dart';
import 'package:eldalala/Collections/officesWshops.dart';
import 'package:eldalala/Collections/othersss.dart';
import 'package:eldalala/Collections/packageExport.dart';
import 'package:eldalala/Collections/phones.dart';
import 'package:eldalala/Collections/printings.dart';
import 'package:eldalala/Collections/restaurant.dart';
import 'package:eldalala/Collections/shipping.dart';
import 'package:eldalala/Collections/shoes_bags_factories.dart';
import 'package:eldalala/Collections/shoes_bags_offices.dart';
import 'package:eldalala/Collections/shops.dart';
import 'package:eldalala/Collections/socks.dart';
import 'package:eldalala/Collections/toys.dart';
import 'package:eldalala/Collections/trico.dart';
import 'package:eldalala/Collections/women_accessories.dart';
import 'package:eldalala/Collections/wrapping.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Cores/Custom_Text.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:eldalala/Models/Item_model.dart';
import 'package:eldalala/Screens/Exhibtions/HomeExhition.dart';
import 'package:eldalala/Screens/POPULARShops.dart';
import 'package:eldalala/Screens/banners.dart';
import 'package:eldalala/Screens/navbar.dart';
import 'package:eldalala/Screens/profle.dart';
import 'package:eldalala/Screens/searchlocations.dart';
import 'package:eldalala/Screens/splashthree.dart';
import 'package:eldalala/Screens/videoPlayer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {

  const HomeView({Key? key, });
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> topRatedStream =
      FirebaseFirestore.instance.collection('places/places/places').snapshots();


  int _currentIndex = 0;
  bool showMoreCategories = false;
  List<ItemModel> placesList = List<ItemModel>.empty();
  var fbm = FirebaseMessaging.instance;
  bool isLoading = true;

  List<Map<String, dynamic>> messages = [];
  late Future<DocumentSnapshot> _futureBanners2;
  late Future<DocumentSnapshot> _futureBanners3;
  late Future<DocumentSnapshot> _futureBanners4;
  late Future<DocumentSnapshot> _futureBanners5;
  late Future<DocumentSnapshot> _futureBanners6;







  void initState() {
    super.initState();
    fetchDataFromFirestore();
    fetchData();
   _futureBanners2 = FirebaseFirestore.instance.collection('banners').doc('banners2').get();
   _futureBanners3 = FirebaseFirestore.instance.collection('banners').doc('banners3').get();
   _futureBanners4 = FirebaseFirestore.instance.collection('banners').doc('banners4').get();
   _futureBanners5 = FirebaseFirestore.instance.collection('banners').doc('banners5').get();
   _futureBanners6 = FirebaseFirestore.instance.collection('banners').doc('banners6').get();
  



  }

  
  void fetchData() {
    firestore.collection('banners').snapshots().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs[0];
        setState(() {
          BannerImages.imageUrl1 = doc['banner1'];
          BannerImages.imageUrl2 = doc['banner2'];
          BannerImages.imageUrl3 = doc['banner3'];
          BannerImages.imageUrl4 = doc['banner4'];
          BannerImages.imageUrl1plus = doc['banner1plus'];
          BannerImages.imageUrl5 = doc['banner5'];
        });
      }
    });
  }

Future<void> fetchDataFromFirestore() async {
    try {
      List<ItemModel> tempItemsList = [];

      var collectionsToQuery = [
        'مصانع ملابس اطفال',
        'مصانع ملابس العاشر من رمضان',
        'مصانع عبايات كرداسة',
        'مصانع ملابس هوم ويير حريمي',
        'مصانع ملابس عبايات واسدالات',
        'مصانع ملابس كاجوال حريمي',
        'مصانع جينز',
        'مكاتب ملابس اطفال',
        'مكاتب ملابس هوم ويير حريمي',
        'مكاتب ملابس كاجوال حريمي',
        'مكاتب ملابس شبابي ورجالي',
        'مكاتب ملابس عبايات واسدالات',
        'مكاتب داخلي ولانجيري',
        'مكاتب ملابس النزهة الجديده',
        'مصانع احذية خفيفه',
        'مصانع احذية لوكس حريمي',
        "مصانع احذية شعبي",
        "مصانع احذية كوتشي",
        "مصانع احذية لوكس رجالي",
        "مصانع شنط",
        "مصانع حزام",
        'مستوردين ومكاتب احذية وشنط',
        "مكاتب احذية وشنط باب الشعرية",
        "مكاتب احذية وشنط النزهة الجديده",
        "اقمشة المطرية",
        "اقمشة وكالة البلح",
        'اقمشة الازهر والغوريه',
        'اقمشة شارع 18 جسر السويس',
        'تريكو',
        "مصانع اجا المنصورة",
        "مصانع طنامل",
        "اقمشة تنجيد",
        "فوط وملايات سرير والحفه",
        "مستلزمات انتاج احذية",
        'ستائر',
        'بطاطين ودفايات',
        'ادوات منزلية',
        'اكسسوارات حريمي',
        'محلات ملابس حريمي بيتي',
        "محلات ملابس اطفال",
        'محلات حريمي كاجوال',
        "محلات ملابس شبابي ورجالي",
        "محلات عبايات واسدالات",
        "محلات جينز",
        'محلات احذية',
        'محلات لانجيري',
        'محلات مستحضرات تجميل',
        'مصانع ملابس شبابي ورجالي',
        'مصانع داخلي ولانجيري',
        "مصانع طرح ومكملات حجاب",
        'مصانع ملابس جسر السويس',
        "مصانع ملابس مدينة العبور",
        "مصانع تصنيع للغير",
        "مكاتب جينز",
        "مكاتب ملابس عمارات رامو",
        "مكاتب ملابس عمارات البترول",
        "مكاتب ملابس مول الشوازليه وصيدناوي والقدس",
        "مكاتب ملابس العتبة والموسكي والغورية",
        "مكاتب ملابس النزهة الجديده",
        "مكاتب ملابس كاجوال روكسي",
        "مكاتب ملابس وسط البلد",
        "مكاتب ملابس الترعة البولاقية",
        "اكسسوارات ملابس الجراج جسرالسويس",
        "اكسسوارات ملابس حارة المزين الموسكي",
        "اكسسوارات ملابس شارع 18",
        "كبس استرس وترانسفير",
        "مصانع سوست وشماعات واكياس",
        "مطابع",
        "مكن والات",
        "مستحضرات تجميل",
        "العاب اطفال",
        "موبايلات",
        'شركات شحن داخلي ودولي',
        'شرابات',
        'مراكز تجميل',
        'كافيهات',
        'معامل تحاليل',
        'مطاعم',
        'مواد تغليف',
        'اجهزة منزليه',
        'الكترونيات',
        'اضاءة ونجف',
        'استثمار عقاري',
        'استوك وبواقي تصدير',
        'مستعمل',
        'شركات شحن داخلي ودولي',
        'مناديب دفع مقدم',
        'مستلزمات انتاج ملابس اخري',
        'مصانع احذية وشنط اخري',
        'مصانع ملابس اخري',
        'تجار اقمشة اخري',
        'مكاتب احذيه وشنط اخري',
        'مكاتب ملابس اخري',
        'محلات اخري',
        'شركات تسويق الكتروني',
        'مسوقات بالعمولة',
        "تجهيز محلات ومكاتب"
            'اخري',
            'مجوهرات ودهب صيني',
            "مصانع ملابس جاهزة",
            "مصانع ملابس جاهزة المحله الكبري",
      ];

      for (var collection in collectionsToQuery) {
        var querySnapshot = await _getCollectionGroupData(collection);
        if (querySnapshot != null) {
          tempItemsList.addAll(_mapQuerySnapshotToItemList(querySnapshot));
        }
      }

      // تحقق إذا كانت البيانات قد تغيرت بالفعل قبل استدعاء setState
      if (tempItemsList.isNotEmpty && mounted) {
        setState(() {
          placesList = tempItemsList;
          isLoading = false; // تعيين حالة التحميل إلى false
        });
      } else {
        print('No data to display.');
      }
    } catch (error) {
      print('Error occurred while fetching data: $error');
      if (mounted) {
        setState(() {
          isLoading = false; // تعيين حالة التحميل إلى false في حال حدوث خطأ
        });
      }
    }
  }

  Future<QuerySnapshot> _getCollectionGroupData(String collectionGroupName) async {
    return await FirebaseFirestore.instance.collectionGroup(collectionGroupName).get();
  }

  List<ItemModel> _mapQuerySnapshotToItemList(QuerySnapshot querySnapshot) {
    try {
      return querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        var placeName = data['name'] as String? ?? 'Default Value';

        return ItemModel(
          image: data['image'],
          placeName: placeName,
          address: data['address'],
          instagramCustomText: '',
          telegramCustomText: '',
          instagramLink: data['insta'],
          telegramLink: data['tele'],
          facebookCustomText: '',
          phoneCustomText: '',
          WhatsAppCustomText: '',
          locationCustomText: '',
          WhatsAppLink: data['whats'],
          location: data['location'],
          phoneNumber: data['phone'],
          facebookLink: data['facebook'],
          WhatsAppNumber: '',
          image1: data['image1'],
        );
      }).toList();
    } catch (e) {
      print('Error occurred while mapping query snapshot to item list: $e');
      return [];
    }
  }

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'مصانع ملابس',
      //'icon': Icons.factory,
      'image': 'assets/new/IMG-20240611-WA0001.jpg',
      'page': const ClothingFactories(),
    },
    {
      'name': 'مكاتب ملابس',
      'image': 'assets/new/IMG-20240611-WA0002.jpg',
      'page': const ClothingOffices(),
    },
    {
      'name': 'مصانع أحذيه وشنط',
      'image': 'assets/new/IMG-20240611-WA0030.jpg',
      'page': const ShoesBagsFactories(),
    },
    {
      'name': 'مكاتب أحذيه وشنط',
      'image': 'assets/new/IMG-20240611-WA0003.jpg',
      'page': const ShoesBagsOffices(),
    },
    {
      'name': 'تجار اقمشه',
      'image': 'assets/new/IMG-20240611-WA0007.jpg',
      'page': const TextileMerchants(),
    },
    {
      'name': 'مستلزمات انتاج ملابس',
      'image': 'assets/new/IMG-20240611-WA0006.jpg',
      'page': const ClothingProduction(),
    },
    {
      'name': 'تريكو',
      'image': 'assets/new/IMG-20240611-WA0005.jpg',
      'page': const Trico(),
    },
    {
      'name': 'مفروشات و وبريات',
      'image': 'assets/new/IMG-20240611-WA0004.jpg',
      'page': BeddingFurnishing(),
    },
    {
      'name': 'مستلزمات انتاج احذيه',
      'image': 'assets/new/IMG-20240611-WA0011.jpg',
      'page': ShoesProductionSupplies(),
    },
    {
      'name': 'مستحضرات تجميل',
      'image': 'assets/new/IMG-20240611-WA0010.jpg',
      'page': Cosemetics(),
    },
    {
      'name': 'أدوات منزليه',
      'image': 'assets/new/IMG-20240611-WA0009.jpg',
      'page': HouseWare(),
    },
    {
      'name': 'ألعاب أطفال',
      'image': 'assets/new/IMG-20240611-WA0008.jpg',
      'page': toys(),
    },
    {
      'name': 'اكسسوارات حريمي',
      'image': 'assets/new/IMG-20240611-WA0031.jpg',
      'page': WomesAccessories(),
    },
    {
      'name': 'محلات',
      'image': 'assets/new/IMG-20240611-WA0013.jpg',
      'page': const shops(),
    },
    {
      'name': 'موبايلات',
      'image': 'assets/new/IMG-20240611-WA0029.jpg',
      'page': phones(),
    },
    {
      'name': 'شركات شحن',
      'image': 'assets/new/IMG-20240611-WA0012.jpg',
      'page': shipping(),
    },
    {
      'name': 'طباعة وتطريز',
      'image': 'assets/new/IMG-20240611-WA0017.jpg',
      'page': Printings(),
    },
    
  ];
   final List<Map<String, dynamic>> categoriestwo = [
   
    {
      'name': 'شرابات',
      'image': 'assets/new/IMG-20240611-WA0016.jpg',
      'page': socks(),
    },
    {
      'name': 'استوك وبواقي تصدير',
      'image': 'assets/new/IMG-20240611-WA0015.jpg',
      'page': PackageExports(),
    },
    {
      'name': 'مواد تغليف',
      'image': 'assets/new/IMG-20240611-WA0014.jpg',
      'page': wrapping(),
    },
    {
      'name': 'مطاعم',
      'image': 'assets/new/IMG-20240611-WA0032.jpg',
      'page': Restaurant(),
    },
    {
      'name': 'كافيهات',
      'image': 'assets/new/IMG-20240611-WA0020.jpg',
      'page': cafe(),
    },
    {
      'name': 'الكترونيات',
      'image': 'assets/new/IMG-20240611-WA0019.jpg',
      'page': Electroniccs(),
    },
    {
      'name': 'اجهزة منزلية',
      'image': 'assets/new/IMG-20240611-WA0018.jpg',
      'page': Apelliace(),
    },
    {
      'name': 'مراكز تجميل',
      'image': 'assets/new/IMG-20240611-WA0024.jpg',
      'page': beautyCentre(),
    },
    {
      'name': 'معامل تحاليل وأطباء',
      'image': 'assets/new/IMG-20240611-WA0023.jpg',
      'page': laps(),
    },
    {
      'name': 'استثمار عقاري',
      'image': 'assets/new/IMG-20240611-WA0022.jpg',
      'page': investement(),
    },
    {
      'name': 'اضاءة ونجف',
      'image': 'assets/new/IMG-20240611-WA0021.jpg',
      'page': chandeliear(),
    },
    {
      'name': 'مستعمل',
      'image': 'assets/new/IMG-20240611-WA0028.jpg',
      'page': used(),
    },
    {
      'name': 'تسويق الكتروني',
      'image': 'assets/new/IMG-20240611-WA0027.jpg',
      'page': Emarketings(),
    },
    {
      'name': 'تجهيز محلات ومكاتب',
      'image': 'assets/new/IMG-20240611-WA0026.jpg',
      'page': officesShops(),
    },
    {
      'name': 'مجوهرات ودهب صيني',
      'image': 'assets/new/IMG-20240611-WA0025.jpg',
      'page': Gold(),
    },
    {
      'name': 'أخري',
      'image': 'assets/apps_13887732.png',
      'page': othersss(),
    },
  ];

  final List<Map<String, dynamic>> categoriess = [
    {
      'page': Profile(),
      'icon': FontAwesomeIcons.user,
      'label': 'الاعدادات',
    },
    {
      'page': popularshops(),
      'icon': FontAwesomeIcons.shop,
      'label': 'محلات',
    },
    {
      'page': VideoListPage(factoryData: {},),
      'icon': FontAwesomeIcons.video,
      'label': 'فيديو',
    },
    {
      'page':Homeexhition(),
      'icon': FontAwesomeIcons.shirt,
      'label': 'معارض',
    },
    {
      'page': SplashScreenthree(),
      'icon': FontAwesomeIcons.circlePlus,
      'label': 'اشترك',
    },
  ];
  final List<CardList> cards = [];
  final Stream<QuerySnapshot> bannerinfo =
      FirebaseFirestore.instance.collection('banners/banners1').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar:AppBar(

  title: Row(
    children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/100.jpg'),
              radius: 21,
            ),
            SizedBox(width: 10), // مسافة بين الصورة والنص
           Text(
                          'الـدلالـه',
                          style: GoogleFonts.cairo(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            color: kPrimaryColor,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
          ],
        ),
      ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
           showSearch(
            
                  context: context,
                  delegate: CustomSearchDelegate(
                   
                    MyCard,
                    item: placesList,
                  ),
              );
        },
      ),
    ],
  ),
  backgroundColor: Colors.white,
  elevation: 0, // لإزالة الظل
),
 
      body: CustomScrollView(slivers: <Widget>[
  
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding:
                    const EdgeInsets.only(top: 5, left: 2, right: 2, bottom: 0),
                child: Column(
                  children: [
                 CarouselSlider(
  items: [
    GestureDetector(
      onTap: () async {
        // استرجاع البيانات من Firestore
        DocumentSnapshot snapshot = await FirebaseFirestore
            .instance
            .collection('banners')
            .doc('banners1')
            .get();
        Map<String, dynamic> data =
            snapshot.data() as Map<String, dynamic>;

        // تمرير البيانات إلى banersinfobode
Get.to(
  () => banersinfobode(factoryData: data),
  transition: Transition.upToDown, // تحديد نوع الانتقال
);
      },
      child: CachedNetworkImage(
        imageUrl: BannerImages.imageUrl1 ?? '',
        width: MediaQuery.of(context).size.width,
        height: 150,
        fit: BoxFit.fill,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    ),
    GestureDetector(
      onTap: () async {
        // استرجاع البيانات من Firestore
        DocumentSnapshot snapshot = await FirebaseFirestore
            .instance
            .collection('banners')
            .doc('banners1+')
            .get();
        Map<String, dynamic> data =
            snapshot.data() as Map<String, dynamic>;

        // تمرير البيانات إلى banersinfobode
Get.to(
  () => banersinfobode(factoryData: data),
  transition: Transition.upToDown, // تحديد نوع الانتقال
);
      },
      child: CachedNetworkImage(
        imageUrl: BannerImages.imageUrl1plus ?? '', // تأكد من أن BannerImages.imageUrl2 تحتوي على الرابط المناسب
        width: MediaQuery.of(context).size.width,
        height: 150,
        fit: BoxFit.fill,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    ),
  ],
  options: CarouselOptions(
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 2.0,
     viewportFraction: 1.0, // كل صورة تأخذ عرض الشاشة بالكامل
  ),
),
      SizedBox(width: 1),
                    Text(
                      'دليلك لمعرفة كل الاماكن المهمة القريبة منك',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    _ListViewCategory(),
                   _ListViewCategorytwo(),

                  
                    
                   GestureDetector(
      onTap: () async {
        // استرجاع البيانات من Firestore
        DocumentSnapshot snapshot = await _futureBanners2;
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        // تمرير البيانات إلى banersinfobode
        Get.to(() => banersinfobode(factoryData: data));
      },
      child: FutureBuilder<DocumentSnapshot>(
        future: _futureBanners2,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Icon(Icons.error);
          }
          if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            String videoUrl2 = data['videoUrl'] ?? '';
            String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

            return Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    // استرجاع البيانات من Firestore
                    DocumentSnapshot snapshot = await _futureBanners2;
                    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                    // تمرير البيانات إلى banersinfobode
                    Get.to(() => banersinfobode(factoryData: data));
                  },
                  child: Container(
                    margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                    decoration: BoxDecoration(
                      color: Colors.blue, // لون الزر
                      borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // لون الظل
                          offset: Offset(0, 4), // موقع الظل
                          blurRadius: 8.0, // ضبابية الظل
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.touch_app, color: Colors.black), // أيقونة
                        SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
                        Text(
                          buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
                            decoration: TextDecoration.underline, // لإضافة خط تحت النص
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 16/14,
                  child: VideoPlayerPage(videoUrl: videoUrl2),
                ),
              ],
            );
          } else {
            return Icon(Icons.error);
          }
        },
      ),
    ),
                
                

                    SizedBox(
                      height: 15,
                    ),
                    /////////////
                                       GestureDetector(
      onTap: () async {
        // استرجاع البيانات من Firestore
        DocumentSnapshot snapshot = await _futureBanners3;
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        // تمرير البيانات إلى banersinfobode
        Get.to(() => banersinfobode(factoryData: data));
      },
      child: FutureBuilder<DocumentSnapshot>(
        future: _futureBanners3,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Icon(Icons.error);
          }
          if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            String videoUrl2 = data['videoUrl'] ?? '';
            String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

            return Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    // استرجاع البيانات من Firestore
                    DocumentSnapshot snapshot = await _futureBanners3;
                    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                    // تمرير البيانات إلى banersinfobode
                    Get.to(() => banersinfobode(factoryData: data));
                  },
                  child: Container(
                    margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                    decoration: BoxDecoration(
                      color: Colors.blue, // لون الزر
                      borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // لون الظل
                          offset: Offset(0, 4), // موقع الظل
                          blurRadius: 8.0, // ضبابية الظل
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.touch_app, color: Colors.black), // أيقونة
                        SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
                        Text(
                          buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
                            decoration: TextDecoration.underline, // لإضافة خط تحت النص
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 16/14,
                  child: VideoPlayerPage(videoUrl: videoUrl2),
                ),
              ],
            );
          } else {
            return Icon(Icons.error);
          }
        },
      ),
    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons
                              .zoom_in_map_outlined, // يمكنك تغيير هذا بالرمز المناسب لأيقونة الخرائط التي تفضلها
                          color:
                              Colors.red, // يمكنك تغيير لون الأيقونة حسب الحاجة
                        ),
                        Text(
                          'الأماكن القريبة',
                          style: GoogleFonts.cairo(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: kPrimaryColor,
                          ),
                        ),
                        Icon(
                          Icons
                              .zoom_in_map_outlined, // يمكنك تغيير هذا بالرمز المناسب لأيقونة الخرائط التي تفضلها
                          color:
                              Colors.red, // يمكنك تغيير لون الأيقونة حسب الحاجة
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      height: 280,
                      child: NearbyPlacesScreen(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    
                              GestureDetector(
      onTap: () async {
        // استرجاع البيانات من Firestore
        DocumentSnapshot snapshot = await _futureBanners4;
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        // تمرير البيانات إلى banersinfobode
        Get.to(() => banersinfobode(factoryData: data));
      },
      child: FutureBuilder<DocumentSnapshot>(
        future: _futureBanners4,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Icon(Icons.error);
          }
          if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            String videoUrl2 = data['videoUrl'] ?? '';
            String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

            return Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    // استرجاع البيانات من Firestore
                    DocumentSnapshot snapshot = await _futureBanners4;
                    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                    // تمرير البيانات إلى banersinfobode
                    Get.to(() => banersinfobode(factoryData: data));
                  },
                  child: Container(
                    margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                    decoration: BoxDecoration(
                      color: Colors.blue, // لون الزر
                      borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // لون الظل
                          offset: Offset(0, 4), // موقع الظل
                          blurRadius: 8.0, // ضبابية الظل
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.touch_app, color: Colors.black), // أيقونة
                        SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
                        Text(
                          buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
                            decoration: TextDecoration.underline, // لإضافة خط تحت النص
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 16/14,
                  child: VideoPlayerPage(videoUrl: videoUrl2),
                ),
              ],
            );
          } else {
            return Icon(Icons.error);
          }
        },
      ),
    ),
SizedBox(height: 15,),
/////////////
               GestureDetector(
      onTap: () async {
        // استرجاع البيانات من Firestore
        DocumentSnapshot snapshot = await _futureBanners5;
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        // تمرير البيانات إلى banersinfobode
        Get.to(() => banersinfobode(factoryData: data));
      },
      child: FutureBuilder<DocumentSnapshot>(
        future: _futureBanners5,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Icon(Icons.error);
          }
          if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            String videoUrl2 = data['videoUrl'] ?? '';
            String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

            return Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    // استرجاع البيانات من Firestore
                    DocumentSnapshot snapshot = await _futureBanners5;
                    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                    // تمرير البيانات إلى banersinfobode
                    Get.to(() => banersinfobode(factoryData: data));
                  },
                  child: Container(
                    margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                    decoration: BoxDecoration(
                      color: Colors.blue, // لون الزر
                      borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // لون الظل
                          offset: Offset(0, 4), // موقع الظل
                          blurRadius: 8.0, // ضبابية الظل
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.touch_app, color: Colors.black), // أيقونة
                        SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
                        Text(
                          buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
                            decoration: TextDecoration.underline, // لإضافة خط تحت النص
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 16/14,
                  child: VideoPlayerPage(videoUrl: videoUrl2),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    ),
          
    
////////////////
  GestureDetector(
      onTap: () async {
        // استرجاع البيانات من Firestore
        DocumentSnapshot snapshot = await _futureBanners6;
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

        // تمرير البيانات إلى banersinfobode
        Get.to(() => banersinfobode(factoryData: data));
      },
      child: FutureBuilder<DocumentSnapshot>(
        future: _futureBanners6,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Icon(Icons.error);
          }
          if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            String videoUrl2 = data['videoUrl'] ?? '';
            String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

            return Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    // استرجاع البيانات من Firestore
                    DocumentSnapshot snapshot = await _futureBanners6;
                    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                    // تمرير البيانات إلى banersinfobode
                    Get.to(() => banersinfobode(factoryData: data));
                  },
                  child: Container(
                    margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                    decoration: BoxDecoration(
                      color: Colors.blue, // لون الزر
                      borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // لون الظل
                          offset: Offset(0, 4), // موقع الظل
                          blurRadius: 8.0, // ضبابية الظل
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.touch_app, color: Colors.black), // أيقونة
                        SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
                        Text(
                          buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
                            decoration: TextDecoration.underline, // لإضافة خط تحت النص
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 16/14,
                  child: VideoPlayerPage(videoUrl: videoUrl2),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    ),
SizedBox(height: 10,),
            /////////////
             GestureDetector(
              onTap: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('banners')
                    .doc('banners7')
                    .get();
                Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                Get.to(() => banersinfobode(factoryData: data));
              },
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('banners').doc('banners7').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // عدم عرض شيء أثناء التحميل
                  }
                  if (snapshot.hasError) {
                    return Container(); // عدم عرض شيء في حالة الخطأ
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    String videoUrl5 = data['videoUrl'] ?? '';
                    String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                    if (videoUrl5.isEmpty) {
                      return Container(); // عدم عرض شيء إذا كان رابط الفيديو فارغًا
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('banners')
                                .doc('banners7')
                                .get();
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                            Get.to(() => banersinfobode(factoryData: data));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الزر
                              borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // لون الظل
                                  offset: Offset(0, 4), // موقع الظل
                                  blurRadius: 8.0, // ضبابية الظل
                                ),
                              ],
                            ),
                            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: Colors.black), // أيقونة
              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
              Text(
  buttonText,
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
    decoration: TextDecoration.underline, // لإضافة خط تحت النص
  ),
),

            ],
          ),
                          ),
                        ),
                        AspectRatio(aspectRatio: 16/14,
                        child: VideoPlayerPage(videoUrl: videoUrl5)),
                      ],
                    );
                  } else {
                    return Container(); // عدم عرض شيء إذا لم تكن هناك بيانات
                  }
                },
              ),
            ),
            /////////
                 GestureDetector(
              onTap: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('banners')
                    .doc('banners8')
                    .get();
                Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                Get.to(() => banersinfobode(factoryData: data));
              },
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('banners').doc('banners8').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // عدم عرض شيء أثناء التحميل
                  }
                  if (snapshot.hasError) {
                    return Container(); // عدم عرض شيء في حالة الخطأ
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    String videoUrl8 = data['videoUrl'] ?? '';
                    String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                    if (videoUrl8.isEmpty) {
                      return Container(); // عدم عرض شيء إذا كان رابط الفيديو فارغًا
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('banners')
                                .doc('banners8')
                                .get();
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                            Get.to(() => banersinfobode(factoryData: data));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الزر
                              borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // لون الظل
                                  offset: Offset(0, 4), // موقع الظل
                                  blurRadius: 8.0, // ضبابية الظل
                                ),
                              ],
                            ),
                            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: Colors.black), // أيقونة
              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
              Text(
  buttonText,
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
    decoration: TextDecoration.underline, // لإضافة خط تحت النص
  ),
),

            ],
          ),
                          ),
                        ),
                        AspectRatio(aspectRatio: 16/14,
                        child: VideoPlayerPage(videoUrl: videoUrl8)),
                      ],
                    );
                  } else {
                    return Container(); // عدم عرض شيء إذا لم تكن هناك بيانات
                  }
                },
              ),
            ),
            //////
            GestureDetector(
              onTap: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('banners')
                    .doc('banners9')
                    .get();
                Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                Get.to(() => banersinfobode(factoryData: data));
              },
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('banners').doc('banners9').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // عدم عرض شيء أثناء التحميل
                  }
                  if (snapshot.hasError) {
                    return Container(); // عدم عرض شيء في حالة الخطأ
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    String videoUrl5 = data['videoUrl'] ?? '';
                    String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                    if (videoUrl5.isEmpty) {
                      return Container(); // عدم عرض شيء إذا كان رابط الفيديو فارغًا
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('banners')
                                .doc('banners9')
                                .get();
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                            Get.to(() => banersinfobode(factoryData: data));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الزر
                              borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // لون الظل
                                  offset: Offset(0, 4), // موقع الظل
                                  blurRadius: 8.0, // ضبابية الظل
                                ),
                              ],
                            ),
                            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: Colors.black), // أيقونة
              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
              Text(
  buttonText,
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
    decoration: TextDecoration.underline, // لإضافة خط تحت النص
  ),
),

            ],
          ),
                          ),
                        ),
                        AspectRatio(aspectRatio:16/14,
                        child: VideoPlayerPage(videoUrl: videoUrl5)),
                      ],
                    );
                  } else {
                    return Container(); // عدم عرض شيء إذا لم تكن هناك بيانات
                  }
                },
              ),
            ),
            ////////// 
             GestureDetector(
              onTap: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('banners')
                    .doc('banners10')
                    .get();
                Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                Get.to(() => banersinfobode(factoryData: data));
              },
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('banners').doc('banners10').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // عدم عرض شيء أثناء التحميل
                  }
                  if (snapshot.hasError) {
                    return Container(); // عدم عرض شيء في حالة الخطأ
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    String videoUrl5 = data['videoUrl'] ?? '';
                    String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                    if (videoUrl5.isEmpty) {
                      return Container(); // عدم عرض شيء إذا كان رابط الفيديو فارغًا
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('banners')
                                .doc('banners10')
                                .get();
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                            Get.to(() => banersinfobode(factoryData: data));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الزر
                              borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // لون الظل
                                  offset: Offset(0, 4), // موقع الظل
                                  blurRadius: 8.0, // ضبابية الظل
                                ),
                              ],
                            ),
                            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: Colors.black), // أيقونة
              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
              Text(
  buttonText,
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
    decoration: TextDecoration.underline, // لإضافة خط تحت النص
  ),
),

            ],
          ),
                          ),
                        ),
                        SizedBox(height: 8.0), // إضافة مسافة بين الزر والفيديو
                        AspectRatio(aspectRatio: 16/14,
                        child: VideoPlayerPage(videoUrl: videoUrl5)),
                      ],
                    );
                  } else {
                    return Container(); // عدم عرض شيء إذا لم تكن هناك بيانات
                  }
                },
              ),
            ),
            ///////////////
             GestureDetector(
              onTap: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('banners')
                    .doc('banners11')
                    .get();
                Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                Get.to(() => banersinfobode(factoryData: data));
              },
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('banners').doc('banners11').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // عدم عرض شيء أثناء التحميل
                  }
                  if (snapshot.hasError) {
                    return Container(); // عدم عرض شيء في حالة الخطأ
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    String videoUrl5 = data['videoUrl'] ?? '';
                    String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                    if (videoUrl5.isEmpty) {
                      return Container(); // عدم عرض شيء إذا كان رابط الفيديو فارغًا
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('banners')
                                .doc('banners11')
                                .get();
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                            Get.to(() => banersinfobode(factoryData: data));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الزر
                              borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // لون الظل
                                  offset: Offset(0, 4), // موقع الظل
                                  blurRadius: 8.0, // ضبابية الظل
                                ),
                              ],
                            ),
                            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: Colors.black), // أيقونة
              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
              Text(
  buttonText,
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
    decoration: TextDecoration.underline, // لإضافة خط تحت النص
  ),
),

            ],
          ),
                          ),
                        ),
                        SizedBox(height: 8.0), // إضافة مسافة بين الزر والفيديو
                        AspectRatio(aspectRatio:16/14,
                        child: VideoPlayerPage(videoUrl: videoUrl5)),
                      ],
                    );
                  } else {
                    return Container(); // عدم عرض شيء إذا لم تكن هناك بيانات
                  }
                },
              ),
            ),
            /////////
             GestureDetector(
              onTap: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('banners')
                    .doc('banners12')
                    .get();
                Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                Get.to(() => banersinfobode(factoryData: data));
              },
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('banners').doc('banners12').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // عدم عرض شيء أثناء التحميل
                  }
                  if (snapshot.hasError) {
                    return Container(); // عدم عرض شيء في حالة الخطأ
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    String videoUrl5 = data['videoUrl'] ?? '';
                    String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                    if (videoUrl5.isEmpty) {
                      return Container(); // عدم عرض شيء إذا كان رابط الفيديو فارغًا
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('banners')
                                .doc('banners12')
                                .get();
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                            Get.to(() => banersinfobode(factoryData: data));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الزر
                              borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // لون الظل
                                  offset: Offset(0, 4), // موقع الظل
                                  blurRadius: 8.0, // ضبابية الظل
                                ),
                              ],
                            ),
                            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: Colors.black), // أيقونة
              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
              Text(
  buttonText,
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
    decoration: TextDecoration.underline, // لإضافة خط تحت النص
  ),
),

            ],
          ),
                          ),
                        ),
                        SizedBox(height: 8.0), // إضافة مسافة بين الزر والفيديو
                        AspectRatio(aspectRatio: 16/14,
                        child: VideoPlayerPage(videoUrl: videoUrl5)),
                      ],
                    );
                  } else {
                    return Container(); // عدم عرض شيء إذا لم تكن هناك بيانات
                  }
                },
              ),
            ),
            ////////
             GestureDetector(
              onTap: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('banners')
                    .doc('banners13')
                    .get();
                Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                Get.to(() => banersinfobode(factoryData: data));
              },
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('banners').doc('banners13').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // عدم عرض شيء أثناء التحميل
                  }
                  if (snapshot.hasError) {
                    return Container(); // عدم عرض شيء في حالة الخطأ
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    String videoUrl5 = data['videoUrl'] ?? '';
                    String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                    if (videoUrl5.isEmpty) {
                      return Container(); // عدم عرض شيء إذا كان رابط الفيديو فارغًا
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('banners')
                                .doc('banners13')
                                .get();
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                            Get.to(() => banersinfobode(factoryData: data));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الزر
                              borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // لون الظل
                                  offset: Offset(0, 4), // موقع الظل
                                  blurRadius: 8.0, // ضبابية الظل
                                ),
                              ],
                            ),
                            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: Colors.black), // أيقونة
              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
              Text(
  buttonText,
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
    decoration: TextDecoration.underline, // لإضافة خط تحت النص
  ),
),

            ],
          ),
                          ),
                        ),
                        SizedBox(height: 8.0), // إضافة مسافة بين الزر والفيديو
                        AspectRatio(aspectRatio: 16/14,
                        child: VideoPlayerPage(videoUrl: videoUrl5)),
                      ],
                    );
                  } else {
                    return Container(); // عدم عرض شيء إذا لم تكن هناك بيانات
                  }
                },
              ),
            ),
            //////////
             GestureDetector(
              onTap: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('banners')
                    .doc('banners14')
                    .get();
                Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                Get.to(() => banersinfobode(factoryData: data));
              },
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('banners').doc('banners14').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // عدم عرض شيء أثناء التحميل
                  }
                  if (snapshot.hasError) {
                    return Container(); // عدم عرض شيء في حالة الخطأ
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    String videoUrl5 = data['videoUrl'] ?? '';
                    String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                    if (videoUrl5.isEmpty) {
                      return Container(); // عدم عرض شيء إذا كان رابط الفيديو فارغًا
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('banners')
                                .doc('banners14')
                                .get();
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                            Get.to(() => banersinfobode(factoryData: data));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الزر
                              borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // لون الظل
                                  offset: Offset(0, 4), // موقع الظل
                                  blurRadius: 8.0, // ضبابية الظل
                                ),
                              ],
                            ),
                            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: Colors.black), // أيقونة
              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
              Text(
  buttonText,
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
    decoration: TextDecoration.underline, // لإضافة خط تحت النص
  ),
),

            ],
          ),
                          ),
                        ),
                        SizedBox(height: 8.0), // إضافة مسافة بين الزر والفيديو
                        AspectRatio(aspectRatio: 16/14,
                        child: VideoPlayerPage(videoUrl: videoUrl5)),
                      ],
                    );
                  } else {
                    return Container(); // عدم عرض شيء إذا لم تكن هناك بيانات
                  }
                },
              ),
            ),
            ///
             GestureDetector(
              onTap: () async {
                DocumentSnapshot snapshot = await FirebaseFirestore.instance
                    .collection('banners')
                    .doc('banners15')
                    .get();
                Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                Get.to(() => banersinfobode(factoryData: data));
              },
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance.collection('banners').doc('banners15').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // عدم عرض شيء أثناء التحميل
                  }
                  if (snapshot.hasError) {
                    return Container(); // عدم عرض شيء في حالة الخطأ
                  }
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    String videoUrl5 = data['videoUrl'] ?? '';
                    String buttonText = data['buttonText'] ?? 'اضغط هنا لمزيد من المعلومات';

                    if (videoUrl5.isEmpty) {
                      return Container(); // عدم عرض شيء إذا كان رابط الفيديو فارغًا
                    }

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                .collection('banners')
                                .doc('banners15')
                                .get();
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

                            Get.to(() => banersinfobode(factoryData: data));
                          },
                          child: Container(
                            margin: EdgeInsets.all(16.0), // لخلق مسافة بين الزر والفيديو
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // حجم الزر
                            decoration: BoxDecoration(
                              color: Colors.blue, // لون الزر
                              borderRadius: BorderRadius.circular(8.0), // حواف مستديرة
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // لون الظل
                                  offset: Offset(0, 4), // موقع الظل
                                  blurRadius: 8.0, // ضبابية الظل
                                ),
                              ],
                            ),
                            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.touch_app, color: Colors.black), // أيقونة
              SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
              Text(
  buttonText,
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold, // لجعل النص بارزاً أكثر
    decoration: TextDecoration.underline, // لإضافة خط تحت النص
  ),
),

            ],
          ),
                          ),
                        ),
                        SizedBox(height: 8.0), // إضافة مسافة بين الزر والفيديو
                        AspectRatio(aspectRatio: 16/14,
                        child: VideoPlayerPage(videoUrl: videoUrl5)),
                      ],
                    );
                  } else {
                    return Container(); // عدم عرض شيء إذا لم تكن هناك بيانات
                  }
                },
              ),
            ),
                  ],
                
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop, // نوع الانيميشن
                  child: categoriess[index]['page'],
                ),
              );
        },
        items: categoriess.map((category) {
          return BottomNavigationBarItem(
            icon: Icon(category['icon']),
            label: category['label'],
            backgroundColor: kPrimaryColor,
          );
        }).toList(),
        showSelectedLabels: true, //
        showUnselectedLabels: true, //
        selectedFontSize: 16.0, //
        unselectedFontSize: 14.0,
         elevation: 5,
           iconSize:20 ,
      ),
    );
  }

Widget _ListViewCategory() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(8),
        color: Color.fromARGB(255, 255, 255, 255),
        height: 130,  // تعديل الارتفاع ليناسب عرض الفئات في صف واحد
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: showMoreCategories ? categories.length : 17,
          itemBuilder: (context, index) {
            return GestureDetector(
               onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade, // نوع الانيميشن
                  child: categories[index]['page'],
                ),
              );
            },
              child: Container(
  margin: EdgeInsets.symmetric(horizontal: 4.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 80,  // تعديل العرض ليناسب العناصر الأفقية
        height: 80, // تعديل الارتفاع ليناسب العناصر الأفقية
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // لون الحافة
            width: 2.0,         // عرض الحافة
          ),
          borderRadius: BorderRadius.circular(38.0), // نصف القطر للحواف الدائرية
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(38.0),
          child: Image.asset(
            categories[index]['image'],
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 8.0), // إضافة مسافة بين الصورة والنص
      CustomText(
        text: categories[index]['name'],
        fontSize: 12,
        alignment: Alignment.bottomCenter,
        fontWeight: FontWeight.w700,
        direction: TextDirection.rtl,
      ),
    ],
  ),
),

            );
          },
        ),
      ),
     
    ],
  );
}
Widget _ListViewCategorytwo() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(8),
        color: Color.fromARGB(255, 255, 255, 255),
        height: 130,  // تعديل الارتفاع ليناسب عرض الفئات في صف واحد
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: showMoreCategories ? categoriestwo.length : 16,
          itemBuilder: (context, index) {
            return GestureDetector(
               onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade, // نوع الانيميشن
                  child: categoriestwo[index]['page'],
                ),
              );
            },
              child: Container(
  margin: EdgeInsets.symmetric(horizontal: 4.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 80,  // تعديل العرض ليناسب العناصر الأفقية
        height: 80, // تعديل الارتفاع ليناسب العناصر الأفقية
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // لون الحافة
            width: 2.0,         // عرض الحافة
          ),
          borderRadius: BorderRadius.circular(38.0), // نصف القطر للحواف الدائرية
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(38.0),
          child: Image.asset(
            categoriestwo[index]['image'],
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 8.0), // إضافة مسافة بين الصورة والنص
      CustomText(
        text: categoriestwo[index]['name'],
        fontSize: 12,
        alignment: Alignment.bottomCenter,
        fontWeight: FontWeight.w700,
        direction: TextDirection.rtl,
      ),
    ],
  ),
),

            );
          },
        ),
      ),
    
    ],
  );
}
}

// الجزء الخاص بالبحث يبدء من هنا للنهاية
class CustomSearchDelegate extends SearchDelegate {

  final List<ItemModel> item;

  CustomSearchDelegate( Type myCard, {required this.item});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<ItemModel>>(
      future: _search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<ItemModel> searchResults = snapshot.data!;
          if (searchResults.isEmpty) {
            return Center(
              child: Text('No results found'),
            );
          } else {
            return ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(searchResults[index].image),
                  title: Text(searchResults[index].placeName),
                  onTap: () {
                    Get.to(() => Profiles(item: searchResults[index]));
                  },
                );
              },
            );
          }
        }
      },
    );
  }

  Future<List<ItemModel>> _search(String query) async {
    return await compute(_performSearch, {'query': query, 'items': item});
  }

  static List<ItemModel> _performSearch(Map<String, dynamic> params) {
    String query = params['query'];
    List<ItemModel> items = params['items'];

    List<ItemModel> searchResults = items
        .where((element) =>
            element.placeName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return searchResults;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ItemModel> searchSuggestions = [];

    if (query.isNotEmpty) {
      searchSuggestions = item
          .where((element) =>
              element.placeName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return Stack(
      children: [
        if (searchSuggestions.isEmpty)
          Positioned.fill(
            child: Image.asset(
              'assets/search background.png',
              fit: BoxFit.cover,
            ),
          ),
        ListView.builder(
          itemCount: searchSuggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(searchSuggestions[index].image),
              ),
              title: Text(searchSuggestions[index].placeName),
              onTap: () {
                Get.to(() => Profiles(item: searchSuggestions[index]));
              },
            );
          },
        ),
      ],
    );
  }
}


class Profiles extends StatelessWidget {
  final ItemModel item;

  const Profiles({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.placeName),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عرض الصورة
            Image.network(item.image),
            SizedBox(height: 20),
            // عرض باقي بيانات ItemModel
            Text(
              'العنوان: ${item.address}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),
            // ...
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (item.facebookLink != null && item.facebookLink.isNotEmpty)
                  SocialIcon(
                    icon: FontAwesomeIcons.facebook,
                    color: Colors.blue,
                    onTap: () async {
                      AdsInterstitial().showAd();
                      await Future.delayed(Duration(seconds: 6));
                      launchFacebook(item.facebookLink);
                    },
                  ),
                if (item.phoneNumber != null && item.phoneNumber.isNotEmpty)
                  SocialIcon(
                    icon: FontAwesomeIcons.phone,
                    color: Colors.green,
                    onTap: () async {
                      AdsInterstitial().showAd();
                      await Future.delayed(Duration(seconds: 6));
                      makePhoneCall(item.phoneNumber);
                    },
                  ),
                if (item.WhatsAppLink != null && item.WhatsAppLink.isNotEmpty)
                  SocialIcon(
                    icon: FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    onTap: () async {
                      AdsInterstitial().showAd();
                      await Future.delayed(Duration(seconds: 6));
                      launchWhatsApp(item.WhatsAppLink);
                    },
                  ),
              ],
            ),
            SizedBox(height: 20),

            // ...
          ],
        ),
      ),
    );
  }
}

// عنصر تفاعلي لعرض رمز التواصل الاجتماعي
class SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const SocialIcon({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FaIcon(
        icon,
        color: color,
        size: 30,
      ),
    );
  }
}

void launchFacebook(String facebookLink) async {
  final String facebookUrl = "$facebookLink";

  try {
    await launch(facebookUrl);
  } catch (e) {
    print("Error launching facebook: $e");
  }
}

void makePhoneCall(String phoneNumber) async {
  FlutterPhoneDirectCaller.callNumber(phoneNumber);
}

void launchWhatsApp(String WhatsAppLink) async {
  final String whatsappUrl = "whatsapp://send?phone=$WhatsAppLink";

  try {
    await launch(whatsappUrl);
  } catch (e) {
    print("Error launching WhatsApp: $e");
  }
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void fetchData() {
    firestore.collection('banners').snapshots().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs[0];
      }
    });
  }
}

//---------------------------------------------------------------------------------------------

class banersinfobode extends StatefulWidget {
  final Map<String, dynamic> factoryData;

  banersinfobode({Key? key, required this.factoryData}) : super(key: key);

  @override
  State<banersinfobode> createState() => _banersinfobodeState();
}

class _banersinfobodeState extends State<banersinfobode> {
  final Stream<QuerySnapshot> bannerinfo =
      FirebaseFirestore.instance
      .collection('banners/banners1')
      .snapshots();
        int _current = 0;
        late int viewsCount;

  @override
  void initState() {
    super.initState();
    // تحميل عدد المشاهدات الحالي وتحديثه
    viewsCount = widget.factoryData['views'] ?? 180;
    _incrementViews();
  }

  void _incrementViews() async {
    final collection = FirebaseFirestore.instance
      .collection('banners')
;
    // البحث عن المستند الذي يحتوي على نفس البيانات (يمكنك تحديد معيار البحث بناءً على البيانات الفريدة المتاحة في factoryData)
    final querySnapshot = await collection
        .where('name', isEqualTo: widget.factoryData['name'])
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final docRef = querySnapshot.docs.first.reference;
      await docRef.update({'views': viewsCount + 1});
      setState(() {
        viewsCount += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     final List<String> imgList = [
      if (widget.factoryData['image1']?.isNotEmpty == true) widget.factoryData['image1']!,
      if (widget.factoryData['image2']?.isNotEmpty == true) widget.factoryData['image2']!,
      if (widget.factoryData['image3']?.isNotEmpty == true) widget.factoryData['image3']!,
      if (widget.factoryData['image4']?.isNotEmpty == true) widget.factoryData['image4']!,
      if (widget.factoryData['image5']?.isNotEmpty == true) widget.factoryData['image5']!,
      if (widget.factoryData['image6']?.isNotEmpty == true) widget.factoryData['image6']!,
      if (widget.factoryData['image7']?.isNotEmpty == true) widget.factoryData['image7']!,
      if (widget.factoryData['image8']?.isNotEmpty == true) widget.factoryData['image8']!,
      if (widget.factoryData['image9']?.isNotEmpty == true) widget.factoryData['image9']!,
      if (widget.factoryData['image10']?.isNotEmpty == true) widget.factoryData['image10']!,
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.factoryData['name'],
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: [
                Text(widget.factoryData['text'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                    textDirection: TextDirection.rtl),
           
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: [
         if (imgList.isNotEmpty) ...[
          CarouselSlider(
            items: imgList.map((item) => Container(
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.white,
              child: Image.network(
                item,
                fit: BoxFit.contain,
              //width: MediaQuery.of(context).size.width,
              ),
            )).toList(),
            options: CarouselOptions(
              autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlay: true,
                          enableInfiniteScroll: false,
                          viewportFraction: 1.0,
                          enlargeCenterPage: true,
                          aspectRatio: 1.0,
             
             
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() => _current = entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : kPrimaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
                
              );
            }).toList(),
          ),
        ] else ...[
          Text(""),
        ],
      ],
                  
    )
                ),
        
                SizedBox(
                  height: 9,
                ),
                     Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (widget.factoryData['facebook'] != null &&
                        widget.factoryData['facebook'].isNotEmpty)
                      SocialIcon(
                        icon: FontAwesomeIcons.facebook,
                        color: Colors.blue,
                        onTap: () {
                          launchFacebookFromFirestore();
                        },
                      ),
                    if (widget.factoryData['phone'] != null &&
                        widget.factoryData['phone'].isNotEmpty)
                      SocialIcon(
                        icon: FontAwesomeIcons.phone,
                        color: Colors.green,
                        onTap: () {
                          makePhoneCallFromFirestore();
                        },
                      ),
                    if (widget.factoryData['whats'] != null &&
                        widget.factoryData['whats'].isNotEmpty)
                      SocialIcon(
                        icon: FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                        onTap: () {
                          launchWhatsAppFromFirestore();
                        },
                      ),
                    if (widget.factoryData['tele'] != null &&
                        widget.factoryData['tele'].isNotEmpty)
                      SocialIcon(
                        icon: FontAwesomeIcons.telegram,
                        color: Color.fromARGB(255, 44, 123, 175),
                        onTap: () {
                          launchTelegramFromFirestore();
                        },
                      ),
                    if (widget.factoryData['insta'] != null &&
                        widget.factoryData['insta'].isNotEmpty)
                      SocialIcon(
                        icon: FontAwesomeIcons.instagram,
                        color: Color.fromARGB(255, 248, 103, 19),
                        onTap: () {
                          launchInstagramFromFirestore();
                        },
                      ),
                  ],
                ),
                SizedBox(height: 20,),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.visibility, color: Colors.black, size: 25),
                  SizedBox(width: 8),
                  Text(
                    '$viewsCount مشاهدات',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              ],
            ),
          ),
              
            ),
          
      ),
    );
      
    
  }

  void launchFacebookFromFirestore() async {
    // استخراج الرابط المباشر من الفيرستور
    String facebookLink = widget.factoryData['facebook'];

    final String facebookUrl = "$facebookLink";

    try {
      await launch(facebookUrl);
    } catch (e) {
      print("Error launching facebook: $e");
    }
  }

  void makePhoneCallFromFirestore() async {
    String phoneNumber = widget.factoryData['phone'];

    makePhoneCall(phoneNumber);
  }

  void launchWhatsAppFromFirestore() async {
    String whatsappLink = widget.factoryData['whats'];
    launchWhatsApp(whatsappLink);
  }

  void launchTelegramFromFirestore() async {
    String telegramLink = widget.factoryData['tele'];

    _launchTelegram(telegramLink);
  }

  void _launchTelegram(String telegramLink) async {
    final String telegramUrl = "$telegramLink";
    try {
      await launch(telegramUrl);
    } catch (e) {
      print("Error launching telegram: $e");
    }
  }

  void launchInstagramFromFirestore() async {
    String instagramLink = widget.factoryData['insta'];

    _launchInstagram(instagramLink);
  }

  void _launchInstagram(String instagramLink) async {
    final String instagramUrl = "$instagramLink";
    try {
      await launch(instagramUrl);
    } catch (e) {
      print("Error launching instagram: $e");
    }
  }
}



