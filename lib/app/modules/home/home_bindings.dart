import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/services/shopping_card_service.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(shoppingCardService: Get.find<ShoppingCardService>()));
  }
}
