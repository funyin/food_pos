import 'package:flutter/material.dart';
import 'package:food_pos/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final ButtonSize buttonSize;
  final ButtonType buttonType;
  final VoidCallback? onTap;
  AppButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.buttonSize = ButtonSize.normal,
      this.buttonType = ButtonType.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonSize == ButtonSize.small ? 36 : 48,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: buttonType == ButtonType.primary
                ? AppColors.primary
                : Colors.transparent,
            primary: buttonType == ButtonType.primary
                ? Colors.white
                : AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                    color: buttonType == ButtonType.primary
                        ? Colors.transparent
                        : AppColors.border)),
            padding: EdgeInsets.symmetric(
                vertical: buttonSize == ButtonSize.small ? 7 : 24,
                horizontal: buttonSize == ButtonSize.small ? 12 : 16)),
        onPressed: onTap,
        child: Text(
          text,
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary }
enum ButtonSize { normal, small }
