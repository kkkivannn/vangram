import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/formatter/romatter.dart';
import 'package:vangram/features/home/presentation/posts/controller/posts_cubit.dart';
import 'package:vangram/gen/assets.gen.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      children: [
        AppBar(
          centerTitle: false,
          title: Text(
            'Moments',
            style: theme.textTheme.titleLarge!.copyWith(
              color: AppColors.kPrimaryColor,
              fontSize: 42,
              fontFamily: 'Arizonia',
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: SvgPicture.asset(
                Assets.icons.bell,
                height: 30,
                colorFilter: ColorFilter.mode(
                  AppColors.kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            if (state is! PostsLoaded) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                itemBuilder: (context, index) => Container(
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
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${state.posts[index].user.name} ${state.posts[index].user.surname}',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        dateFormat.format(state.posts[index].createdAt),
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          state.posts[index].photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        state.posts[index].body,
                        style: theme.textTheme.bodyLarge,
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
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: state.posts.length,
              ),
            );
          },
        )
      ],
    );
  }
}
