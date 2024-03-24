import 'package:flutter/material.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return ElevatedButton(
      onPressed: onTap,
      style: theme.elevatedButtonTheme.style,
      child: Text(
        'Создать аккаунт',
        style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.kWhiteColor),
      ),
    );
  }
}
