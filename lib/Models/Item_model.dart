class ItemModel {
  late final String image;
  final String placeName;
  final String address;
  final String location;
  final String phoneNumber;
  final String facebookLink;
  final String WhatsAppLink;
  final String? tiktokLink;

  final String? facebookCustomText;
  final String phoneCustomText;
  final String WhatsAppCustomText;
  final String locationCustomText;
  final String telegramCustomText;
  final String instagramCustomText;
  final String? text;
  late final String? image1;
  final String? image2;
  final String? image3;
  final String? image4;
  final String? imageUrl;

  final String instagramLink; // إضافة رابط الإنستجرام
  final String telegramLink; // إضافة رابط التليجرام
  ItemModel({
    this.tiktokLink,
    required this.instagramCustomText,
    required this.telegramCustomText,
    required this.instagramLink,
    required this.telegramLink,
    required this.facebookCustomText,
    required this.phoneCustomText,
    // ignore: non_constant_identifier_names
    required this.WhatsAppCustomText,
    required this.locationCustomText,
    // ignore: non_constant_identifier_names
    required this.WhatsAppLink,
    required this.image,
    required this.placeName,
    required this.address,
    required this.location,
    required this.phoneNumber,
    required this.facebookLink,
    this.text,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.imageUrl,
    // ignore: non_constant_identifier_names
    required String WhatsAppNumber,
    // ignore: non_constant_identifier_names
  });
}
