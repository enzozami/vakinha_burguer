import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/services/shopping_card_service.dart';
import './product_detail_controller.dart';

class ProductDetailBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailController(shoppingCardService: Get.find<ShoppingCardService>()));
  }
}
