import 'package:flutter/material.dart';

class Invitewidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String sublabel;
  final Color color;
  const Invitewidget({
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(icon, size: 34),
            ),
          ),
          SizedBox(height: 6),
          SizedBox(
            width: 80,
            child: Column(
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),

                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  sublabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
