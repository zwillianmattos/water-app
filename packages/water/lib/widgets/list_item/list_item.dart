import 'package:flutter/material.dart';

class WListItem extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final Widget? trailing;
  const WListItem({
    super.key,
    required this.label,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        elevation: 5, // Ajuste conforme necessário
        shadowColor: Color(0xFF7E7E7E).withOpacity(0.14),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          title: Text(
            label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          trailing: trailing ?? const Icon(Icons.chevron_right),
          onTap: onTap,
          minVerticalPadding: 20,
        ),
      ),
    );
  }
}
