import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/constants/config.dart';
import 'package:vangram/core/utils/extension/extension_on_context.dart';

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
        SliverFillRemaining(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                const storage = FlutterSecureStorage();
                storage.delete(key: Config.userTokens);
              },
              child: Text(
                'Выйти',
                style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.kWhiteColor),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
