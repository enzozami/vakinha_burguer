import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burguer_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burguer_mobile/app/services/auth/auth_services.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthServices _authServices;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required AuthServices authServices,
  }) : _authServices = authServices;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    _loading.toggle();
    await _authServices.login(email, password);
    _loading.toggle();
    _message(
      MessageModel(
        title: 'Sucesso',
        message: 'Login realizado com sucesso',
        type: MessageType.info,
      ),
    );
  }
}
