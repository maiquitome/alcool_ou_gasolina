import 'package:alcool_ou_gasolina/widgets/logo.widgets.dart';
import 'package:alcool_ou_gasolina/widgets/modal.dart';
import 'package:alcool_ou_gasolina/widgets/submit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MoneyMaskedTextController _gasolineController = MoneyMaskedTextController();
  MoneyMaskedTextController _ethanolController = MoneyMaskedTextController();
  bool _busy = false;
  bool _completed = false;
  String _resultText = '';
  Color _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        padding: EdgeInsets.all(30),
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Logo(),
            ),
            _completed
                ? Modal(
                    resultMessage: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    gasolineController: _gasolineController,
                    ethanolController: _ethanolController,
                    busy: _busy,
                    submitFunc: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double ethanol = double.parse(
          _ethanolController.text.replaceAll(RegExp(r'[,.]'), ''),
        ) /
        100;

    double gasoline =
        double.parse(_gasolineController.text.replaceAll(RegExp(r'[,.]'), '')) /
            100;

    double result = ethanol / gasoline;

    setState(() {
      _color = Colors.purple;
      _completed = false;
      _busy = true;
    });

    return Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          if (result >= 0.7) {
            _resultText = "Compensa abastecer com Gasolina!";
          } else {
            _resultText = "Compensa abastecer com Álcool!";
          }

          _busy = false;
          _completed = true;
        });
      },
    );
  }

  reset() {
    setState(() {
      _ethanolController = MoneyMaskedTextController();
      _gasolineController = MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
