import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository_impl.dart';
import 'package:vakinha_burguer_mobile/app/services/auth/auth_services.dart';
import 'package:vakinha_burguer_mobile/app/services/auth/auth_services_impl.dart';
import './register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(restClient: Get.find<RestClient>()));
    Get.lazyPut<AuthServices>(() => AuthServicesImpl(repository: Get.find<AuthRepository>()));
    Get.lazyPut(() => RegisterController(authServices: Get.find<AuthServices>()));
  }
}
