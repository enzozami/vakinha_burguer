import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';

class IconBadge extends StatelessWidget {
  final int number;
  final IconData icon;

  const IconBadge({
    super.key,
    required this.number,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(icon),
        Visibility(
          visible: number > 0,
          child: Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              maxRadius: 8,
              backgroundColor: Colors.red,
              child: Text(
                number.toString(),
                style: VakinhaUi.textBold.copyWith(fontSize: 9, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
