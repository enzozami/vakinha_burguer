import 'package:vakinha_burguer_mobile/app/models/product_model.dart';
import 'package:vakinha_burguer_mobile/app/repositories/products/products_repository.dart';

import './products_services.dart';

class ProductsServicesImpl implements ProductsServices {
  final ProductsRepository _productsRepository;

  ProductsServicesImpl({
    required ProductsRepository productsRepository,
  }) : _productsRepository = productsRepository;

  @override
  Future<List<ProductModel>> findAll() => _productsRepository.findAll();
}
