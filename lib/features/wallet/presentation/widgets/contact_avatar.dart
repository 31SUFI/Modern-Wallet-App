import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ContactAvatar extends StatelessWidget {
  final String? imageUrl;
  final String label;
  final IconData? icon;
  final bool isAdd;
  final bool isSelected;

  const ContactAvatar({
    Key? key,
    this.imageUrl,
    required this.label,
    this.icon,
    this.isAdd = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final avatarSize = size.width * 0.13;

    return SizedBox(
      width: avatarSize * 1.2,
      height: avatarSize * 1.5, // Fixed height container
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isAdd ? Colors.grey[100] : null,
              border: isSelected
                  ? Border.all(color: AppColors.primary, width: 2)
                  : null,
            ),
            child: isAdd
                ? Icon(icon, color: Colors.grey[600], size: avatarSize * 0.5)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(avatarSize / 2),
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          SizedBox(height: avatarSize * 0.1),
          SizedBox(
            height: avatarSize * 0.3,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: avatarSize * 0.25,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
