import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burguer_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/services/auth/auth_services.dart';

class RegisterController extends GetxController with LoaderMixin, MessagesMixin {
  final AuthServices _authServices;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  // final TextEditingController controller;

  RegisterController({
    required AuthServices authServices,
  }) : _authServices = authServices;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> register(
      {required String name, required String email, required String password}) async {
    try {
      _loading.toggle();
      await _authServices.register(name, email, password);
      _loading.toggle();
      Get.back;
      // TODO: Voltar quando fizer o login
      _message(
        MessageModel(
          title: 'Sucesso',
          message: 'Cadastro realizado com sucesso',
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log('Erro ao register login', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao register usuário', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registrar usuário',
          type: MessageType.error,
        ),
      );
    }
  }
}
