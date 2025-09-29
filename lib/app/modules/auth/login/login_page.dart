import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha.button.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/login/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColorDark,
                        ),
                      ),
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
                      Center(
                        child: VakinhaButton(
                          width: context.width,
                          onPressed: () {},
                          label: 'ENTRAR',
                        ),
                      ),
                      Spacer(), // o Spacer funciona como uma sizedBox, porem sua utilização é na verdade para jogar todos os items para o final da tela
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Não possui uma conta?'),
                          TextButton(
                            onPressed: () => Get.toNamed('/auth/register'),
                            child: Text(
                              'Cadastre-se',
                              style: VakinhaUi.textBold,
                            ),
                          ),
                        ],
                      )
                    ],
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
