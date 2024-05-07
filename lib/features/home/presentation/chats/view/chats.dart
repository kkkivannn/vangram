import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/app/theme/app_colors.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    // final bloc = context.read<>()
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          pinned: true,
          title: Text(
            'Чаты',
            style: theme.textTheme.titleLarge!.copyWith(
              color: AppColors.kSecondaryColor,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => context.pushNamed(Routes.createChat),
                child: Icon(
                  Icons.add_circle_outline_rounded,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
