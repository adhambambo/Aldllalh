import 'package:eldalala/Models/Item_model.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.item, required this.color})
      : super(key: key);

  final ItemModel item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: color,
      child: Row(
        children: [
          Container(
            color: const Color.fromARGB(255, 97, 82, 82),
            child: Image.asset(item.image),
          ),
          Expanded(
            child: ItemInfo(item: item),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.placeName,
                    style: const TextStyle(color: Colors.white)),
                Text(item.address, style: const TextStyle(color: Colors.white)),
                // يمكنك إضافة مزيد من البيانات حسب الحاجة
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.placeName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(item.address),
        Text(item.location),
        Text(item.phoneNumber),
        Text(item.facebookLink),
        // يمكنك إضافة المزيد من المعلومات حسب الحاجة
      ],
    );
  }
}
