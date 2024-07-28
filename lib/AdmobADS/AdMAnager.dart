class AdManager {
  static bool isTest = false;
  static bool showAds = true; // إضافة متغير للتحكم في عرض الإعلانات

  static String interstitalAd = isTest
      ? "ca-app-pub-3940256099942544/1033173712"
      : "ca-app-pub-4586163529699449/2841580247";
}
