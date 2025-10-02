import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha.button.dart';
import 'package:validatorless/validatorless.dart';
import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  final _formKey = GlobalKey<FormState>();

  ShoppingCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Visibility(
                    visible: controller.products.isNotEmpty,
                    replacement: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Carrinho',
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Nenhum item adicionado no carrinho!')
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: Text(
                                  'Carrinho',
                                  style: context.textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: controller.clear,
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return Column(
                            children: controller.products
                                .map(
                                  (p) => Container(
                                    margin: EdgeInsets.all(10),
                                    child: PlusMinusBox(
                                      label: p.product.name,
                                      calculateTotal: true,
                                      quantity: p.quantity,
                                      elevated: true,
                                      backgroundColor: Colors.white,
                                      plusCallback: () {
                                        controller.addQuantityInProduct(p);
                                      },
                                      minusCallback: () {
                                        controller.subtractQuantityInProduct(p);
                                      },
                                      price: p.product.price,
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total do pedido',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Obx(() {
                                return Text(
                                  FormatterHelper.formatCurrency(controller.totalValue),
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        Divider(),
                        _AddressField(),
                        Divider(),
                        _CpfField(),
                        Divider(),
                        Spacer(),
                        Center(
                          child: SizedBox(
                            width: context.widthTransformer(reducedBy: 10),
                            child: VakinhaButton(
                              onPressed: () {
                                final formValid = _formKey.currentState?.validate() ?? false;
                                if (formValid) {
                                  controller.createOrder();
                                }
                              },
                              label: 'FINALIZAR',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddressField extends GetView<ShoppingCardController> {
  const _AddressField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
            child: Text(
              'Endereço de entrega',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.address = value;
            },
            validator: Validatorless.required('Endereço obrigatório'),
            decoration: InputDecoration(
              hintText: 'Digite o endereço',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCardController> {
  const _CpfField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
            child: Text(
              'CPF',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.cpf = value;
            },
            validator: Validatorless.multiple([
              Validatorless.required('CPF obrigatório'),
              Validatorless.cpf('CPF inválido'),
            ]),
            decoration: InputDecoration(
              hintText: 'Digite o CPF',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
