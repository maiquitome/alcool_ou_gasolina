import 'package:flutter/material.dart';

import 'circular_button.widget.dart';

class Modal extends StatelessWidget {
  final String resultMessage;
  final Function reset;

  Modal({
    @required this.resultMessage,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          Text(
            resultMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CircularButton(
              'CALCULAR NOVAMENTE',
              fontSize: 16.0,
              busy: false,
              invertColor: true,
              func: reset,
            ),
          ),
        ],
      ),
    );
  }
}
