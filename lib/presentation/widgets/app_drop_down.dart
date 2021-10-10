import 'package:flutter/material.dart';
import 'package:food_pos/core/theme/app_colors.dart';
import 'package:food_pos/core/utils/ui_kit.dart';

class AppDropDown extends StatelessWidget with UIKit {
  const AppDropDown(
      {Key? key, required this.valueListener, required this.options})
      : super(key: key);
  final ValueNotifier<int> valueListener;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: valueListener,
      builder: (context, value, child) => PopupMenuButton<int>(
        initialValue: value,
        tooltip: "Select category",
        onSelected: (value) => valueListener.value = value,
        itemBuilder: (context) => List.generate(
          options.length,
          (index) => PopupMenuItem(
            value: index,
            child: Text(options[index]),
          ),
        ),
        child: Container(
          height: 48,
          padding: const EdgeInsets.all(14),
          decoration: roundedDecoration(color: AppColors.backgroundDark),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
              width(10),
              Text(options[value]),
            ],
          ),
        ),
      ),
    );
  }
}
