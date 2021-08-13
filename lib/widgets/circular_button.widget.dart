import 'package:flutter/material.dart';

const _border_radius = 28.0;
const _container_height = 56.0;
const _font_size = 24.0;

class CircularButton extends StatelessWidget {
  final String text;
  final double surroundingSpaces;
  final double fontSize;
  final bool busy;
  final bool invertColor;
  final Function func;

  CircularButton(
    this.text, {
    this.surroundingSpaces,
    this.fontSize,
    @required this.busy,
    @required this.func,
    @required this.invertColor,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            height: _container_height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: invertColor
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(_border_radius),
            ),
            child: FlatButton(
              child: Text(
                text,
                style: TextStyle(
                  color: invertColor
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: fontSize != null ? fontSize : _font_size,
                ),
              ),
              onPressed: func,
            ),
          );
  }
}
