import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/assets/gen/assets.gen.dart';
import 'package:vangram/core/utils/extension/extension_on_context.dart';
import 'package:vangram/core/utils/formatter/formatter.dart';
import 'package:vangram/features/posts/domain/entities/post/post_entity.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    super.key,
    required this.post,
  });

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffE5E5E5),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.kHintColor,
                backgroundImage: post.user.photo == null
                    ? AssetImage(Assets.images.logo.path)
                    : NetworkImage(post.user.photo) as ImageProvider,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${post.user.name} ${post.user.surname}',
                    style: theme.textTheme.bodyMedium,
                  ),
                  Text(
                    dateFormat.format(post.createdAt),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              post.photo,
              fit: BoxFit.cover,
            ),
          ),
          if (post.body.isNotEmpty)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  post.body,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.heart,
                    height: 25,
                    colorFilter: ColorFilter.mode(
                      AppColors.kBlackColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  if (post.countLikes != 0)
                    Text(
                      post.countLikes.toString(),
                      style: theme.textTheme.bodySmall!.copyWith(color: AppColors.kBlackColor),
                    ),
                ],
              ),
              SvgPicture.asset(
                Assets.icons.comment,
                height: 25,
                colorFilter: ColorFilter.mode(
                  AppColors.kBlackColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
