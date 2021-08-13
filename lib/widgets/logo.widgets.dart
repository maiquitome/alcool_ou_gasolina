import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          "assets/images/aog-white.png",
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Álcool ou Gasolina?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
