import 'package:flutter/material.dart';

class showSnackBar extends StatefulWidget {
  final String text;

  const showSnackBar(this.text);

  @override
  _showSnackBarState createState() => _showSnackBarState();
}

class _showSnackBarState extends State<showSnackBar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(widget.text),
    );
  }
}
