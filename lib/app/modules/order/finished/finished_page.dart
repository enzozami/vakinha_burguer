import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha.button.dart';
import 'package:vakinha_burguer_mobile/app/models/order_pix.dart';

class FinishedPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;

  FinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Image.asset(
                  'assets/images/logo_rounded.png',
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 75),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Pedido realizado com sucesso, clique no botão abaixo para acesso o QRCode do pix',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 30),
                  child: VakinhaButton(
                    onPressed: () => Get.toNamed('order/pix', arguments: _orderPix),
                    label: 'PIX',
                    color: context.theme.primaryColorDark,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  width: context.widthTransformer(reducedBy: 10),
                  child: VakinhaButton(
                    onPressed: () => Get.offAllNamed('/home'),
                    label: 'FECHAR',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
