import 'package:flutter/material.dart';
import 'package:food_pos/core/theme/app_colors.dart';
import 'package:food_pos/core/utils/ui_kit.dart';

class AppTextField extends StatelessWidget with UIKit {
   AppTextField({Key? key, this.hint}) : super(key: key);
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: roundedDecoration(),
      child: TextFormField(
        decoration:  InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(14),
            hintStyle: TextStyle(
              color: AppColors.textGrey,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            )),
      ),
    );
  }
}
