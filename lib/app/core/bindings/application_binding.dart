import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository_impl.dart';
import 'package:vakinha_burguer_mobile/app/services/auth/auth_services.dart';
import 'package:vakinha_burguer_mobile/app/services/auth/auth_services_impl.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClient>(() => RestClient(), fenix: true);
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(restClient: Get.find<RestClient>()));
    Get.lazyPut<AuthServices>(() => AuthServicesImpl(repository: Get.find<AuthRepository>()));
  }
}
