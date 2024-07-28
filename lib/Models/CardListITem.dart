import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:page_transition/page_transition.dart';

class CardList extends StatelessWidget {
  final List<MyCard> cards;

  CardList({required this.cards});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: cards[index],
        );
      },
    );
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath; // تم استبدال imageUrl ب imagePath
  final Widget page;

  MyCard({
    required this.title,
    required this.subtitle,
    required this.page,
    required this.imagePath, // تم استبدال imageUrl ب imagePath
  });

  Future<String> getImageUrl(String imagePath) async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child(imagePath);

    try {
      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error getting download URL: $e');
      return ''; // يمكنك التعديل على هذا حسب احتياجاتك
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String imageUrl =
            await getImageUrl(imagePath); // استدعاء دالة الحصول على الرابط
       Navigator.push(
  context,
  PageTransition(
    type: PageTransitionType.rightToLeft,
    child: page,
  ),
);

      },
      child: Card(
        elevation: 5.0,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.contain,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            ListTile(
              title: Center(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(subtitle),
            ),
          ],
        ),
      ),
    );
  }
}
