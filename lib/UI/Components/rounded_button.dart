import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.label,
    @required this.press,
    @required this.margin,
    this.width = 200,
    this.height = 50.0,
    this.fontSize = 16.0, this.textWeight = FontWeight.bold, this.color = Colors.blue,
  }) : super(key: key);

  final String label;
  final Function press;
  final EdgeInsets margin;
  final FontWeight textWeight;
  final Color color;
  final double width, height, fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: RawMaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        fillColor: color,
        child: Text(
          label,
          style: TextStyle(fontSize: fontSize),
        ),
        onPressed: press,
      ),
    );
  }
}
