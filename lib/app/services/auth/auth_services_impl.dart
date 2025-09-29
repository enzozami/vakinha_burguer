import 'package:vakinha_burguer_mobile/app/models/user_model.dart';
import 'package:vakinha_burguer_mobile/app/repositories/auth/auth_repository.dart';

import './auth_services.dart';

class AuthServicesImpl implements AuthServices {
  final AuthRepository _repository;

  AuthServicesImpl({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<UserModel> login(String email, String password) => _repository.login(email, password);

  @override
  Future<UserModel> register(String name, String email, String password) =>
      _repository.register(name, email, password);
}
