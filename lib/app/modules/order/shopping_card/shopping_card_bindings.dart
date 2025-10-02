import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burguer_mobile/app/core/services/shopping_card_service.dart';
import 'package:vakinha_burguer_mobile/app/repositories/order/order_repository.dart';
import 'package:vakinha_burguer_mobile/app/repositories/order/order_repository_impl.dart';
import 'package:vakinha_burguer_mobile/app/services/order/order_services.dart';
import 'package:vakinha_burguer_mobile/app/services/order/order_services_impl.dart';
import './shopping_card_controller.dart';

class ShoppingCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(() => OrderRepositoryImpl(restClient: Get.find<RestClient>()));
    Get.lazyPut<OrderServices>(
        () => OrderServicesImpl(orderRepository: Get.find<OrderRepository>()));

    Get.put(ShoppingCardController(
        authService: Get.find<AuthService>(),
        shoppingCardService: Get.find<ShoppingCardService>(),
        orderServices: Get.find<OrderServices>()));
  }
}
