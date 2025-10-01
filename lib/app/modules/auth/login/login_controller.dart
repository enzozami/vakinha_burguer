import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burguer_mobile/app/core/exceptions/user_not_found_exception.dart';
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
    try {
      _loading.toggle();
      final userLogged = await _authServices.login(email, password);
      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);

      log('SUCESSOOOOOOOOOOOOOOOOOOOOOO');
    } on UserNotFoundException catch (e, s) {
      _loading.toggle();
      log('Login ou senha inválidos', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Login ou senha inválidos',
        type: MessageType.error,
      ));
    } catch (e, s) {
      _loading.toggle();
      log('Login ou senha inválidos', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Erro',
        message: 'Erro ao realizar login',
        type: MessageType.error,
      ));
    } finally {
      _loading(false);
    }
  }
}
