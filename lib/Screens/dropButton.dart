import 'package:flutter/material.dart';

class DropButton extends StatefulWidget {
  final Function(String?) onCategoryChanged;
  final Function(String?) onSubCategoryChanged;

  const DropButton(
      {required this.onCategoryChanged,
      required this.onSubCategoryChanged,
      Key? key});

  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  String? selectedCategory;
  String? selectedSubCategory;

  final Map<String, List<String>> categories = {
    'مصانع ملابس': [
      'مصانع ملابس اطفال',
      "مصانع هوم وير حريمي",
      "مصانع كاجوال حريمي",
      "مصانع  شبابي ورجالي",
      'مصانع عبايات واسدالات',
      "مصانع جينز",
      "مصانع داخلي ولانجري",
      "مصانع طرح ومكملات حجاب",
      "مصانع عبايات كرداسة",
      "مصانع ملابس جسر السويس",
      "مصانع ملابس مدينة العبور",
      "مصانع ملابس العاشر من رمضان",
      "مصانع تصنيع للغير",
      "مصانع ملابس اخري",
    ],
    'مكاتب ملابس': [
      'مكاتب ملابس أطفال',
      'مكاتب ملابس هوم وير حريمي',
      "مكاتب ملابس كاجوال حريمي",
      "مكاتب ملابس شبابي ورجالي",
      "مكاتب عبايات واسدالات",
      "مكاتب جينز",
      "مكاتب داخلي ولالنجري",
      "مكاتب ملابس عمارات رامو",
      "مكاتب ملابس عمارات البترول ",
      "مكاتب مول الشواذليه وصيدناوي والقدس",
      "مكاتب العتبة والموسكي والغورية",
      "مكاتب النزهة الجديده",
      "مكاتب ملابس كاجوال روكسي",
      "مكاتب ملابس وةسط البلد",
      "مكاتب ملابس الترعة البولاقية",
      "مكاتب ملابس جاهزة",
      'مكاتب ملابس اخري',
    ],
    'مصانع احذية وشنط': [
      ' مصانع أحذية كوتشي',
      'مصانع أحذية خفيفه',
      "مصانع احذية شعبي",
      "مصانع أحذية لوكس حريمي",
      "مصانع أحذية لوكس رجالي",
      "مصانع شنط ",
      "مصانع حزام",
      'مصانع احذية وشنط اخري',
    ],
    'مكاتب احذية وشنط': [
      'مستوردين مكاتب أحذية وشنط',
      'مكاتب أحذية وشنط باب الشعرية',
      "مكاتب أحذية وشنط النزهة الجديده",
      'مكاتب احذية وشنط اخري',
    ],
    'محلات': [
      'محلات ملابس أطفال',
      "محلات ملابس حريمي بيتي",
      "محلات حريمي كاجوال",
      "محلات ملابس شباي ورجالي",
      "محلات عبايات واسدالات",
      "محلات جينز",
      "محلات أحذية ",
      "محلات لانجري",
      "محلات مستحضرات تجميل",
      'محلات اخري',
    ],
    'تجار أقمشة': [
      'أقمشة الازهر والغورية ',
      'أقمشة شارع 18 جسر السويس',
      "أقمشة المطرية",
      "أقمشة وكالة البلح",
      'تجار اقمشة اخري',
    ],
    'شركات شحن': ['شركات شحن داخلي ودولي', 'مناديب دفع مقدم'],
    'اكسسوارات': ['اكسسوارات '],
    'مستلزمات انتاج ملابس': [
      'مصانع سوست وشماعات واكياس',
      'اكسسوارات ملابس حارة المزين والموسكي',
      "اكسسوارات ملابس شارع 18",
      "اكسسوارات ملابس الجراج جسر السويس",
      "مطابع",
      "كبس استرس وترانسفير",
      "مكن والات",
      'مستلزمات اخري',
    ],
    'تريكو': [
      'مصانع طنامل ',
      'مصانع اجا-المنصورة',
      "مصانع تريكو ",
    ],
    'مفروشات ووبريات': [
      'ستائر',
      'اقمشة تنجيد ',
      "فوط وملايات سرير ولحفه",
      "بطاطين ودفايات",
    ],
    'مستلزمات انتاج احذية': ['مستزمات انتاج احذية'],
    'مستحضرات تجميل': ['مستحضرات تجميل'],
    'ادوات منزلية': ['ادوات منزلية'],
    'العاب اطفال': ['العاب اطفال'],
    'موبايلات': ['موبايلات'],
    'طباعة وتطريز': ['طباعة وتطريز'],
    'شرابات': ['شرابات'],
    'استوك وبواقي تصدير': ['استوك وبواقي تصدير'],
    'مواد تغليف': ['مواد تغليف'],
    'مطاعم': ['مطاعم'],
    'كافيهات': ['كافيهات'],
    'الكترونيات': ['الكترونيات'],
    'اجهزة منزلية': ['اجهزة منزلية'],
    'مراكز تجميل': ['مراكز تجميل'],
    'معامل تحاليل': ['معامل تحاليل'],
    'استثمار عقاري': ['استثمار عقاري'],
    'اضاءة ونجف': ['اضاءة ونجف'],
    'مستعمل': ['مستعمل'],
    'تجهيز محلات ومكاتب': ['تجهيز محلات ومكاتب'],
    'تسويق الكتروني': ['شركات تسويق الكتروني', 'مسوقات بالعمولة'],
    'أخري': ['أخري'],
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildDropdownButton(
            categories.keys.toList(),
            selectedCategory,
            (value) {
              setState(() {
                selectedCategory = value as String?;
                selectedSubCategory = null;
              });
            },
            'الصفة',
          ),
          const SizedBox(height: 16),
          if (selectedCategory != null)
            buildDropdownButton(
              categories[selectedCategory!]!,
              selectedSubCategory,
              (value) {
                setState(() {
                  selectedSubCategory = value as String?;
                  widget.onCategoryChanged(value);
                });
              },
              'اختر القسم الفرعي',
            ),
        ],
      ),
    );
  }

  Widget buildDropdownButton(
    List<String> items,
    String? value,
    void Function(String?) onChanged,
    String hintText,
  ) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      hint: Text(hintText),
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
