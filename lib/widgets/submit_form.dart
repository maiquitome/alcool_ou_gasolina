import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'circular_button.widget.dart';
import 'input.widget.dart';

class SubmitForm extends StatelessWidget {
  final MoneyMaskedTextController gasolineController;
  final MoneyMaskedTextController ethanolController;
  final bool busy;
  final Function submitFunc;

  SubmitForm({
    @required this.gasolineController,
    @required this.ethanolController,
    @required this.busy,
    @required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Input(
          label: "Gasolina",
          controller: gasolineController,
        ),
        Input(
          label: "Álcool",
          controller: ethanolController,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: CircularButton(
            'CALCULAR',
            busy: busy,
            invertColor: false,
            func: submitFunc,
          ),
        ),
      ],
    );
  }
}
