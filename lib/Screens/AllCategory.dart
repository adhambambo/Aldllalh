import 'package:eldalala/Cores/Custom_Colors.dart';
import 'package:flutter/material.dart';
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
class CategoriesPage extends StatelessWidget {
  final bool showMoreCategories = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('فئات الدلالة'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(child: _ListViewCategory(context)),
    );
  }

  Widget _ListViewCategory(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عرض العناصر في صفين
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75, // نسبة العرض إلى الارتفاع للعناصر
              ),
              itemCount: showMoreCategories ? categories.length : 33,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => categories[index]['page'],
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kPrimaryColor,
                              width: 2.0,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              categories[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          categories[index]['name'],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
