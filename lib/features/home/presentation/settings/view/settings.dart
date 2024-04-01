import 'package:flutter/material.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          title: FittedBox(
            child: Text(
              'Настройки',
              style: theme.textTheme.titleLarge!.copyWith(
                color: AppColors.kFourColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
