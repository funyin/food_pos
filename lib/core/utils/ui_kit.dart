import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_pos/core/theme/app_colors.dart';

mixin UIKit {
  height(double value) => SizedBox(height: value);

  width(double value) => SizedBox(width: value);

  divider() => const Divider(
        color: AppColors.border,
        thickness: 1,
        height: 1,
      );

  formSpace() => height(16);

  BoxDecoration roundedDecoration(
          {Color color = AppColors.background,
          Color borderColor = AppColors.border}) =>
      BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8));
}
