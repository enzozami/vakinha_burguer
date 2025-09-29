import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha.button.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import './register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextformfield(label: 'Nome'),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextformfield(label: 'E-mail'),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextformfield(label: 'Senha'),
                  const SizedBox(
                    height: 30,
                  ),
                  VakinhaTextformfield(label: 'Confirmar Senha'),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: VakinhaButton(
                      width: context.width,
                      onPressed: () {},
                      label: 'ENTRAR',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
