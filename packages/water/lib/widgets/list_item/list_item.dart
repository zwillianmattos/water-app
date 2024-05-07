import 'package:flutter/material.dart';

class WListItem extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final Widget? trailing;

  const WListItem({
    Key? key,
    required this.label,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isClockAspectRatio =
        MediaQuery.of(context).size.height <= 450;

    final double horizontalPadding = isClockAspectRatio ? 45.0 : 16.0;
    final double verticalPadding = isClockAspectRatio ? 5 : 8.0;
    final double fontSize = isClockAspectRatio ? 12 : 14;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Material(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        elevation: 5, // Ajuste conforme necessário
        shadowColor: Color(0xFF7E7E7E).withOpacity(0.14),
        child: ListTile(
          horizontalTitleGap: horizontalPadding,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          title: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.normal,
            ),
            textAlign: isClockAspectRatio ? TextAlign.center : TextAlign.start,
          ),
          trailing: isClockAspectRatio
              ? null
              : (trailing ?? null), // const Icon(Icons.chevron_right)
          onTap: onTap,
          minVerticalPadding: isClockAspectRatio ? 2 : 20,
        ),
      ),
    );
  }
}
