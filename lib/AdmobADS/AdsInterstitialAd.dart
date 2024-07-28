import 'package:eldalala/AdmobADS/AdMAnager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsInterstitial {
  InterstitialAd? _interstitialAd;

  Future<void> showAd() async {
    if (!AdManager.showAds) return; // التحقق من قيمة متغير عرض الإعلانات

    await InterstitialAd.load(
        adUnitId: AdManager.interstitalAd,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          _interstitialAd = (ad);
          if (_interstitialAd != null) {
            _interstitialAd!.show();
          }
          ad.fullScreenContentCallback =
              FullScreenContentCallback(onAdWillDismissFullScreenContent: (ad) {
            ad.dispose();
          }, onAdFailedToShowFullScreenContent: (ad, Error) {
            ad.dispose();
          });
        }, onAdFailedToLoad: (error) {
          print(error);
        }));
  }
}
