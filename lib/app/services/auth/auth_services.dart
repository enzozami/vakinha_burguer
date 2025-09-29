import 'package:vakinha_burguer_mobile/app/models/user_model.dart';

abstract interface class AuthServices {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
}
