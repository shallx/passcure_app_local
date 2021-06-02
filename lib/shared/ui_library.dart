import 'package:flutter/material.dart';

class CLRoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double padding;
  final Function onPressed;
  const CLRoundedIconButton({
    Key key,
    @required this.icon,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.padding = 6,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.arrow_back_ios_outlined, color: iconColor),
      ),
    );
  }
}

class Pills extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color textColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;
  const Pills({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white, this.margin = const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: Colors.teal[50],
        ),
      ),
    );
  }
}
