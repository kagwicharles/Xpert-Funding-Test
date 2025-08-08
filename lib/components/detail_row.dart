import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool hasIcon;

  const DetailRow({
    Key? key,
    required this.label,
    required this.value,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (hasIcon) ...[
          const SizedBox(width: 4),
          const Icon(Icons.info_outline, color: Color(0xFF6B7280), size: 16),
        ],
      ],
    );
  }
}
