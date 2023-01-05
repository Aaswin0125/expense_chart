import 'package:flutter/material.dart';

class chartbar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingpctoftotal;

  chartbar(this.label, this.spendingAmount, this.spendingpctoftotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${spendingAmount.toStringAsFixed(0)}'),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 1.0),
                        color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
