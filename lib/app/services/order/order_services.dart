import 'package:vakinha_burguer_mobile/app/models/order.dart';
import 'package:vakinha_burguer_mobile/app/models/order_pix.dart';

abstract interface class OrderServices {
  Future<OrderPix> createOrder(Order order);
}
