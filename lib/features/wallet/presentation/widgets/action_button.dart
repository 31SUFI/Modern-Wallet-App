import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final double size;

  const ActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: label.toLowerCase() == 'send'
                  ? AppColors.primary
                  : Colors.grey[100],
              shape: BoxShape.circle,
              boxShadow: label.toLowerCase() == 'send'
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color:
                  label.toLowerCase() == 'send' ? Colors.white : Colors.black87,
              size: size * 0.6,
            ),
          ),
          SizedBox(height: size * 0.2),
          Text(
            label,
            style: TextStyle(
              fontSize: size * 0.3,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
