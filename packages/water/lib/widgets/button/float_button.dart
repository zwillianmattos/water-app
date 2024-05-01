import 'package:flutter/material.dart';

class WFloatButton extends StatefulWidget {
  final void Function()? onPressed;
  const WFloatButton({super.key, this.onPressed});

  @override
  State<WFloatButton> createState() => _WFloatButtonState();
}

class _WFloatButtonState extends State<WFloatButton> {
  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Theme.of(context).primaryColor;
    final Color textColor = Theme.of(context).textTheme.labelLarge!.color!;
    return FloatingActionButton(
      elevation: 0,
      highlightElevation: 0,
      onPressed: widget.onPressed,
      child: Icon(
        Icons.add,
        size: 32,
      ),
      backgroundColor: buttonColor,
      foregroundColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
