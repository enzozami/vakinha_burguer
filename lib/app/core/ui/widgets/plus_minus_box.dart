import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_rounded_button.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calculateTotal;

  const PlusMinusBox({
    super.key,
    required this.quantity,
    required this.plusCallback,
    required this.minusCallback,
    required this.price,
    this.elevated = false,
    this.backgroundColor,
    this.label,
    this.calculateTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VakinhaRoundedButton(
                  onPressed: minusCallback,
                  label: '-',
                ),
                Text('$quantity'),
                VakinhaRoundedButton(
                  onPressed: plusCallback,
                  label: '+',
                ),
              ],
            ),
            Visibility(
              visible: label == null,
              child: Spacer(),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 10),
              constraints: BoxConstraints(minWidth: 70),
              child: Text(
                FormatterHelper.formatCurrency(calculateTotal ? price * quantity : price),
              ),
            )
          ],
        ),
      ),
    );
  }
}
