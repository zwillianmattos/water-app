import 'package:flutter/material.dart';

class WOutlinedButton extends StatefulWidget {
  final void Function()? onPressed;
  final Color? color;
  final String label;

  const WOutlinedButton(
      {super.key, this.onPressed, required this.label, this.color});

  @override
  State<WOutlinedButton> createState() => _WOutlinedButtonState();
}

class _WOutlinedButtonState extends State<WOutlinedButton> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: OutlinedButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
