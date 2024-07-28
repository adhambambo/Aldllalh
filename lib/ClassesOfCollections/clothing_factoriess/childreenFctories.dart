import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:eldalala/Models/Item_model.dart';
import 'package:eldalala/Models/testbanerpage.dart';
import 'package:eldalala/Social/List_Items_Social.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildreenClothingFactories extends StatefulWidget {
  ChildreenClothingFactories({super.key});

  @override
  State<ChildreenClothingFactories> createState() =>
      _ChildreenClothingFactoriesState();
}

class _ChildreenClothingFactoriesState
    extends State<ChildreenClothingFactories> {
  final Stream<QuerySnapshot> childreenFactories = FirebaseFirestore.instance
      .collection('مصانع/مصانع ملابس/مصانع ملابس اطفال')
      .orderBy('row', descending: false)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('مصانع ملابس اطفال'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: childreenFactories,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              // لا توجد بيانات
              return Center(
                  child: Text(
                'No Data Available',
                style: TextStyle(color: kPrimaryColor),
              ));
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var factoryData =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                if (factoryData.containsKey('banner')) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ChildreenbannersInfo(
                            factoryDatatwo: factoryData,
                          ));
                    },
                    child: Image.network(
                      snapshot.data!.docs[index]['banner'],
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() =>
                          ChildreenFactoriesInfo(factoryData: factoryData));
                    },
                    child: ListItemOnline(
                      item: ItemModel(
                        image: snapshot.data!.docs[index]['image'],
                        placeName: snapshot.data!.docs[index]['name'],
                        address: snapshot.data!.docs[index]['address'],
                        location: snapshot.data!.docs[index]['location'],
                        phoneNumber: snapshot.data!.docs[index]['phone'],
                        facebookLink: snapshot.data!.docs[index]
                            ['facebook'], // رابط فيسبوك للعرض فقط
                        WhatsAppLink: snapshot.data!.docs[index]
                            ['whats'], // رابط واتساب للعرض فقط
                        instagramLink: snapshot.data!.docs[index]['insta'],
                        telegramLink: snapshot.data!.docs[index]['tele'],
                        tiktokLink: (snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>)
                                .containsKey('tiktok')
                            ? snapshot.data!.docs[index]['tiktok']
                            : null,
                        instagramCustomText: 'شاهدنا علي',
                        telegramCustomText: 'تواصل معنا عبر',
                        WhatsAppNumber: '',
                        facebookCustomText: 'شاهدنا علي',
                        phoneCustomText: 'اتصل بنا',
                        WhatsAppCustomText: 'تواصل معنا على واتساب',
                        locationCustomText: 'موقعنا',
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class ChildreenFactoriesInfo extends StatefulWidget {
  final Map<String, dynamic> factoryData;

  ChildreenFactoriesInfo({Key? key, required this.factoryData})
      : super(key: key);

  @override
  State<ChildreenFactoriesInfo> createState() => _ChildreenFactoriesInfoState();
}

class _ChildreenFactoriesInfoState extends State<ChildreenFactoriesInfo> {
  final Stream<QuerySnapshot> childreenFactories = FirebaseFirestore.instance
      .collection('مصانع/مصانع ملابس/مصانع ملابس اطفال')
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
      .collection('مصانع/مصانع ملابس/مصانع ملابس اطفال');

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
    int viewsCount = widget.factoryData['views'] ?? 118; // استخدام الحقل المناسب لعدد المشاهدات
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.factoryData['name'],
          style: TextStyle( color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(widget.factoryData['text'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl),
             
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
  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
             
            children: [
              
                
              Image.asset('assets/image not found.png'),
              SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               GestureDetector(
                onTap: (){
                  Get.back();
                },
                 
                   child: Text("تصفح المزيد ",style: TextStyle(fontSize: 18,color: Colors.blue,decoration: TextDecoration.underline,),
                  textDirection:TextDirection.rtl
                   
                 ),
               ),
             Text('لا توجد صور متاحه الأن ',style: TextStyle(fontSize: 18,),textDirection:TextDirection.rtl,),
              SizedBox(width: 1,),

              
            ],
          ),
           
            ],
          
          ),        ],
                  ],
                ),
              ),
              SizedBox(height: 20,),
                   // قسم عدد المشاهدات
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
    );
  }
}
