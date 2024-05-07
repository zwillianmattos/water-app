import 'package:flutter/material.dart';

class WTextButton extends StatefulWidget {
  final void Function()? onPressed;
  final Color? color;
  final String label;

  const WTextButton(
      {super.key, this.onPressed, required this.label, this.color});

  @override
  State<WTextButton> createState() => _WTextButtonState();
}

class _WTextButtonState extends State<WTextButton> {
  @override
  Widget build(BuildContext context) {
    final Color buttonColor = widget.color ?? Theme.of(context).primaryColor;
    final Color textColor = Theme.of(context).textTheme.labelLarge!.color!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor.withOpacity(0.5),
          backgroundColor: buttonColor,
          minimumSize: Size(double.infinity, 42),
          maximumSize: Size(double.infinity, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
