import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/formatter/romatter.dart';
import 'package:vangram/features/home/domain/entities/post/post_entity.dart';
import 'package:vangram/gen/assets.gen.dart';

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
              Text(
                '${post.user.name} ${post.user.surname}',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            dateFormat.format(post.createdAt),
            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
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
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                Assets.icons.heart,
                height: 30,
                colorFilter: ColorFilter.mode(
                  AppColors.kBlackColor,
                  BlendMode.srcIn,
                ),
              ),
              SvgPicture.asset(
                Assets.icons.comment,
                height: 30,
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
