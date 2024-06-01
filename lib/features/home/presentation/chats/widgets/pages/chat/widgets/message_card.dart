import 'package:flutter/material.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/assets/gen/assets.gen.dart';
import 'package:vangram/core/formatter/formatter.dart';
import 'package:vangram/features/home/domain/entities/messages/message_entity.dart';
import 'package:vangram/features/home/domain/entities/messages/user_message_entity.dart';

class MessageCardWidget extends StatelessWidget {
  const MessageCardWidget({super.key, required this.user, required this.message});

  final UserMessageEntity user;
  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return switch (message.isMine) {
      false => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: user.photo == null
                      ? AssetImage(Assets.images.logo.path)
                      : NetworkImage(user.photo!) as ImageProvider,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: AppColors.kGreyColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message.body,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    timeFormat.format(message.createdAt),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      _ => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: AppColors.kPrimaryColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message.body,
                    style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.kWhiteColor),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    timeFormat.format(message.createdAt),
                    style: theme.textTheme.bodySmall!.copyWith(color: AppColors.kTimeMessageColor),
                  ),
                ],
              ),
            ),
          ],
        ),
    };
  }
}
