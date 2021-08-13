import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  final String label;
  final MoneyMaskedTextController controller;

  Input({
    @required this.label,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 20.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              letterSpacing: 1.2,
              fontFamily: "Big Shoulders Display",
            ),
          ),
        ),
        /* Expanded para o TextFormField aparecer */
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontFamily: "Big Shoulders Display",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
