import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/extension/extension_on_context.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/app/theme/app_colors.dart';
import 'package:vangram/core/assets/gen/assets.gen.dart';
import 'package:vangram/core/widgets/post_card.dart';
import 'package:vangram/features/posts/presentation/posts/controller/posts_cubit.dart';


class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final postsCubit = context.read<PostsCubit>();
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
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => context.pushNamed(Routes.createNewPost, extra: context.read<PostsCubit>()),
                child: Icon(
                  Icons.add,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
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
        Expanded(
          child: BlocBuilder<PostsCubit, PostsState>(
            builder: (context, state) {
              if (state is! PostsLoaded) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return RefreshIndicator.adaptive(
                onRefresh: () => postsCubit.getPosts(),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  itemBuilder: (context, index) => PostCardWidget(
                    post: state.posts[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: state.posts.length,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
