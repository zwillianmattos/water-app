import 'package:flutter/material.dart';

class WFloatButton extends StatefulWidget {
  final void Function()? onPressed;
  final Icon? icon;
  const WFloatButton({super.key, this.onPressed, this.icon});

  @override
  State<WFloatButton> createState() => _WFloatButtonState();
}

class _WFloatButtonState extends State<WFloatButton> {
  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Theme.of(context).primaryColor;
    final Color textColor = Theme.of(context).textTheme.labelLarge!.color!;

    final bool isClockAspectRatio =
        MediaQuery.of(context).size.height <= 450;
    return FloatingActionButton(
      elevation: 0,
      highlightElevation: 0,
      onPressed: widget.onPressed,
      child: widget.icon ?? null,
      backgroundColor: buttonColor,
      foregroundColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      mini: isClockAspectRatio,
    );
  }
}
