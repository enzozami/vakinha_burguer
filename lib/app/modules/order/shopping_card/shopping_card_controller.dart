import 'package:get/get.dart';

import 'package:vakinha_burguer_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burguer_mobile/app/core/services/shopping_card_service.dart';
import 'package:vakinha_burguer_mobile/app/models/order.dart';
import 'package:vakinha_burguer_mobile/app/models/shopping_card_model.dart';
import 'package:vakinha_burguer_mobile/app/modules/home/home_controller.dart';
import 'package:vakinha_burguer_mobile/app/services/order/order_services.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;
  final OrderServices _orderServices;

  final _address = ''.obs;
  final _cpf = ''.obs;

  set address(String address) => _address.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  ShoppingCardController(
      {required AuthService authService,
      required ShoppingCardService shoppingCardService,
      required OrderServices orderServices})
      : _authService = authService,
        _shoppingCardService = shoppingCardService,
        _orderServices = orderServices;

  List<ShoppingCardModel> get products => _shoppingCardService.products;
  double get totalValue => _shoppingCardService.totalValue;

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity + 1,
    );
  }

  void subtractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity - 1,
    );
  }

  void clear() => _shoppingCardService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _address.value,
      items: products,
    );

    var orderPix = await _orderServices.createOrder(order);

    orderPix = orderPix.copyWith(totalValue: totalValue);
    clear();
    Get.offNamed('/orders/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
