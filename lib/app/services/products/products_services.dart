import 'package:vakinha_burguer_mobile/app/models/product_model.dart';

abstract interface class ProductsServices {
  Future<List<ProductModel>> findAll();
}
