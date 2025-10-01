import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burguer_mobile/app/core/services/shopping_card_service.dart';
import './shopping_card_controller.dart';

class ShoppingCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ShoppingCardController(
        authService: Get.find<AuthService>(),
        shoppingCardService: Get.find<ShoppingCardService>()));
  }
}
