import 'package:flutter/material.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          title: Text(
            'Чаты',
            style: theme.textTheme.titleLarge!.copyWith(
              color: AppColors.kSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
