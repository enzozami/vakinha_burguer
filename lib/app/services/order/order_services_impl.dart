import 'package:vakinha_burguer_mobile/app/models/order.dart';

import 'package:vakinha_burguer_mobile/app/models/order_pix.dart';
import 'package:vakinha_burguer_mobile/app/repositories/order/order_repository.dart';

import './order_services.dart';

class OrderServicesImpl implements OrderServices {
  final OrderRepository _orderRepository;

  OrderServicesImpl({required OrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<OrderPix> createOrder(Order order) => _orderRepository.createOrder(order);
}
