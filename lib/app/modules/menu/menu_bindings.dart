import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/repositories/products/products_repository.dart';
import 'package:vakinha_burguer_mobile/app/repositories/products/products_repository_impl.dart';
import 'package:vakinha_burguer_mobile/app/services/products/products_services.dart';
import 'package:vakinha_burguer_mobile/app/services/products/products_services_impl.dart';
import 'menu_controller.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsRepository>(
        () => ProductsRepositoryImpl(restClient: Get.find<RestClient>()));
    Get.lazyPut<ProductsServices>(
        () => ProductsServicesImpl(productsRepository: Get.find<ProductsRepository>()));
    Get.lazyPut(() => MenuController(productsServices: Get.find<ProductsServices>()));
  }
}
