/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eldalala/Models/CardListITem.dart';
import 'package:eldalala/Models/Item_model.dart';
import 'package:eldalala/Screens/Home_View.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> categories;
  final List<CardList> cards;
  final List<ItemModel> item;

  CustomSearchDelegate(this.categories, this.cards, Type myCard, {required this.item});

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
    return CustomSearchDelegateState(item: item, query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return CustomSearchDelegateState(item: item, query: query, isSuggestions: true);
  }
}

class CustomSearchDelegateState extends StatefulWidget {
  final List<ItemModel> item;
  final String query;
  final bool isSuggestions;

  CustomSearchDelegateState({required this.item, required this.query, this.isSuggestions = false});

  @override
  _CustomSearchDelegateStateState createState() => _CustomSearchDelegateStateState();
}

class _CustomSearchDelegateStateState extends State<CustomSearchDelegateState> {
  List<ItemModel> searchResults = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
    _search(widget.query).then((results) {
      setState(() {
        searchResults = results;
      });
    });
  }
  List<ItemModel> placesList = List<ItemModel>.empty();

  Future<List<ItemModel>> _search(String query) async {
    return await compute(_performSearch, {'query': query, 'items': widget.item});
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
  Widget build(BuildContext context) {
    if (widget.isSuggestions) {
      return Stack(
        children: [
          if (searchResults.isEmpty)
            Positioned.fill(
              child: Image.asset(
                'assets/search background.png',
                fit: BoxFit.cover,
              ),
            ),
          ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(searchResults[index].image),
                ),
                title: Text(searchResults[index].placeName),
                onTap: () {
                  Get.to(() => Profiles(item: searchResults[index]));
                },
              );
            },
          ),
        ],
      );
    } else {
      if (searchResults.isEmpty) {
        return Center(child: Text('No results found'));
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
  }
  Future<void> fetchDataFromFirestore() async {
  try {
    // List to temporarily store search results
    List<ItemModel> tempItemsList = [];

    // Firestore query to retrieve place data
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
      // Add other collections here...
    ];

    // Iterate over each collection and merge the results into the temporary list
    for (var collection in collectionsToQuery) {
      var querySnapshot = await _getCollectionGroupData(collection);
      if (querySnapshot != null) {
        tempItemsList.addAll(_mapQuerySnapshotToItemList(querySnapshot));
      }
    }
    
    // Update search results only if successful
    if (tempItemsList.isNotEmpty) {
      // Update state with the search results
      setState(() {
       placesList = tempItemsList;
      });
    } else {
      print('No data to display.');
      // You can add a message or take another action here
    }
  } catch (error) {
    print('Error occurred while fetching data: $error');
  }
}

Future<QuerySnapshot> _getCollectionGroupData(
    String collectionGroupName) async {
  return await FirebaseFirestore.instance
      .collectionGroup(collectionGroupName)
      .get();
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
    // You can handle the error here, for example, return an empty list or take another action
    return [];
  }
}
}
*/