import 'package:flutter/material.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/widgets/custom_text_field.dart';

class CreateChatPage extends StatelessWidget {
  const CreateChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    // final chatsBloc = context.read<ChatsBloc>();
    // final createChatsBloc = context.read<CreateChatBloc>();
    return Scaffold(
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Создать',
              style: theme.textTheme.bodyLarge!.copyWith(color: AppColors.kWhiteColor),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            title: Text(
              'Новый чат',
              style: theme.textTheme.titleLarge!.copyWith(color: AppColors.kPrimaryColor),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  CustomTextField(
                    autoFocus: true,
                    maxLines: 14,
                    minLines: 1,
                    hintText: 'Название чата',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
