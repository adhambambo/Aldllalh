import 'package:eldalala/Screens/view_auth.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewMode());
  }
}
